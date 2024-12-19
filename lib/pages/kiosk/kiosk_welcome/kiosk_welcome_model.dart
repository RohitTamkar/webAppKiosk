import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'kiosk_welcome_widget.dart' show KioskWelcomeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskWelcomeModel extends FlutterFlowModel<KioskWelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPlatformDetails] action in KioskWelcome widget.
  dynamic? docRes;
  // Stores action output result for [Custom Action - checkPlatform] action in KioskWelcome widget.
  String? platform;
  // Stores action output result for [Firestore Query - Query a collection] action in KioskWelcome widget.
  DeviceRecord? deiviceexistnew;
  // Stores action output result for [Backend Call - Create Document] action in KioskWelcome widget.
  DeviceRecord? refnew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
