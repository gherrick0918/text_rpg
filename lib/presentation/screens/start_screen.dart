import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/campaign_provider.dart';
import '../../application/state/campaign_state.dart';
import '../../domain/models/character_stats.dart';
import '../theme/app_theme.dart';
import '../widgets/parchment_panel.dart';
import '../widgets/action_button.dart';
import '../widgets/divider_ornament.dart';
import 'exploration_screen.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  final _nameController = TextEditingController(text: 'Aldric');
  CampaignLength _selectedLength = CampaignLength.short;
  ConflictType? _selectedConflict; // null = emergent

  // Starting stat points
  static const int _totalPoints = 75;
  static const int _minStat = 6;
  static const int _maxStat = 16;

  final Map<String, int> _stats = {
    'strength': 10,
    'stamina': 10,
    'agility': 10,
    'luck': 10,
    'charisma': 10,
    'wisdom': 10,
    'intelligence': 10,
  };

  int get _spentPoints => _stats.values.fold(0, (a, b) => a + b);
  int get _remainingPoints => _totalPoints - _spentPoints;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _adjustStat(String stat, int delta) {
    final current = _stats[stat]!;
    final next = current + delta;
    if (next < _minStat || next > _maxStat) return;
    if (delta > 0 && _remainingPoints <= 0) return;
    setState(() => _stats[stat] = next);
  }

  void _startCampaign() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    ref.read(campaignProvider.notifier).startCampaign(
          playerName: name,
          stats: CharacterStats(
            strength: _stats['strength']!,
            stamina: _stats['stamina']!,
            agility: _stats['agility']!,
            luck: _stats['luck']!,
            charisma: _stats['charisma']!,
            wisdom: _stats['wisdom']!,
            intelligence: _stats['intelligence']!,
          ),
          campaignLength: _selectedLength,
          selectedConflictType: _selectedConflict,
        );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const ExplorationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.parchmentStain,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              _buildTitle(context),
              const SizedBox(height: 24),
              _buildNamePanel(context),
              const SizedBox(height: 16),
              _buildStatsPanel(context),
              const SizedBox(height: 16),
              _buildCampaignLengthPanel(context),
              const SizedBox(height: 16),
              _buildConflictPanel(context),
              const SizedBox(height: 24),
              ActionButton(
                label: 'BEGIN YOUR TALE',
                isEnabled: _remainingPoints == 0 &&
                    _nameController.text.trim().isNotEmpty,
                onPressed: _startCampaign,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        Text(
          'IRON GRYPHON',
          textAlign: TextAlign.center,
          style: AppTextStyles.display(context).copyWith(
            color: AppColors.inkBrown,
            fontSize: 38,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A tale awaits. Choose your path.',
          textAlign: TextAlign.center,
          style: AppTextStyles.flavor(context),
        ),
      ],
    );
  }

  Widget _buildNamePanel(BuildContext context) {
    return ParchmentPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('YOUR NAME', style: AppTextStyles.subheading(context)),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            style: AppTextStyles.body(context),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.parchmentPale,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: AppColors.panelBorder,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: AppColors.gold,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
            onChanged: (_) => setState(() {}),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsPanel(BuildContext context) {
    return ParchmentPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ATTRIBUTES', style: AppTextStyles.subheading(context)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: _remainingPoints == 0
                      ? AppColors.healthGreen.withOpacity(0.2)
                      : AppColors.goldBright.withOpacity(0.2),
                  border: Border.all(
                    color: _remainingPoints == 0
                        ? AppColors.healthGreen
                        : AppColors.gold,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  '$_remainingPoints pts remaining',
                  style: AppTextStyles.caption(context).copyWith(
                    color: _remainingPoints == 0
                        ? AppColors.healthGreen
                        : AppColors.inkBrown,
                  ),
                ),
              ),
            ],
          ),
          const DividerOrnament(),
          ..._stats.entries.map((entry) =>
              _buildStatRow(context, entry.key, entry.value)),
        ],
      ),
    );
  }

  Widget _buildStatRow(BuildContext context, String stat, int value) {
    final label = stat.toUpperCase();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: AppTextStyles.caption(context)),
          ),
          GestureDetector(
            onTap: () => _adjustStat(stat, -1),
            child: Container(
              width: 28,
              height: 28,
              decoration: AppDecorations.actionButton(
                isEnabled: value > _minStat,
              ),
              child: Center(
                child: Text(
                  '−',
                  style: AppTextStyles.button(context),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: AppTextStyles.statValue(context).copyWith(fontSize: 18),
            ),
          ),
          GestureDetector(
            onTap: () => _adjustStat(stat, 1),
            child: Container(
              width: 28,
              height: 28,
              decoration: AppDecorations.actionButton(
                isEnabled: value < _maxStat && _remainingPoints > 0,
              ),
              child: Center(
                child: Text(
                  '+',
                  style: AppTextStyles.button(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCampaignLengthPanel(BuildContext context) {
    return ParchmentPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CAMPAIGN LENGTH', style: AppTextStyles.subheading(context)),
          const DividerOrnament(),
          Row(
            children: CampaignLength.values.map((length) {
              final isSelected = _selectedLength == length;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedLength = length),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.parchmentMid
                            : AppColors.parchmentPale,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.gold
                              : AppColors.inkFaded.withOpacity(0.4),
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Column(
                        children: [
                          Text(
                            length.name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.caption(context).copyWith(
                              color: isSelected
                                  ? AppColors.parchmentLight
                                  : AppColors.inkBrown,
                            ),
                          ),
                          Text(
                            _lengthDescription(length),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.caption(context).copyWith(
                              color: isSelected
                                  ? AppColors.parchmentStain
                                  : AppColors.inkFaded,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildConflictPanel(BuildContext context) {
    return ParchmentPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CONFLICT TYPE', style: AppTextStyles.subheading(context)),
          const SizedBox(height: 4),
          Text(
            'Leave unselected to let your choices shape the story.',
            style: AppTextStyles.flavor(context).copyWith(fontSize: 13),
          ),
          const DividerOrnament(),
          _buildConflictOption(
            context,
            null,
            'EMERGENT',
            'Your choices determine the path',
          ),
          const SizedBox(height: 8),
          _buildConflictOption(
            context,
            ConflictType.epic,
            'EPIC',
            'Ancient evil. World-ending threat.',
          ),
          const SizedBox(height: 8),
          _buildConflictOption(
            context,
            ConflictType.political,
            'POLITICAL',
            'Faction maneuvering. Power and betrayal.',
          ),
          const SizedBox(height: 8),
          _buildConflictOption(
            context,
            ConflictType.social,
            'SOCIAL',
            'Community. Conspiracy. Allegiance.',
          ),
        ],
      ),
    );
  }

  Widget _buildConflictOption(
    BuildContext context,
    ConflictType? type,
    String label,
    String description,
  ) {
    final isSelected = _selectedConflict == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedConflict = type),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.parchmentMid
              : AppColors.parchmentPale,
          border: Border.all(
            color: isSelected
                ? AppColors.gold
                : AppColors.inkFaded.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.goldBright : AppColors.inkFaded,
                  width: 2,
                ),
                color: isSelected
                    ? AppColors.goldBright
                    : Colors.transparent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.caption(context).copyWith(
                      color: isSelected
                          ? AppColors.parchmentLight
                          : AppColors.inkBrown,
                    ),
                  ),
                  Text(
                    description,
                    style: AppTextStyles.caption(context).copyWith(
                      color: isSelected
                          ? AppColors.parchmentStain
                          : AppColors.inkFaded,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _lengthDescription(CampaignLength length) {
    switch (length) {
      case CampaignLength.short:
        return '1-2 hours';
      case CampaignLength.medium:
        return '3-5 hours';
      case CampaignLength.long:
        return '6+ hours';
    }
  }
}