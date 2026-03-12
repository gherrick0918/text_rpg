import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/logger/run_logger.dart';
import 'presentation/screens/start_screen.dart';
import 'presentation/theme/app_theme.dart';

void main() {
  // runZonedGuarded must wrap everything including ensureInitialized so that
  // Flutter init and runApp happen in the same zone. Calling ensureInitialized
  // before runZonedGuarded causes a zone mismatch warning on every launch.
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await RunLogger.init();
      RunLogger.hookFlutterErrors();
      RunLogger.hookPlatformErrors();

      RunLogger.info('main', 'Iron Gryphon starting up.');

      runApp(const ProviderScope(child: TextRpgApp()));
    },
    (error, stack) {
      RunLogger.error('ZonedGuard', error.toString(), error, stack);
    },
  );
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
