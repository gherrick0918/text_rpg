import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StatBar extends StatelessWidget {
  final String label;
  final int current;
  final int max;
  final Color fillColor;

  const StatBar({
    super.key,
    required this.label,
    required this.current,
    required this.max,
    this.fillColor = AppColors.healthRed,
  });

  @override
  Widget build(BuildContext context) {
    final fraction = max > 0 ? (current / max).clamp(0.0, 1.0) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.caption(context)),
            Text(
              '$current / $max',
              style: AppTextStyles.caption(context),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 8,
          decoration: AppDecorations.healthBarTrack(),
          child: FractionallySizedBox(
            widthFactor: fraction,
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}