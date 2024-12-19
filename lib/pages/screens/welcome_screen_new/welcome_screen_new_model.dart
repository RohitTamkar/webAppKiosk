import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'welcome_screen_new_widget.dart' show WelcomeScreenNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';

class WelcomeScreenNewModel extends FlutterFlowModel<WelcomeScreenNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getPlatformDetails] action in welcomeScreenNew widget.
  dynamic? docRes;
  // Stores action output result for [Custom Action - checkPlatform] action in welcomeScreenNew widget.
  String? platform;
  // Stores action output result for [Firestore Query - Query a collection] action in welcomeScreenNew widget.
  DeviceRecord? deiviceexistnew;
  // Stores action output result for [Backend Call - Create Document] action in welcomeScreenNew widget.
  DeviceRecord? refnew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
