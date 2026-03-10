import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DividerOrnament extends StatelessWidget {
  const DividerOrnament({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: AppColors.panelBorder.withOpacity(0.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '✦',
              style: TextStyle(
                color: AppColors.gold,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: AppColors.panelBorder.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}