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

Future<DocumentReference?> createDevice(dynamic deviceDetails) async {
  // Add your function code here!

  CollectionReference device = FirebaseFirestore.instance.collection('DEVICE');
  // var did = "fgdfg";

  // Call the user's CollectionReference to add a new user
  return device.add({
    "active": false,
    "createdDate": DateTime.now().millisecondsSinceEpoch,
    "deviceId": deviceDetails["deviceId"],
    "model": deviceDetails["model"],
    "brand": deviceDetails["brand"],
    "manufactrer": deviceDetails["manufacturer"],
    "outletName": deviceDetails["outletName"],
    "outletRef": deviceDetails["outletRef"],
    "outletId": deviceDetails["outletId"],
    "branch": deviceDetails["branch"],
    "platform": deviceDetails["platform"]
  }).then((value) {
    print("device Added");
    return value;
  }).catchError((error) {
    print("Failed to add  $error");
    return error;
  });
}
