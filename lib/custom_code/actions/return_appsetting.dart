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

// Imports other custom actions
Future<List<AppSettingsStruct>> returnAppsetting(
  List<AppSettingsMasterRecord> appSettingMaster,
  List<AppSettingsStruct> appSettinglist,
) async {
  for (var masterRecord in appSettingMaster) {
    // Find the matching record in appSettinglist
    var existingRecord = appSettinglist.firstWhere(
      (item) =>
          item.title == masterRecord.title &&
          item.display == masterRecord.display &&
          item.isDeleted == masterRecord.isDeleted,
      orElse: () => AppSettingsStruct(
        title: '', // Default placeholder values
        display: '',
        value: false,
        isDeleted: false,
        settingType: '', // Adjust based on your data structure
      ), // Return null if no match is found
    );

    if (existingRecord.title != null && existingRecord.title != '') {
      // Update settingType if the record exists
      existingRecord.settingType = masterRecord.settingType;
    } else {
      // If it doesn't exist, add it to the list with default value false
      appSettinglist.add(AppSettingsStruct(
        title: masterRecord.title,
        display: masterRecord.display,
        value: false,
        isDeleted: masterRecord.isDeleted,
        settingType: masterRecord.settingType,
      ));
    }
  }

  return appSettinglist;
}
