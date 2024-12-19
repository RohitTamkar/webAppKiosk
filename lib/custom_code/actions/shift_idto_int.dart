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

int shiftIdtoInt(String dateString) {
  // "2023-01-21-1" convert this String to Int
  List<String> dateParts = dateString.split("-");
  int year = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int day = int.parse(dateParts[2]);
  int num = int.parse(dateParts[3]);

  // Use padLeft to add leading zeros for month and day
  String monthString = month.toString().padLeft(2, '0');
  String dayString = day.toString().padLeft(2, '0');

  int dateInt = int.parse("$year$monthString$dayString$num");
  print(dateInt);
  return dateInt;
}
