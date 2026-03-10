import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/campaign_provider.dart';
import '../../application/state/campaign_state.dart';
import '../theme/app_theme.dart';
import '../widgets/parchment_panel.dart';
import '../widgets/divider_ornament.dart';

class LevelUpScreen extends ConsumerWidget {
  const LevelUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaign = ref.watch(campaignProvider);
    if (campaign == null) return const SizedBox.shrink();

    final player = campaign.player;
    final stats = player.stats;

    final statEntries = {
      'strength': stats.strength,
      'stamina': stats.stamina,
      'agility': stats.agility,
      'luck': stats.luck,
      'charisma': stats.charisma,
      'wisdom': stats.wisdom,
      'intelligence': stats.intelligence,
    };

    return Scaffold(
      backgroundColor: AppColors.parchmentStain,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              _buildHeader(context, player.level + 1),
              const SizedBox(height: 24),
              ParchmentPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CHOOSE AN ATTRIBUTE TO IMPROVE',
                      style: AppTextStyles.subheading(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your chosen path has forged you. Select one attribute to increase by 1.',
                      style: AppTextStyles.flavor(context).copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const DividerOrnament(),
                    ...statEntries.entries.map(
                      (entry) => _buildStatOption(
                        context,
                        ref,
                        entry.key,
                        entry.value,
                        campaign,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int newLevel) {
    return Column(
      children: [
        Text(
          '✦  LEVEL UP  ✦',
          textAlign: TextAlign.center,
          style: AppTextStyles.display(context).copyWith(
            color: AppColors.gold,
            fontSize: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'You have reached Level $newLevel',
          textAlign: TextAlign.center,
          style: AppTextStyles.body(context),
        ),
      ],
    );
  }

  Widget _buildStatOption(
    BuildContext context,
    WidgetRef ref,
    String stat,
    int currentValue,
    CampaignState campaign,
  ) {
    final isMaxed = currentValue >= 20;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: isMaxed
            ? null
            : () {
                ref.read(campaignProvider.notifier).levelUp(stat);
                Navigator.of(context).pop();
              },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isMaxed
                ? AppColors.parchmentPale.withOpacity(0.5)
                : AppColors.parchmentPale,
            border: Border.all(
              color: isMaxed
                  ? AppColors.inkFaded.withOpacity(0.2)
                  : AppColors.panelBorder,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 130,
                child: Text(
                  stat.toUpperCase(),
                  style: AppTextStyles.subheading(context).copyWith(
                    fontSize: 13,
                    color: isMaxed ? AppColors.inkFaded : AppColors.inkBrown,
                  ),
                ),
              ),
              Text(
                '$currentValue',
                style: AppTextStyles.statValue(context).copyWith(
                  fontSize: 20,
                  color: isMaxed ? AppColors.inkFaded : AppColors.inkDark,
                ),
              ),
              if (!isMaxed) ...[
                const SizedBox(width: 8),
                Text(
                  '→ ${currentValue + 1}',
                  style: AppTextStyles.statValue(context).copyWith(
                    fontSize: 16,
                    color: AppColors.gold,
                  ),
                ),
              ] else ...[
                const SizedBox(width: 8),
                Text(
                  'MAX',
                  style: AppTextStyles.caption(context).copyWith(
                    color: AppColors.inkFaded,
                  ),
                ),
              ],
              const Spacer(),
              if (!isMaxed)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.gold,
                ),
            ],
          ),
        ),
      ),
    );
  }
}