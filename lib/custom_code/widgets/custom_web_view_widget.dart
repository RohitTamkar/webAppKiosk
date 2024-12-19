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

//import '../../flutter_flow/flutter_flow_web_view.dart';

//import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewWidget extends StatefulWidget {
  const CustomWebViewWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.link,
  }) : super(key: key);

  final double width;
  final double height;
  final String link;

  @override
  _CustomWebViewWidgetState createState() => _CustomWebViewWidgetState();
}

class _CustomWebViewWidgetState extends State<CustomWebViewWidget> {
  //late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      // child: FlutterFlowWebView(
      //   content: 'https://rzp.io/i/38Ksh2uXn',
      //   bypass: false,
      //   height: 700.0,
      //   verticalScroll: false,
      //   horizontalScroll: false,
      // ),
    );
  }
}
