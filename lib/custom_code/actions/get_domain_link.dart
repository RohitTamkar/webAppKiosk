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

import 'dart:html' as html;

Future<String> getDomainLink() async {
  // Retrieves the URL of the currently running web application
  print(html.window.location.href);
  Uri uri = Uri.parse(html.window.location.href);
  return '${uri.scheme}://${uri.host}/';
}
