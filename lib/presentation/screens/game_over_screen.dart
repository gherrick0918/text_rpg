import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/campaign_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/parchment_panel.dart';
import '../widgets/action_button.dart';
import '../widgets/divider_ornament.dart';
import 'start_screen.dart';

class GameOverScreen extends ConsumerWidget {
  const GameOverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaign = ref.watch(campaignProvider);

    return Scaffold(
      backgroundColor: AppColors.parchmentDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'YOUR TALE ENDS HERE',
                textAlign: TextAlign.center,
                style: AppTextStyles.display(context).copyWith(
                  color: AppColors.bloodRed,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                campaign?.player.name ?? 'The hero',
                textAlign: TextAlign.center,
                style: AppTextStyles.heading(context).copyWith(
                  color: AppColors.parchmentStain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'has fallen.',
                textAlign: TextAlign.center,
                style: AppTextStyles.flavor(context).copyWith(
                  color: AppColors.parchmentStain.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 40),
              if (campaign != null)
                ParchmentPanel(
                  child: Column(
                    children: [
                      Text(
                        'FINAL RECORD',
                        style: AppTextStyles.subheading(context),
                      ),
                      const DividerOrnament(),
                      _statRow(
                          context, 'Level Reached', '${campaign.player.level}'),
                      _statRow(context, 'Experience Gained',
                          '${campaign.player.experience}'),
                      _statRow(context, 'Rooms Explored',
                          '${campaign.visitedRoomIds.length}'),
                      _statRow(context, 'Quests Completed',
                          '${campaign.completedQuestIds.length}'),
                      _statRow(context, 'Gold Carried', '${campaign.gold}'),
                      _statRow(context, 'Conflict Path',
                          campaign.activeConflictType.name.toUpperCase()),
                    ],
                  ),
                ),
              const SizedBox(height: 32),
              ActionButton(
                label: 'BEGIN A NEW TALE',
                onPressed: () {
                  ref.read(campaignProvider.notifier).endCampaign();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const StartScreen()),
                    (_) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.caption(context)),
          Text(value,
              style: AppTextStyles.caption(context).copyWith(
                color: AppColors.inkDark,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}