import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/campaign_provider.dart';
import '../../application/state/campaign_state.dart';
import '../../domain/engine/combat_engine.dart';
import '../theme/app_theme.dart';
import '../widgets/parchment_panel.dart';
import '../widgets/stat_bar.dart';
import '../widgets/action_button.dart';
import '../widgets/divider_ornament.dart';
import 'level_up_screen.dart';
import 'game_over_screen.dart';

class CombatScreen extends ConsumerStatefulWidget {
  const CombatScreen({super.key});

  @override
  ConsumerState<CombatScreen> createState() => _CombatScreenState();
}

class _CombatScreenState extends ConsumerState<CombatScreen> {
  final ScrollController _logScrollController = ScrollController();

  @override
  void dispose() {
    _logScrollController.dispose();
    super.dispose();
  }

  void _scrollLogToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_logScrollController.hasClients) {
        _logScrollController.animateTo(
          _logScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final campaign = ref.watch(campaignProvider);

    if (campaign == null || !campaign.isInCombat) {
      // Combat ended — pop back to exploration

      if (campaign == null || !campaign.isInCombat) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          if (campaign?.phase == CampaignPhase.levelUp) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const LevelUpScreen()),
            );
          } else if (campaign?.phase == CampaignPhase.gameOver) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const GameOverScreen()),
            );
          } else {
            Navigator.of(context).pop();
          }
        });
        return const SizedBox.shrink();
      }
      return const SizedBox.shrink();
    }

    final combat = campaign.activeCombat!;
    _scrollLogToBottom();

    return Scaffold(
      backgroundColor: AppColors.parchmentStain,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, campaign),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildCombatants(context, combat, campaign),
                    const SizedBox(height: 16),
                    Expanded(child: _buildCombatLog(context, combat)),
                    const SizedBox(height: 16),
                    _buildActionBar(context, ref, combat, campaign),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, CampaignState campaign) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.bloodRed.withOpacity(0.85),
        border: Border(bottom: BorderSide(color: AppColors.gold, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'COMBAT',
            style: AppTextStyles.subheading(
              context,
            ).copyWith(color: AppColors.parchmentLight),
          ),
          Text(
            'Round ${campaign.activeCombat!.round}',
            style: AppTextStyles.caption(
              context,
            ).copyWith(color: AppColors.parchmentStain),
          ),
        ],
      ),
    );
  }

  Widget _buildCombatants(
    BuildContext context,
    CombatState combat,
    CampaignState campaign,
  ) {
    return Row(
      children: [
        Expanded(child: _buildPlayerCard(context, combat, campaign)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'VS',
            style: AppTextStyles.heading(
              context,
            ).copyWith(color: AppColors.bloodRed),
          ),
        ),
        Expanded(child: _buildEnemyCard(context, combat)),
      ],
    );
  }

  Widget _buildPlayerCard(
    BuildContext context,
    CombatState combat,
    CampaignState campaign,
  ) {
    final player = combat.player;
    return ParchmentPanel(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            player.name.toUpperCase(),
            style: AppTextStyles.subheading(context),
          ),
          const SizedBox(height: 8),
          StatBar(
            label: 'HP',
            current: player.currentHealth,
            max: player.maxHealth,
            fillColor: AppColors.healthRed,
          ),
          const SizedBox(height: 6),
          StatBar(
            label: 'AP',
            current: player.currentActionPoints,
            max: player.maxActionPoints,
            fillColor: AppColors.apBlue,
          ),
          if (combat.playerDefending) ...[
            const SizedBox(height: 6),
            Text(
              '🛡 DEFENDING',
              style: AppTextStyles.caption(
                context,
              ).copyWith(color: AppColors.verdigris),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEnemyCard(BuildContext context, CombatState combat) {
    final enemy = combat.enemy;
    return ParchmentPanel(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            enemy.name.toUpperCase(),
            style: AppTextStyles.subheading(
              context,
            ).copyWith(color: AppColors.bloodRed),
          ),
          const SizedBox(height: 8),
          StatBar(
            label: 'HP',
            current: enemy.currentHealth,
            max: enemy.maxHealth,
            fillColor: AppColors.bloodRed,
          ),
          const SizedBox(height: 6),
          Text(
            'Tier ${enemy.tier}  •  ${enemy.behavior.name.toUpperCase()}',
            style: AppTextStyles.caption(context),
          ),
          if (enemy.isBloodied) ...[
            const SizedBox(height: 4),
            Text(
              '⚠ BLOODIED',
              style: AppTextStyles.caption(
                context,
              ).copyWith(color: AppColors.bloodRed),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCombatLog(BuildContext context, CombatState combat) {
    return ParchmentPanel(
      inset: true,
      padding: const EdgeInsets.all(12),
      child: combat.log.isEmpty
          ? Text(
              'The air grows tense as you face your opponent...',
              style: AppTextStyles.flavor(context),
            )
          : ListView.builder(
              controller: _logScrollController,
              itemCount: combat.log.length,
              itemBuilder: (context, index) {
                final entry = combat.log[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    entry.narrative,
                    style: AppTextStyles.body(context).copyWith(
                      color: _narrativeColor(entry.resultType),
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildActionBar(
    BuildContext context,
    WidgetRef ref,
    CombatState combat,
    CampaignState campaign,
  ) {
    final ap = combat.player.currentActionPoints;

    return ParchmentPanel(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('ACTIONS', style: AppTextStyles.subheading(context)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  label: 'ATTACK',
                  apCost: CombatEngine.attackCost,
                  isEnabled: ap >= CombatEngine.attackCost,
                  onPressed: () =>
                      ref.read(campaignProvider.notifier).playerAttacks(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ActionButton(
                  label: 'DEFEND',
                  apCost: CombatEngine.defendCost,
                  isEnabled: ap >= CombatEngine.defendCost,
                  onPressed: () =>
                      ref.read(campaignProvider.notifier).playerDefends(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  label: 'MOVE',
                  apCost: CombatEngine.moveCost,
                  isEnabled: ap >= CombatEngine.moveCost,
                  onPressed: () =>
                      ref.read(campaignProvider.notifier).playerMoves(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ActionButton(
                  label: 'FLEE',
                  apCost: CombatEngine.fleeCost,
                  isEnabled: ap >= CombatEngine.fleeCost,
                  onPressed: () =>
                      ref.read(campaignProvider.notifier).playerFlees(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _narrativeColor(CombatResultType type) {
    switch (type) {
      case CombatResultType.criticalHit:
        return AppColors.bloodRed;
      case CombatResultType.criticalMiss:
        return AppColors.inkFaded;
      case CombatResultType.fled:
        return AppColors.verdigris;
      case CombatResultType.hit:
        return AppColors.inkDark;
      case CombatResultType.miss:
        return AppColors.inkFaded;
      default:
        return AppColors.inkDark;
    }
  }
}
