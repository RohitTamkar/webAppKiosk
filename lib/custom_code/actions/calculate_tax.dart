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

Future<double> calculateTax(
  String taxPercentage,
  double totalAmount,
  String inclusiveOrExclusive,
) async {
  // Convert tax percentage to double
  double taxPercentageDouble = double.parse(taxPercentage);

  // Check if tax is inclusive or exclusive
  if (inclusiveOrExclusive.toLowerCase() == 'inclusive') {
    // If tax is inclusive, calculate tax amount
    double taxAmount =
        (totalAmount * taxPercentageDouble) / (100 + taxPercentageDouble);
    FFAppState().taxamt = double.parse(taxAmount.toStringAsFixed(2));

    return totalAmount;
    //  return double.parse( taxAmount.toStringAsFixed(2)); // Round to 2 decimal places
  } else if (inclusiveOrExclusive.toLowerCase() == 'exclusive') {
    // If tax is exclusive, calculate tax amount
    double taxAmount = (totalAmount * taxPercentageDouble) / 100;
    FFAppState().taxamt = double.parse(taxAmount.toStringAsFixed(2));
    //return totalAmount;
    taxAmount = taxAmount + totalAmount;
    return double.parse(taxAmount.toStringAsFixed(2));

    // Round to 2 decimal places
  } else {
    // Invalid value for inclusiveOrExclusive
    throw ArgumentError(
        'Invalid value for inclusiveOrExclusive. Use "inclusive" or "exclusive".');
  }
}
