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

bool paymentmodemix(String paymentMode) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  bool mode = false;
  if (paymentMode == "CASH&CARD") {
    FFAppState().paymode1 = "CASH";
    FFAppState().paymode2 = "CARD";
    mode = true;
    return mode;
  } else if (paymentMode == "CASH&GPAY") {
    FFAppState().paymode1 = "CASH";
    FFAppState().paymode2 = "GOOGLEPAY";
    mode = true;
    return mode;
  } else if (paymentMode == "CASH&PHONEPE") {
    FFAppState().paymode1 = "CASH";
    FFAppState().paymode2 = "PHONEPE";
    mode = true;
    return mode;
  } else if (paymentMode == "CASH&PAYTM") {
    FFAppState().paymode1 = "CASH";
    FFAppState().paymode2 = "PAYTM";
    mode = true;
    return mode;
  } else if (paymentMode == "CASH&OTHER") {
    FFAppState().paymode1 = "CASH";
    FFAppState().paymode2 = "OTHER";
    mode = true;
    return mode;
  } else {
    return mode;
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
