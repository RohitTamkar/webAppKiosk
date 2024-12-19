import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'about_us_widget.dart' show AboutUsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutUsModel extends FlutterFlowModel<AboutUsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AboutUs widget.
  CompanyDetailsRecord? companyDetails;
  // Stores action output result for [Firestore Query - Query a collection] action in AboutUs widget.
  AboutUsRecord? aboutUS;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container_About widget.
  TermsAndConditionsRecord? termsandcondition;
  // Stores action output result for [Firestore Query - Query a collection] action in Container_About widget.
  ContactUsRecord? contacvtUS;
  // Stores action output result for [Firestore Query - Query a collection] action in Container_About widget.
  CancellationRefundPolicyRecord? cancel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container_About widget.
  ShippingDeliveryPolicyRecord? shipping;
  // Stores action output result for [Firestore Query - Query a collection] action in Container_About widget.
  PrivacyPolicyRecord? privacypolicy;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
  }
}
