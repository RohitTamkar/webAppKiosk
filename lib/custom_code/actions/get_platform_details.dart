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

// Imports other custom actions
import 'package:client_information/client_information.dart';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'dart:async';

Future<dynamic> getPlatformDetails(String target) async {
  // List<dynamic> doc=[];
  print(target);
  print(defaultTargetPlatform);

  if (target == "false") {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

      //deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      var build = await deviceInfoPlugin.androidInfo;
      var information = await ClientInformation.fetch();
      FFAppState().dId = information.deviceId;
      print(build.toString());
      final data = {
        "board": build.board,
        "brand": build.brand,
        "manufacturer": build.manufacturer,
        "model": build.model,
        "deviceId": information.deviceId,
        "platform": 'ANDROID',
        'displaySizeInches': "",
      };

      return data;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      //deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      var build = await deviceInfoPlugin.windowsInfo;
      FFAppState().dId = build.deviceId;
      print(build.toString());
      final data = {
        "board": build.productName,
        "brand": build.computerName,
        "manufacturer": build.data,
        "model": build.productId,
        "deviceId": build.deviceId,
        "platform": "WINDOWS"
      };

      return data;
    }
  } else {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    var build = await deviceInfoPlugin.webBrowserInfo;
    FFAppState().dId = build.productSub!;
    print(build.toString());
    final data = {
      "board": build.platform,
      "brand": build.product,
      "manufacturer": build.vendor,
      "model": "build.model",
      "deviceId": build.productSub,
      "browserName": build.browserName,
      "platform": 'WEB'
    };

    print(data.toString());
    return data;
  }

//  return "hi";
}
