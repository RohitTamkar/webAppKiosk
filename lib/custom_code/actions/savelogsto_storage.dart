// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:logger/logger.dart';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

Future<void> savelogstoStorage() async {
  // Define the directory for log files
  Directory directory;

  // Check the platform and assign directory paths
  if (Platform.isWindows) {
    directory = await getApplicationDocumentsDirectory();
  } else if (Platform.isAndroid || Platform.isIOS) {
    directory = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
  } else {
    print("Unsupported platform");
    return;
  }

  // Define the log file path
  String logFilePath = '${directory.path}/app_logs.txt';
  File logFile = File(logFilePath);

  // Create the log file if it doesn't exist
  if (!await logFile.exists()) {
    await logFile.create(recursive: true);
  }

  // Logger instance with custom printer
  var logger = Logger(
    printer: SimplePrinter(),
    output: FileOutput(logFilePath),
  );

  // Example of capturing logs
  try {
    // Example logic that could throw an error
    //  throw Exception("This is a test exception");
  } catch (e, stackTrace) {
    logger.e("Caught an error: $e\nStack Trace:\n$stackTrace");
  }

  print('Logs saved to: $logFilePath');
}

// Custom output class for the Logger package to write logs to a file
class FileOutput extends LogOutput {
  final String filePath;

  FileOutput(this.filePath);

  @override
  void output(OutputEvent event) async {
    final file = File(filePath);
    final sink = file.openWrite(mode: FileMode.append);
    for (var line in event.lines) {
      sink.writeln(line);
    }
    await sink.close();
  }
}

// Custom printer for simple log output
class SimplePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final timestamp = DateTime.now().toIso8601String();
    return [
      '[$timestamp] ${event.level.toString().toUpperCase().padRight(7)}: ${event.message}'
    ];
  }
}
