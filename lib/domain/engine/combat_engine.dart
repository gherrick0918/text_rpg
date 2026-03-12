import '../models/player.dart';
import '../models/enemy.dart';
import 'dice.dart';
import 'check_system.dart';
import 'luck_system.dart';
import '../../core/logger/run_logger.dart';

enum CombatActionType {
  attack,
  defend,
  useItem,
  specialAbility,
  magic,
  move,
  flee,
}

enum CombatResultType {
  hit,
  miss,
  criticalHit,
  criticalMiss,
  fled,
  fleeBlocked,
}

class CombatActionResult {
  final CombatActionType actionType;
  final CombatResultType resultType;
  final int damageDealt;
  final int actionPointCost;
  final LuckResult luckResult;
  final String narrative;

  const CombatActionResult({
    required this.actionType,
    required this.resultType,
    required this.damageDealt,
    required this.actionPointCost,
    required this.luckResult,
    required this.narrative,
  });
}

class CombatState {
  final Player player;
  final Enemy enemy;
  final int round;
  final bool playerDefending;
  final bool enemyDefending;
  final bool combatOver;
  final bool playerWon;
  final List<CombatActionResult> log;

  const CombatState({
    required this.player,
    required this.enemy,
    required this.round,
    this.playerDefending = false,
    this.enemyDefending = false,
    this.combatOver = false,
    this.playerWon = false,
    this.log = const [],
  });

  CombatState copyWith({
    Player? player,
    Enemy? enemy,
    int? round,
    bool? playerDefending,
    bool? enemyDefending,
    bool? combatOver,
    bool? playerWon,
    List<CombatActionResult>? log,
  }) {
    return CombatState(
      player: player ?? this.player,
      enemy: enemy ?? this.enemy,
      round: round ?? this.round,
      playerDefending: playerDefending ?? this.playerDefending,
      enemyDefending: enemyDefending ?? this.enemyDefending,
      combatOver: combatOver ?? this.combatOver,
      playerWon: playerWon ?? this.playerWon,
      log: log ?? this.log,
    );
  }
}

class CombatEngine {
  // Action point costs
  static const int attackCost = 2;
  static const int defendCost = 1;
  static const int useItemCost = 1;
  static const int specialAbilityCost = 3;
  static const int magicCost = 3;
  static const int moveCost = 1;
  static const int fleeCost = 2;

  // Defense damage reduction
  static const double defenseReductionMultiplier = 0.5;

  // Base target numbers for combat
  static const int baseHitTarget = 12;
  static const int baseFleeTarget = 14;

  // --- Initialise ---

  static CombatState beginCombat({
    required Player player,
    required Enemy enemy,
  }) {
    RunLogger.info('CombatEngine', 
      'Combat begins: "${player.name}" (L${player.level} ${player.currentHealth}/${player.stats.maxHealth}HP '
      '${player.currentActionPoints}AP) vs "${enemy.name}" (T${enemy.tier} '
      '${enemy.currentHealth}/${enemy.stats.maxHealth}HP ${enemy.currentActionPoints}AP)');
    
    return CombatState(
      player: player.refreshActionPoints(),
      enemy: enemy.refreshActionPoints(),
      round: 1,
      log: const [],
    );
  }

  static CombatState beginNextRound(CombatState state) {
    RunLogger.info('CombatEngine', 
      'Round ${state.round + 1} begins: Player(${state.player.currentHealth}HP) '
      'vs "${state.enemy.name}"(${state.enemy.currentHealth}HP) - AP refreshed');
    
    return state.copyWith(
      player: state.player.refreshActionPoints(),
      enemy: state.enemy.refreshActionPoints(),
      round: state.round + 1,
      playerDefending: false,
      enemyDefending: false,
    );
  }

  // --- Player Actions ---

