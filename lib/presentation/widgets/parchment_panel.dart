import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ParchmentPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool inset;

  const ParchmentPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.inset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: inset
          ? AppDecorations.insetPanel()
          : AppDecorations.panel(),
      child: child,
    );
  }
}