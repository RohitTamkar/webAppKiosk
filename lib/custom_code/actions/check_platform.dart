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

import 'package:client_information/client_information.dart';

import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String?> checkPlatform(String target) async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  if (target == "false") {
    if (defaultTargetPlatform == TargetPlatform.android) {
      //    var information = await ClientInformation.fetch();
      //deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      var information = await ClientInformation.fetch();
      var build = await deviceInfoPlugin.androidInfo;
      FFAppState().dId = information.deviceId;
      FFAppState().targetPlatform = "android";
      return information.deviceId;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      //deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      var build = await deviceInfoPlugin.windowsInfo;
      FFAppState().dId = build.deviceId!;
      FFAppState().targetPlatform = "windows";
      return build.deviceId!;
    }
  } else {
    var build = await deviceInfoPlugin.webBrowserInfo;
    FFAppState().dId = build.productSub!;
    FFAppState().targetPlatform = "web";
    return build.productSub!;
  }

//  return "hi";
}
