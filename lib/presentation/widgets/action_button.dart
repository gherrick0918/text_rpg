import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isEnabled;
  final int? apCost;

  const ActionButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isEnabled = true,
    this.apCost,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: AppDecorations.actionButton(isEnabled: isEnabled),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.button(context)),
            if (apCost != null)
              Text(
                '$apCost AP',
                style: AppTextStyles.caption(context).copyWith(
                  color: AppColors.goldBright,
                ),
              ),
          ],
        ),
      ),
    );
  }
}