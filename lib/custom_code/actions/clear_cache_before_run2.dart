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
    await html.window.caches!.keys().then((cacheNames) async {
      for (var cacheName in cacheNames) {
        var cache = await html.window.caches!.open(cacheName);
        await cache.clear();
      }
    });
    print('Caché CLEARDED.');
  } catch (e) {
    print('Error To clear caché: $e');
  }
  // Recargar páginas
  //html.window.location.reload();
  html.window.onLoad.listen((event) {
    html.window.location.reload();
  });
}
