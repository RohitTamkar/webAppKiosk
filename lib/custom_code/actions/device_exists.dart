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

Future<bool> deviceExists(
  String id,
  String target,
) async {
  // Add your function code here!
  if (target == "windows") {
    Firestore.initialize('sensiblebizpro');
    var ref = Firestore.instance
        .collection('DEVICE')
        .where('deviceId', isEqualTo: id);
    var document = await ref.get();
    if (document.length > 0) {
      document.forEach((element) {
        print(element);

        if (element["outletId"] != null) {
          FFAppState().outletId = element["outletId"];
          FFAppState().outletIdRef =
              FirebaseFirestore.instance.doc('/OUTLET/' + element["outletId"]);
        }
      });
      return true;
    } else {
      return false;
    }
  } else {
    return FirebaseFirestore.instance
        .collection('DEVICE')
        .where('deviceId', isEqualTo: id)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        print('Document data: ${snapshot.docs}');
        List<dynamic> lst = [];
        lst.add(snapshot.docs.first.data());
        if (lst[0]["outletId"] != null) {
          FFAppState().outletId = lst[0]["outletId"];
          FFAppState().outletIdRef =
              FirebaseFirestore.instance.doc('/OUTLET/' + lst[0]["outletId"]);
        }

        return true;
      } else {
        print('Document does not exist on the database');
        return false;
      }
    });
  }
}
