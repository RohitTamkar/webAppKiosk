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

import 'index.dart'; // Imports other custom actions

dynamic calculateMixpaymentamt(
  String paymentMode,
  double amt1,
  double amt2,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (FFAppState().groceryJson == null) {
    FFAppState().groceryJson = {
      'paymentMode': {},
      'paidAmt': '0',
      'totalAmt': '0',
      'advanceAmt': '0',
      'balanceAmt': '0',
      'returnAmt': '0',
    };
  }

  // Get the existing paymentModes map
  Map<String, double> paymentModes = FFAppState().groceryJson['paymentMode'];

  // Check if paymentMode is "CASH&PHONEPE" and assign amt1 to "CASH" and amt2 to "PHONEPE"
  if (paymentMode == "CASH&PHONEPE") {
    paymentModes['CASH'] = amt1;
    paymentModes['PHONEPE'] = amt2;
  } else if (paymentMode == "CASH&PAYTM") {
    paymentModes['CASH'] = amt1;
    paymentModes['PAYTM'] = amt2;
  } else if (paymentMode == "CASH&CARD") {
    paymentModes['CASH'] = amt1;
    paymentModes['CARD'] = amt2;
  } else if (paymentMode == "CASH&GPAY") {
    paymentModes['CASH'] = amt1;
    paymentModes['GOOGLEPAY'] = amt2;
  } else if (paymentMode == "CASH&OTHER") {
    paymentModes['CASH'] = amt1;
    paymentModes['OTHER'] = amt2;
  }

  // Update groceryJson with the latest data
  FFAppState().groceryJson = {
    'paymentMode': paymentModes,
    'paidAmt': (amt1 + amt2).toString(),
    'totalAmt': '0',
    'advanceAmt': '0',
    'balanceAmt': '0',
    'returnAmt': '0',
  };

  // Print the JSON structure
  print(FFAppState().groceryJson);
  return FFAppState().groceryJson;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
