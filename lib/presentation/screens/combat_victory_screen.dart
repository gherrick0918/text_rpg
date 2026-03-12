import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/campaign_provider.dart';
import '../../application/state/campaign_state.dart';
import '../../domain/engine/combat_engine.dart';
import '../theme/app_theme.dart';
import '../widgets/parchment_panel.dart';
import '../widgets/action_button.dart';
import '../widgets/divider_ornament.dart';
import 'level_up_screen.dart';

class CombatVictoryScreen extends ConsumerWidget {
  const CombatVictoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaign = ref.watch(campaignProvider);

    // Guard — activeCombat should always be present here.
    // Do NOT navigate from this guard — ref.listen below owns all navigation.
    // Two simultaneous navigation calls (guard + listen) both posting to the
    // same frame callback would double-pop and black out the exploration screen.
    if (campaign == null || campaign.activeCombat == null) {
      return const SizedBox.shrink();
    }

    // Watch for phase change away from combatVictory (after Continue is tapped).
    // This is the single source of navigation out of this screen.
    ref.listen<CampaignState?>(campaignProvider, (previous, next) {
      if (next == null) return;
      if (next.phase == CampaignPhase.levelUp) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const LevelUpScreen()),
            );
          }
        });
      } else if (next.phase == CampaignPhase.exploration) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) Navigator.of(context).pop();
        });
      }
    });

    final combat = campaign.activeCombat!;
    final enemy = combat.enemy;
    final xpGained = enemy.xpValue;
    final roundsCount = combat.round;

    // Pull the last few meaningful narrative entries from the combat log
    // for the flavor summary — skip defend/move entries, keep hits and resolution
    final narrativeEntries = combat.log
        .where((e) =>
            e.actionType == CombatActionType.attack ||
            e.resultType == CombatResultType.criticalHit ||
            e.resultType == CombatResultType.criticalMiss)
        .toList();
    // Take the last 3 at most so the screen stays tight
    final summaryEntries = narrativeEntries.length > 3
        ? narrativeEntries.sublist(narrativeEntries.length - 3)
        : narrativeEntries;

    return Scaffold(
      backgroundColor: AppColors.parchmentDark,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ── Victory title ───────────────────────────────────
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'VICTORY',
                            style: AppTextStyles.heading(context).copyWith(
                              color: AppColors.goldBright,
                              fontSize: 32,
                              letterSpacing: 4,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${enemy.name} has been defeated.',
                            style: AppTextStyles.flavor(context).copyWith(
                              color: AppColors.parchmentLight,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Fought over $roundsCount ${roundsCount == 1 ? 'round' : 'rounds'}.',
                            style: AppTextStyles.caption(context).copyWith(
                              color: AppColors.inkFaded,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Combat summary ──────────────────────────────────
                    if (summaryEntries.isNotEmpty) ...[
                      ParchmentPanel(
                        inset: true,
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: summaryEntries.map((entry) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                entry.narrative,
                                style: AppTextStyles.body(context).copyWith(
                                  color: _narrativeColor(entry.resultType),
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // ── Rewards panel ───────────────────────────────────
                    ParchmentPanel(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'REWARDS',
                            style: AppTextStyles.subheading(context),
                          ),
                          const DividerOrnament(),
                          _RewardRow(
                            icon: Icons.star_outline,
                            label: 'Experience',
                            value: '+$xpGained XP',
                            valueColor: AppColors.goldBright,
                          ),
                          const SizedBox(height: 8),
                          _RewardRow(
                            icon: Icons.inventory_2_outlined,
                            label: 'Loot',
                            value: enemy.lootTable.isNotEmpty
                                ? '${enemy.lootTable.length} item(s) found'
                                : 'Nothing of value',
                            valueColor: enemy.lootTable.isNotEmpty
                                ? AppColors.gold
                                : AppColors.inkFaded,
                          ),
                          // XP progress bar toward next level
                          const SizedBox(height: 16),
                          _buildXpProgress(context, campaign, xpGained),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Continue button ─────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: ActionButton(
                label: 'CONTINUE',
                onPressed: () =>
                    ref.read(campaignProvider.notifier).acknowledgeVictory(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.parchmentDark,
        border: Border(
          bottom: BorderSide(color: AppColors.gold, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events_outlined,
              color: AppColors.goldBright, size: 18),
          const SizedBox(width: 8),
          Text(
            'BATTLE CONCLUDED',
            style: AppTextStyles.subheading(context)
                .copyWith(color: AppColors.goldBright),
          ),
        ],
      ),
    );
  }

  Widget _buildXpProgress(
      BuildContext context, CampaignState campaign, int xpGained) {
    final player = campaign.player;
    // Show the XP state as it will be after acknowledgeVictory applies it
    final projectedXp = player.experience + xpGained;
    final toNext = player.experienceToNextLevel;
    final progress = (projectedXp / toNext).clamp(0.0, 1.0);
    final willLevelUp = projectedXp >= toNext;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              willLevelUp ? 'LEVEL UP!' : 'XP PROGRESS',
              style: AppTextStyles.caption(context).copyWith(
                color: willLevelUp ? AppColors.goldBright : AppColors.inkFaded,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              '${projectedXp.clamp(0, toNext)} / $toNext',
              style: AppTextStyles.caption(context),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: AppColors.panelBorder,
            valueColor: AlwaysStoppedAnimation<Color>(
              willLevelUp ? AppColors.goldBright : AppColors.gold,
            ),
          ),
        ),
      ],
    );
  }

  Color _narrativeColor(CombatResultType type) {
    switch (type) {
      case CombatResultType.criticalHit:
        return AppColors.bloodRed;
      case CombatResultType.criticalMiss:
        return AppColors.inkFaded;
      default:
        return AppColors.inkDark;
    }
  }
}

// ── Small helper widget ───────────────────────────────────────────────────────

class _RewardRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color valueColor;

  const _RewardRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.inkFaded),
        const SizedBox(width: 8),
        Expanded(
          child: Text(label, style: AppTextStyles.body(context)),
        ),
        Text(
          value,
          style: AppTextStyles.body(context).copyWith(
            color: valueColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
