import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/campaign_provider.dart';
import '../../application/state/campaign_state.dart';
import '../../domain/models/quest.dart';
import '../theme/app_theme.dart';
import '../widgets/parchment_panel.dart';
import '../widgets/divider_ornament.dart';

class QuestLogScreen extends ConsumerWidget {
  const QuestLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaign = ref.watch(campaignProvider);
    if (campaign == null) return const SizedBox.shrink();

    return Scaffold(
      backgroundColor: AppColors.parchmentStain,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: _QuestLogBody(campaign: campaign),
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
        border: Border(bottom: BorderSide(color: AppColors.gold, width: 2)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 16),
            color: AppColors.goldBright,
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 12),
          Text(
            'QUEST LOG',
            style: AppTextStyles.subheading(context)
                .copyWith(color: AppColors.goldBright),
          ),
        ],
      ),
    );
  }
}

class _QuestLogBody extends ConsumerWidget {
  final CampaignState campaign;

  const _QuestLogBody({required this.campaign});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIds = campaign.activeQuestIds;
    final completedIds = campaign.completedQuestIds;

    // Fetch quest details from DB for any IDs we have
    final activeQuestsAsync = ref.watch(_questsByIdsProvider(activeIds));
    final completedQuestsAsync = ref.watch(_questsByIdsProvider(completedIds));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── ACTIVE QUESTS ─────────────────────────────────────────────
          ParchmentPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('ACTIVE', style: AppTextStyles.subheading(context)),
                    const SizedBox(width: 8),
                    if (activeIds.isNotEmpty)
                      _CountBadge(count: activeIds.length),
                  ],
                ),
                const DividerOrnament(),
                activeQuestsAsync.when(
                  loading: () => const _LoadingIndicator(),
                  error: (e, _) => _ErrorText(message: e.toString()),
                  data: (quests) => quests.isEmpty
                      ? const _EmptyState(
                          message:
                              'No active quests. Speak with NPCs to uncover leads.',
                        )
                      : Column(
                          children: quests
                              .map((q) => _QuestCard(
                                    quest: q,
                                    isCompleted: false,
                                  ))
                              .toList(),
                        ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── COMPLETED QUESTS ──────────────────────────────────────────
          ParchmentPanel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('COMPLETED', style: AppTextStyles.subheading(context)),
                    const SizedBox(width: 8),
                    if (completedIds.isNotEmpty)
                      _CountBadge(count: completedIds.length),
                  ],
                ),
                const DividerOrnament(),
                completedQuestsAsync.when(
                  loading: () => const _LoadingIndicator(),
                  error: (e, _) => _ErrorText(message: e.toString()),
                  data: (quests) => quests.isEmpty
                      ? const _EmptyState(
                          message: 'No completed quests yet.',
                        )
                      : Column(
                          children: quests
                              .map((q) => _QuestCard(
                                    quest: q,
                                    isCompleted: true,
                                  ))
                              .toList(),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── QUEST CARD ──────────────────────────────────────────────────────────────

class _QuestCard extends StatefulWidget {
  final Quest quest;
  final bool isCompleted;

  const _QuestCard({required this.quest, required this.isCompleted});

  @override
  State<_QuestCard> createState() => _QuestCardState();
}

class _QuestCardState extends State<_QuestCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final quest = widget.quest;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ParchmentPanel(
        inset: true,
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header row ──────────────────────────────────────────────
            InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _TypeChip(label: quest.questTypeLabel),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  quest.title,
                                  style: AppTextStyles.body(context).copyWith(
                                    fontWeight: FontWeight.bold,
                                    decoration: widget.isCompleted
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: widget.isCompleted
                                        ? AppColors.inkFaded
                                        : AppColors.inkDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      _expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.inkFaded,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),

            // ── Expanded body ────────────────────────────────────────────
            if (_expanded) ...[
              Divider(color: AppColors.panelBorder, height: 1),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quest.description,
                      style: AppTextStyles.body(context),
                    ),
                    if (quest.objectives.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        'OBJECTIVES',
                        style: AppTextStyles.caption(context).copyWith(
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ...quest.objectives.map(
                        (obj) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Icon(
                                  widget.isCompleted
                                      ? Icons.check_box_outlined
                                      : Icons.check_box_outline_blank,
                                  size: 14,
                                  color: widget.isCompleted
                                      ? AppColors.gold
                                      : AppColors.inkFaded,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  obj.description,
                                  style: AppTextStyles.body(context).copyWith(
                                    fontSize: 13,
                                    decoration: widget.isCompleted
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: widget.isCompleted
                                        ? AppColors.inkFaded
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    if (!widget.isCompleted) ...[
                      const SizedBox(height: 12),
                      _RewardsRow(rewards: quest.rewards),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── REWARDS ROW ─────────────────────────────────────────────────────────────

class _RewardsRow extends StatelessWidget {
  final QuestRewards rewards;

  const _RewardsRow({required this.rewards});

  @override
  Widget build(BuildContext context) {
    final parts = <String>[];
    if (rewards.xp > 0) parts.add('${rewards.xp} XP');
    if (rewards.gold > 0) parts.add('${rewards.gold} gold');
    if (rewards.itemIds.isNotEmpty) {
      parts.add('${rewards.itemIds.length} item(s)');
    }
    if (parts.isEmpty) return const SizedBox.shrink();

    return Row(
      children: [
        Icon(Icons.card_giftcard, size: 13, color: AppColors.gold),
        const SizedBox(width: 5),
        Text(
          parts.join('  •  '),
          style: AppTextStyles.caption(context)
              .copyWith(color: AppColors.gold),
        ),
      ],
    );
  }
}

// ── SMALL WIDGETS ────────────────────────────────────────────────────────────

class _TypeChip extends StatelessWidget {
  final String label;

  const _TypeChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.parchmentDark.withOpacity(0.2),
        border: Border.all(color: AppColors.inkFaded.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(label, style: AppTextStyles.caption(context).copyWith(fontSize: 10)),
    );
  }
}

class _CountBadge extends StatelessWidget {
  final int count;
  const _CountBadge({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        message,
        style: AppTextStyles.flavor(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

class _ErrorText extends StatelessWidget {
  final String message;
  const _ErrorText({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        'Error loading quests: $message',
        style: AppTextStyles.body(context).copyWith(color: Colors.red[800]),
      ),
    );
  }
}

// ── PROVIDER for fetching quests by ID list ──────────────────────────────────
// Defined here so it's co-located with the screen that uses it.

final _questsByIdsProvider =
    FutureProvider.family<List<Quest>, List<String>>((ref, ids) async {
  if (ids.isEmpty) return [];
  final repo = ref.watch(questRepositoryProvider);
  return repo.getQuestsByIds(ids);
});
