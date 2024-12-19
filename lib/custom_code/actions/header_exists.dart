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

Future<DocumentReference?> headerExists() async {
  // Add your function code here!

  DocumentReference? docRecord;

  var query = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc('NS07dCJbj5BqG3KSxAnH')
      .collection('HEADER')
      .limit(1)
      .get();
  if (query.docs.isNotEmpty) {
    docRecord = query.docs.first.reference;
    print('Exist Document data: ');
    FFAppState().headerDocExists = true;
  } else {
    print('Exist Document data: ');
    FFAppState().headerDocExists = false;
  }

  return docRecord;
}
