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

import 'package:hive_flutter/hive_flutter.dart';
import 'setup_item_hive.dart';

Future<ShiftDetailsStruct?> hivegetShiftdata(
  String? dayId,
  ShiftDetailsStruct? itemBlob,
  String actionType,
) async {
  shiftDetailBox = await Hive.openBox<ShiftDetailsStruct>('shiftDetails');

  dayId = dayId ?? '999'; // Make sure dayId is a String

  // add the new item into the Hive box
  switch (actionType) {
    case 'get':
      // Find the hivekey based on dayID
      int? hivekey = await findHiveKeyBydayId(dayId);
      if (hivekey != null) {
        // Use the found hivekey to get the item
        ShiftDetailsStruct? itemBlob = await shiftDetailBox.get(hivekey);
        if (itemBlob != null) {
          print('get');
          print(itemBlob);
          return itemBlob;
        }
      }

      // If no item is found, return a default ShiftDetailsStruct
      print('else');
      print(dayId);
      return ShiftDetailsStruct(dayId: dayId);
      break;

    default:
      throw Exception('Unsupported action type: $actionType');
  }
}

Future<int?> findHiveKeyBydayId(String dayId) async {
  // Iterate through keys in the Hive box and find the corresponding hivekey
  for (var key in shiftDetailBox.keys) {
    ShiftDetailsStruct? item = await shiftDetailBox.get(key);
    if (item != null && item.dayId == dayId && item.endTime == 0) {
      return key;
    }
  }

  // Return null if no match is found
  return null;
}