  static CombatState playerAttacks(CombatState state) {
    if (state.player.currentActionPoints < attackCost) {
      RunLogger.warn('CombatEngine', 
        'Attack blocked: insufficient AP (${state.player.currentActionPoints}/$attackCost)');
      return state; // Not enough AP — engine silently ignores
    }

    final player = state.player.spendActionPoints(attackCost);
    final targetNumber = _hitTarget(state.enemy);

    RunLogger.info('CombatEngine', 
      'Player attacks: ${attackCost}AP spent (${state.player.currentActionPoints} → ${player.currentActionPoints}), '
      'target=$targetNumber');

    // Roll to hit
    final hitCheck = CheckSystem.resolve(
      attribute: CheckAttribute.strength,
      stats: player.stats,
      targetNumber: targetNumber,
    );

    if (!hitCheck.isSuccess) {
      final resultType = hitCheck.outcome == CheckOutcome.criticalFailure
          ? CombatResultType.criticalMiss
          : CombatResultType.miss;
      
      RunLogger.info('CombatEngine', 
        'Attack missed: roll=${hitCheck.finalTotal} vs $targetNumber, outcome=${hitCheck.outcome.name}');
      
      final result = CombatActionResult(
        actionType: CombatActionType.attack,
        resultType: resultType,
        damageDealt: 0,
        actionPointCost: attackCost,
        luckResult: hitCheck.luckResult,
        narrative: hitCheck.isCritical ? 'A catastrophic miss.' : 'The attack misses.',
      );
      return _appendLog(state.copyWith(player: player), result);
    }

    // Roll for damage
    int damage = Dice.rollFromString('1d6'); // Base damage — weapon will override later
    final luckResult = LuckSystem.resolve(player.stats.luck);
    damage += luckResult.modifier;
    damage = damage.clamp(1, 999);
    
    final baseDamage = damage;

    // Apply armor and defense reduction
    damage = _applyDefenseReduction(damage, state.enemy.armorValue, state.enemyDefending);

    final isCrit = hitCheck.outcome == CheckOutcome.criticalSuccess;
    if (isCrit) damage = (damage * 1.5).round();

    RunLogger.info('CombatEngine', 
      'Attack hit: roll=${hitCheck.finalTotal} vs $targetNumber, '
      'base_damage=$baseDamage luck=${luckResult.modifier} '
      'armor_reduced=$damage crit=$isCrit final=$damage');

    final updatedEnemy = state.enemy.takeDamage(damage);

    final result = CombatActionResult(
      actionType: CombatActionType.attack,
      resultType: isCrit ? CombatResultType.criticalHit : CombatResultType.hit,
      damageDealt: damage,
      actionPointCost: attackCost,
      luckResult: luckResult,
      narrative: isCrit
          ? 'A critical strike for $damage damage!'
          : 'The attack connects for $damage damage.',
    );

    final newState = state.copyWith(player: player, enemy: updatedEnemy);
    final loggedState = _appendLog(newState, result);

    // Check if enemy is defeated
    if (!updatedEnemy.isAlive) {
      RunLogger.info('CombatEngine', 
        'Enemy "${state.enemy.name}" defeated! ($damage damage reduced ${state.enemy.currentHealth} → 0)');
      return loggedState.copyWith(combatOver: true, playerWon: true);
    }

    return loggedState;
  }

  static CombatState playerDefends(CombatState state) {
    if (state.player.currentActionPoints < defendCost) return state;

    final player = state.player.spendActionPoints(defendCost);
    final result = CombatActionResult(
      actionType: CombatActionType.defend,
      resultType: CombatResultType.hit,
      damageDealt: 0,
      actionPointCost: defendCost,
      luckResult: LuckResult.none,
      narrative: 'You brace for the next attack.',
    );

    return _appendLog(
      state.copyWith(player: player, playerDefending: true),
      result,
    );
  }

  static CombatState playerFlees(CombatState state) {
    if (state.player.currentActionPoints < fleeCost) return state;

    final player = state.player.spendActionPoints(fleeCost);

    final fleeCheck = CheckSystem.resolve(
      attribute: CheckAttribute.agility,
      stats: player.stats,
      targetNumber: baseFleeTarget,
    );

    if (fleeCheck.isSuccess) {
      final result = CombatActionResult(
        actionType: CombatActionType.flee,
        resultType: CombatResultType.fled,
        damageDealt: 0,
        actionPointCost: fleeCost,
        luckResult: fleeCheck.luckResult,
        narrative: 'You escape from combat.',
      );
      return _appendLog(
        state.copyWith(player: player, combatOver: true, playerWon: false),
        result,
      );
    }

    final result = CombatActionResult(
      actionType: CombatActionType.flee,
      resultType: CombatResultType.fleeBlocked,
      damageDealt: 0,
      actionPointCost: fleeCost,
      luckResult: fleeCheck.luckResult,
      narrative: 'You fail to escape.',
    );
    return _appendLog(state.copyWith(player: player), result);
  }

  static CombatState playerMoves(CombatState state) {
    if (state.player.currentActionPoints < moveCost) return state;

    final player = state.player.spendActionPoints(moveCost);
    final result = CombatActionResult(
      actionType: CombatActionType.move,
      resultType: CombatResultType.hit,
      damageDealt: 0,
      actionPointCost: moveCost,
      luckResult: LuckResult.none,
      narrative: 'You reposition yourself.',
    );
    // Move penalty is handled in the next attack check — tracked via state flag if needed later
    return _appendLog(state.copyWith(player: player), result);
  }

