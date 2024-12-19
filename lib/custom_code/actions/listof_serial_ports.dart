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

import 'package:flutter_libserialport/flutter_libserialport.dart';

Future<List<String>> listofSerialPorts() async {
  // Retrieve the list of available serial ports
  List<String> availablePorts = SerialPort.availablePorts;

  // Return the list of port names
  return availablePorts;
}
