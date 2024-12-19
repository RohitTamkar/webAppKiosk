// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:open_settings/open_settings.dart';

class OpenWIFISetting extends StatefulWidget {
  const OpenWIFISetting({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _OpenWIFISettingState createState() => _OpenWIFISettingState();
}

class _OpenWIFISettingState extends State<OpenWIFISetting> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          OpenSettings.openWIFISetting();
        },
        child: Text('Wi-fi Settings'),
      ),
    );
  }
}
