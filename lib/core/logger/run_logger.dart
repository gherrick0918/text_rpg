import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

/// Severity levels for log entries.
enum LogLevel { info, warn, error }

/// A lightweight per-run logger that writes timestamped entries to a file
/// in the app's documents directory.
///
/// Usage:
///   RunLogger.info('exploreRoom', 'Loaded room: The Webbed Galleries');
///   RunLogger.warn('spawnEnemy', 'No enemies matched filters — using fallback');
///   RunLogger.error('AppDatabase', 'Failed to open content.db', error, stackTrace);
///
/// Each app launch produces a new file:
///   <documents>/logs/run_2026-03-10_14-22-05.log
///
/// Call [RunLogger.init()] once before runApp().
/// Call [RunLogger.close()] on app teardown (optional — OS will flush on exit).
class RunLogger {
  RunLogger._();

  static File? _file;
  static IOSink? _sink;
  static bool _ready = false;

  // ── Initialisation ─────────────────────────────────────────────────────────

  /// Initialise the logger. Must be called after [WidgetsFlutterBinding.ensureInitialized].
  static Future<void> init() async {
    try {
      // Use a logs folder in the current directory (repo root during development)
      final logsDir = Directory(p.join(Directory.current.path, 'logs'));
      if (!await logsDir.exists()) {
        await logsDir.create(recursive: true);
      }

      final now = DateTime.now();
      final stamp = _dateStamp(now);
      _file = File(p.join(logsDir.path, 'run_$stamp.log'));
      _sink = _file!.openWrite(mode: FileMode.writeOnly);
      _ready = true;

      _write(LogLevel.info, 'RunLogger', 'Session started — log: ${_file!.path}');

      // Prune old logs — keep the 20 most recent
      _pruneOldLogs(logsDir, keep: 20);
    } catch (e, st) {
      // Logger init failure must never crash the app
      debugPrint('[RunLogger] Failed to initialise: $e\n$st');
    }
  }

  /// Flush and close the sink. Optional — the OS flushes on process exit.
  static Future<void> close() async {
    if (_sink != null) {
      _write(LogLevel.info, 'RunLogger', 'Session ended.');
      await _sink!.flush();
      await _sink!.close();
      _sink = null;
      _ready = false;
    }
  }

  // ── Public API ─────────────────────────────────────────────────────────────

  static void info(String tag, String message) {
    _write(LogLevel.info, tag, message);
  }

  static void warn(String tag, String message) {
    _write(LogLevel.warn, tag, message);
  }

  static void error(
    String tag,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final buffer = StringBuffer(message);
    if (error != null) buffer.write('\n  ERROR: $error');
    if (stackTrace != null) buffer.write('\n  STACK:\n$stackTrace');
    _write(LogLevel.error, tag, buffer.toString());
  }

  /// Returns the path of the current log file, or null if not initialised.
  static String? get logFilePath => _file?.path;

  // ── Flutter & platform error hooks ────────────────────────────────────────

  /// Wire up Flutter framework errors. Call once in main() before runApp().
  static void hookFlutterErrors() {
    final original = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      error(
        'FlutterError',
        details.exceptionAsString(),
        details.exception,
        details.stack,
      );
      // Also forward to the original handler (prints to console in debug mode)
      original?.call(details);
    };
  }

  /// Wire up uncaught platform/async errors.
  /// Call once in main() before runApp().
  static void hookPlatformErrors() {
    PlatformDispatcher.instance.onError = (Object err, StackTrace st) {
      error('PlatformDispatcher', err.toString(), err, st);
      return false; // false = let the platform also handle it
    };
  }

  // ── Internal helpers ───────────────────────────────────────────────────────

  static void _write(LogLevel level, String tag, String message) {
    final entry = _format(level, tag, message);

    // Always echo to the debug console
    debugPrint(entry);

    if (!_ready || _sink == null) return;
    try {
      _sink!.writeln(entry);
    } catch (e) {
      debugPrint('[RunLogger] Write failed: $e');
    }
  }

  static String _format(LogLevel level, String tag, String message) {
    final ts = _timeStamp(DateTime.now());
    final lvl = level.name.toUpperCase().padRight(5);
    return '[$ts] $lvl [$tag] $message';
  }

  static String _timeStamp(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}:'
        '${dt.second.toString().padLeft(2, '0')}.'
        '${dt.millisecond.toString().padLeft(3, '0')}';
  }

  static String _dateStamp(DateTime dt) {
    return '${dt.year}-'
        '${dt.month.toString().padLeft(2, '0')}-'
        '${dt.day.toString().padLeft(2, '0')}_'
        '${dt.hour.toString().padLeft(2, '0')}-'
        '${dt.minute.toString().padLeft(2, '0')}-'
        '${dt.second.toString().padLeft(2, '0')}';
  }

  static void _pruneOldLogs(Directory logsDir, {required int keep}) {
    try {
      final files = logsDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.endsWith('.log'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path)); // ascending = oldest first

      if (files.length > keep) {
        final toDelete = files.sublist(0, files.length - keep);
        for (final f in toDelete) {
          f.deleteSync();
        }
        info('RunLogger', 'Pruned ${toDelete.length} old log(s).');
      }
    } catch (e) {
      // Pruning failure is non-fatal
      debugPrint('[RunLogger] Prune failed: $e');
    }
  }
}
