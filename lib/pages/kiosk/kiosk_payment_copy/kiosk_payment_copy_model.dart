import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'kiosk_payment_copy_widget.dart' show KioskPaymentCopyWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskPaymentCopyModel extends FlutterFlowModel<KioskPaymentCopyWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (phonepeStatus)] action in KioskPaymentCopy widget.
  ApiCallResponse? status;
  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    kioskHeaderModel.dispose();
  }
}
