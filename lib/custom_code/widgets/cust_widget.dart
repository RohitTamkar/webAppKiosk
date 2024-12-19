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

import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';

class CustWidget extends StatefulWidget {
  const CustWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustWidgetState createState() => _CustWidgetState();
}

class _CustWidgetState extends State<CustWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Custom Alert Dialog Box Example',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("cliked");
          await CustomAlertDialogBox.showCustomAlertBox(
            context: context,
            willDisplayWidget: Container(
              child: Text('My custom alert dialog box'),
            ),
          );
        },
        tooltip: 'Show Custom Alert Box',
        backgroundColor: Colors.blue,
        child: Icon(Icons.receipt),
      ),
    );
  }
}
