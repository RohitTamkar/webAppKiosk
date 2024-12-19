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

import 'dart:math' as math;

Future<String> barcodeRandomGenerated() async {
  // Add your function code here!
// barcode random generate
  const chars = '0123456789';
  var rnd = new math.Random();
  String char() {
    return chars[rnd.nextInt(chars.length)];
  }

  String result(final n) {
    String tmp = '';
    for (int i = 0; i < n; i++) tmp += char();
    return tmp;
  }

  print(result);
  return result(10);
}
