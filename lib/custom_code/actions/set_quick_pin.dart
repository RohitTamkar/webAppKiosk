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

Future<String?> setQuickPin(String? num) async {
  String pin;
  pin = FFAppState().quickPin;
  if (FFAppState().quickPin != null || FFAppState().quickPin != "") {
    pin = FFAppState().quickPin! + num!!;
    FFAppState().quickPin = pin;
    print(FFAppState().quickPin);
  } else {
    FFAppState().quickPin = num!;
    print(FFAppState().quickPin);
  }

  return FFAppState().quickPin!;
}
