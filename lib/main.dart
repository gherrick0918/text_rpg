import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/logger/run_logger.dart';
import 'presentation/screens/start_screen.dart';
import 'presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise logger first so it captures everything from this point on
  await RunLogger.init();
  RunLogger.hookFlutterErrors();
  RunLogger.hookPlatformErrors();

  RunLogger.info('main', 'Iron Gryphon starting up.');

  // runZonedGuarded catches uncaught errors thrown inside async zones
  // that PlatformDispatcher.onError might miss on some platforms
  runZonedGuarded(
    () => runApp(const ProviderScope(child: TextRpgApp())),
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
