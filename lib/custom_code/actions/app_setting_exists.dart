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

import "package:firedart/firedart.dart";

Future<bool> appSettingExists(
  String outletId,
  String traget,
) async {
  bool flag = false;
  // Add your function code here!
  if (traget == "windows") {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    var ref = firestore.collection('OUTLET/' + outletId + '/APP_SETTINGS');

    var document = await ref.get();
    if (document.docs.length == 0) {
      flag = false;
    } else {
      flag = true;
    }
  } else {
    var flag1 = FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(outletId)
        .collection("APP_SETTINGS")
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        print('Document data: ${snapshot.docs}');
        return true;
      } else {
        print('Document does not exist on the database');
        return false;
      }
    });
  }
  return true;
}