  // --- Enemy Turn ---

  static CombatState resolveEnemyTurn(CombatState state) {
    if (state.combatOver) return state;

    final action = _selectEnemyAction(state);

    switch (action) {
      case CombatActionType.attack:
        return _enemyAttacks(state);
      case CombatActionType.defend:
        return _enemyDefends(state);
      default:
        return _enemyAttacks(state); // Fallback
    }
  }

  static CombatActionType _selectEnemyAction(CombatState state) {
    switch (state.enemy.behavior) {
      case EnemyBehavior.aggressive:
        return CombatActionType.attack;
      case EnemyBehavior.defensive:
        // Defend if bloodied, otherwise attack
        return state.enemy.isBloodied
            ? CombatActionType.defend
            : CombatActionType.attack;
      case EnemyBehavior.tactical:
        // Attack unless player is defending — then also attack (no wasted turns)
        return CombatActionType.attack;
      case EnemyBehavior.erratic:
        // Random choice between attack and defend
        return Dice.percentageCheck(70)
            ? CombatActionType.attack
            : CombatActionType.defend;
    }
  }

  static CombatState _enemyAttacks(CombatState state) {
    if (state.enemy.currentActionPoints < attackCost) return state;

    final enemy = state.enemy.spendActionPoints(attackCost);

    final hitCheck = CheckSystem.resolve(
      attribute: CheckAttribute.strength,
      stats: enemy.stats,
      targetNumber: _hitTarget(state.player),
    );

    if (!hitCheck.isSuccess) {
      final result = CombatActionResult(
        actionType: CombatActionType.attack,
        resultType: CombatResultType.miss,
        damageDealt: 0,
        actionPointCost: attackCost,
        luckResult: hitCheck.luckResult,
        narrative: '${enemy.name} attacks but misses.',
      );
      return _appendLog(state.copyWith(enemy: enemy), result);
    }

    int damage = Dice.rollFromString(enemy.damageDice);
    final luckResult = LuckSystem.resolve(enemy.stats.luck);
    damage += luckResult.modifier;
    damage = damage.clamp(1, 999);

    damage = _applyDefenseReduction(damage, 0, state.playerDefending);

    final isCrit = hitCheck.outcome == CheckOutcome.criticalSuccess;
    if (isCrit) damage = (damage * 1.5).round();

    final updatedPlayer = state.player.takeDamage(damage);

    final result = CombatActionResult(
      actionType: CombatActionType.attack,
      resultType: isCrit ? CombatResultType.criticalHit : CombatResultType.hit,
      damageDealt: damage,
      actionPointCost: attackCost,
      luckResult: luckResult,
      narrative: isCrit
          ? '${enemy.name} lands a critical hit for $damage damage!'
          : '${enemy.name} hits for $damage damage.',
    );

    final newState = state.copyWith(player: updatedPlayer, enemy: enemy);
    final loggedState = _appendLog(newState, result);

    if (!updatedPlayer.isAlive) {
      return loggedState.copyWith(combatOver: true, playerWon: false);
    }

    return loggedState;
  }

  static CombatState _enemyDefends(CombatState state) {
    final enemy = state.enemy.spendActionPoints(defendCost);
    final result = CombatActionResult(
      actionType: CombatActionType.defend,
      resultType: CombatResultType.hit,
      damageDealt: 0,
      actionPointCost: defendCost,
      luckResult: LuckResult.none,
      narrative: '${state.enemy.name} braces defensively.',
    );
    return _appendLog(state.copyWith(enemy: enemy, enemyDefending: true), result);
  }

  // --- Helpers ---

  static int _hitTarget(dynamic target) {
    // Agility bonus raises the target number to hit
    if (target is Player) {
      return baseHitTarget + target.stats.agilityBonus;
    } else if (target is Enemy) {
      return baseHitTarget + target.stats.agilityBonus;
    }
    return baseHitTarget;
  }

  static int _applyDefenseReduction(int damage, int armorValue, bool defending) {
    int reduced = damage - armorValue;
    if (defending) reduced = (reduced * defenseReductionMultiplier).round();
    return reduced.clamp(1, 999); // Always deal at least 1 damage
  }

  static CombatState _appendLog(CombatState state, CombatActionResult result) {
    return state.copyWith(log: [...state.log, result]);
  }
}