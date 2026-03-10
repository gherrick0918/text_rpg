import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/campaign_provider.dart';
import '../../application/state/campaign_state.dart';
import '../../domain/models/enemy.dart';
import '../../domain/models/character_stats.dart';
import '../theme/app_theme.dart';
import '../widgets/parchment_panel.dart';
import '../widgets/stat_bar.dart';
import '../widgets/action_button.dart';
import '../widgets/divider_ornament.dart';
import 'combat_screen.dart';
import 'level_up_screen.dart';
import 'game_over_screen.dart';
import 'quest_log_screen.dart';

class ExplorationScreen extends ConsumerStatefulWidget {
  const ExplorationScreen({super.key});

  @override
  ConsumerState<ExplorationScreen> createState() => _ExplorationScreenState();
}

class _ExplorationScreenState extends ConsumerState<ExplorationScreen> {
  @override
  Widget build(BuildContext context) {
    final campaign = ref.watch(campaignProvider);

    if (campaign == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: AppColors.parchmentStain,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, campaign),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildPlayerStatus(context, campaign),
                    const SizedBox(height: 16),
                    _buildRoomPanel(context, campaign),
                    const SizedBox(height: 16),
                    _buildActionsPanel(context, ref, campaign),
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
        color: AppColors.parchmentDark,
        border: Border(bottom: BorderSide(color: AppColors.gold, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                campaign.player.name.toUpperCase(),
                style: AppTextStyles.subheading(
                  context,
                ).copyWith(color: AppColors.goldBright),
              ),
              Text(
                'Level ${campaign.player.level}  •  ${_conflictLabel(campaign.activeConflictType)}',
                style: AppTextStyles.caption(
                  context,
                ).copyWith(color: AppColors.parchmentStain),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${campaign.gold} gold',
                style: AppTextStyles.caption(
                  context,
                ).copyWith(color: AppColors.goldBright),
              ),
              Text(
                'Turn ${campaign.sessionTurn}',
                style: AppTextStyles.caption(
                  context,
                ).copyWith(color: AppColors.parchmentStain),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerStatus(BuildContext context, CampaignState campaign) {
    final player = campaign.player;
    return ParchmentPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('STATUS', style: AppTextStyles.subheading(context)),
          const SizedBox(height: 12),
          StatBar(
            label: 'HEALTH',
            current: player.currentHealth,
            max: player.maxHealth,
            fillColor: AppColors.healthRed,
          ),
          const SizedBox(height: 8),
          StatBar(
            label: 'ACTION POINTS',
            current: player.currentActionPoints,
            max: player.maxActionPoints,
            fillColor: AppColors.apBlue,
          ),
          const SizedBox(height: 12),
          Text(
            'XP: ${player.experience} / ${player.experienceToNextLevel}',
            style: AppTextStyles.caption(context),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomPanel(BuildContext context, CampaignState campaign) {
    final room = campaign.currentRoom;

    return ParchmentPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            room?.name.toUpperCase() ?? 'THE ROAD AHEAD',
            style: AppTextStyles.heading(context),
          ),
          if (room != null) ...[
            const DividerOrnament(),
            ParchmentPanel(
              inset: true,
              padding: const EdgeInsets.all(12),
              child: Text(room.description, style: AppTextStyles.body(context)),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildTag(context, room.region.toUpperCase()),
                const SizedBox(width: 8),
                _buildTag(context, room.atmosphere.toUpperCase()),
              ],
            ),
          ] else ...[
            const DividerOrnament(),
            Text(
              'Your journey has only just begun. The path stretches before you, shrouded in possibility.',
              style: AppTextStyles.flavor(context),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.parchmentDark.withOpacity(0.15),
        border: Border.all(
          color: AppColors.inkFaded.withOpacity(0.4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(label, style: AppTextStyles.caption(context)),
    );
  }

  Widget _buildActionsPanel(
    BuildContext context,
    WidgetRef ref,
    CampaignState campaign,
  ) {
    final activeQuestCount = campaign.activeQuestIds.length;

    return ParchmentPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ACTIONS', style: AppTextStyles.subheading(context)),
          const SizedBox(height: 12),
          ActionButton(
            label: 'EXPLORE',
            onPressed: () => _onExplore(context, ref),
          ),
          const SizedBox(height: 8),
          ActionButton(
            label: 'ENGAGE ENEMY',
            onPressed: () => _onEngageEnemy(context, ref),
          ),
          const SizedBox(height: 8),
          // Quest log button — shows a badge if there are active quests
          Stack(
            clipBehavior: Clip.none,
            children: [
              ActionButton(
                label: 'QUEST LOG',
                onPressed: () => _onQuestLog(context),
              ),
              if (activeQuestCount > 0)
                Positioned(
                  top: -6,
                  right: -6,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColors.gold,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$activeQuestCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          ActionButton(
            label: 'CHARACTER SHEET',
            onPressed: () => _onCharacterSheet(context, campaign),
          ),
        ],
      ),
    );
  }

  void _onExplore(BuildContext context, WidgetRef ref) async {
    await ref.read(campaignProvider.notifier).exploreRoom();
  }

  void _onEngageEnemy(BuildContext context, WidgetRef ref) async {
    final enemy = await ref.read(campaignProvider.notifier).spawnEnemy();
    if (enemy == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No enemies found in this region.')),
      );
      return;
    }
    ref.read(campaignProvider.notifier).beginCombat(enemy);
    if (context.mounted) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const CombatScreen()));
    }
  }

  void _onQuestLog(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const QuestLogScreen()));
  }

  void _onCharacterSheet(BuildContext context, CampaignState campaign) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.panelBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
        side: BorderSide(color: AppColors.panelBorder, width: 2),
      ),
      builder: (_) => _CharacterSheetSheet(campaign: campaign),
    );
  }

  String _conflictLabel(ConflictType type) {
    switch (type) {
      case ConflictType.epic:
        return 'Epic Conflict';
      case ConflictType.political:
        return 'Political Conflict';
      case ConflictType.social:
        return 'Social Conflict';
    }
  }
}

class _CharacterSheetSheet extends StatelessWidget {
  final CampaignState campaign;

  const _CharacterSheetSheet({required this.campaign});

  @override
  Widget build(BuildContext context) {
    final stats = campaign.player.stats;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CHARACTER', style: AppTextStyles.heading(context)),
          const DividerOrnament(),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _statTile(context, 'STR', stats.strength),
              _statTile(context, 'STA', stats.stamina),
              _statTile(context, 'AGI', stats.agility),
              _statTile(context, 'LCK', stats.luck),
              _statTile(context, 'CHA', stats.charisma),
              _statTile(context, 'WIS', stats.wisdom),
              _statTile(context, 'INT', stats.intelligence),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _statTile(BuildContext context, String label, int value) {
    return SizedBox(
      width: 70,
      child: ParchmentPanel(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(label, style: AppTextStyles.caption(context)),
            const SizedBox(height: 4),
            Text('$value', style: AppTextStyles.statValue(context)),
          ],
        ),
      ),
    );
  }
}
