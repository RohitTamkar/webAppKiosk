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

import 'dart:html' as html;

Future<void> clearCacheBeforeRun2() async {
  try {
    // Clear local storage
    html.window.localStorage.clear();

    // Clear session storage
    html.window.sessionStorage.clear();

    // Clear caches
    if (html.window.caches != null) {
      final cacheNames = await html.window.caches!.keys();
      for (final cacheName in cacheNames) {
        await html.window.caches!.delete(cacheName);
      }
    }

    print('Cache, Local Storage, and Session Storage cleared.');
  } catch (e) {
    print('Error clearing cache and storage: $e');
  }

  // Reload the page only once
}
