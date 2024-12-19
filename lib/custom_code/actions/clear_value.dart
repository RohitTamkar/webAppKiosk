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

Future clearValue() async {
  // Add your function code her

  onTap:
  {
    FFAppState().subTotal = 0.0;
    // FFAppState().billAmt= 0.0;
    FFAppState().finalAmt = 0.0;
    FFAppState().totalQuantity = 0.0;
    FFAppState().disAmt = 0.0;
    // FFAppState().disPer = 0.0;
    FFAppState().disPer = 0.0;
    //  FFAppState().delCharges = 0.0;
    // FFAppState().delCharges = 0.0;
    FFAppState().returnAmt = 0.0;
    FFAppState().billAmt = 0.0;
  }
}
