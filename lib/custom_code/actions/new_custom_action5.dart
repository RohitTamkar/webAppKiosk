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

import 'dart:io';

Future<void> newCustomAction5() async {
  await deleteFirestoreFolder();
}

Future<void> deleteFirestoreFolder() async {
  try {
    // Define the path to the Firestore folder
    // final directoryPath = FFAppState().directory;
//C:\\Users\\Pos\\AppData\\Local\\firestore'
    // Create a reference to the directory
    final directory = Directory(FFAppState().directory);

    // Check if the directory exists
    if (await directory.exists()) {
      // Recursively delete the directory and its contents
      await directory.delete(recursive: true);
      print('Firestore folder deleted successfully.');
    } else {
      print('Firestore folder does not exist.');
    }
  } catch (e) {
    print('Error deleting Firestore folder: $e');
  }
}
