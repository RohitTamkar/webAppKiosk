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

import 'package:flutter/foundation.dart';

Future<String> platformValidate() async {
  String msg;
  if (defaultTargetPlatform == TargetPlatform.android) {
    msg = "android";
// Android specific code
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    msg = "ios";
  } else if (defaultTargetPlatform == TargetPlatform.windows) {
    msg = "windows";
  } else {
//web or desktop specific code
    msg = "webOrDesktop";
  } // Add your function code here!
  return msg;
}
