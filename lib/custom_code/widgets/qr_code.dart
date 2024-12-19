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

import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode({
    Key? key,
    this.width,
    this.height,
    this.data,
    this.size,
    this.backgroundColor,
    this.foregroundColor,
    // this.semanticsLabel,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? data;
  final double? size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  // final String semanticsLabel;

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: QrImageView(
        data: widget.data.toString(),
        version: QrVersions.auto,
        size: widget.size,
        backgroundColor: widget.backgroundColor!!,
        foregroundColor: widget.foregroundColor,
      ),
      // child: QrImage(
      //   version: QrVersions.auto,
      //   data: widget.data.toString(),
      //   size: widget.size,
      //   backgroundColor: widget.backgroundColor!!,
      //   foregroundColor: widget.foregroundColor,
      //   gapless: true,
      //   // semanticsLabel: widget.semanticsLabel.toString()
      // ),
    );
  }
}
