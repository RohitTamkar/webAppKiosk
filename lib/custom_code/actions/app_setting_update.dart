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

Future<List<AppSettingsStruct>> appSettingUpdate(
  AppSettingsStruct item,
  List<AppSettingsStruct> all,
) async {
  // print(item);
  // print("********");

  if (FFAppState().appSettings.length == 0) {
    FFAppState().appSettings = all;
    var index = FFAppState()
        .appSettings
        .indexWhere((curItem) => curItem.title == item.title);

    // print(index);
    if (index == -1) {
      FFAppState().appSettings.add(item);
      // print("add");
    } else {
      FFAppState().appSettings[index] = item;
      // print("update");
    }
    // print(FFAppState().appSettingState);
  } else {
    var index = FFAppState()
        .appSettings
        .indexWhere((curItem) => curItem.title == item.title);

    // print(index);
    if (index == -1) {
      FFAppState().appSettings.add(item);
      // print("add");
    } else {
      FFAppState().appSettings[index] = item;
      // print("update");
    }
    // print(FFAppState().appSettingState);
  }
  return FFAppState().appSettings;
  // Add your function code here!
}
