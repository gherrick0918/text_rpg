import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/screens/start_screen.dart';
import 'presentation/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: TextRpgApp()));
}

class TextRpgApp extends StatelessWidget {
  const TextRpgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iron Gryphon',
      theme: AppTheme.theme,
      home: const StartScreen(),
    );
  }
}