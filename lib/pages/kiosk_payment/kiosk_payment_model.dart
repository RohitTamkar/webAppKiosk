import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'kiosk_payment_widget.dart' show KioskPaymentWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskPaymentModel extends FlutterFlowModel<KioskPaymentWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in KioskPayment widget.
  OutletRecord? outlet2;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (transactionStatusAPI)] action in KioskPayment widget.
  ApiCallResponse? apiResultf9m;
  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletCancel;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  QrTransactionsRecord? qrdocCancel;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 180000;
  int timerMilliseconds = 180000;
  String timerValue = StopWatchTimer.getDisplayTime(
    180000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Firestore Query - Query a collection] action in Timer widget.
  OutletRecord? outlet;
  // Stores action output result for [Backend Call - API (transactionStatusAPI)] action in Timer widget.
  ApiCallResponse? apiResultf9m2;
  // Stores action output result for [Firestore Query - Query a collection] action in Timer widget.
  QrTransactionsRecord? qrdoc;
  List<QrTransactionsRecord>? listViewPreviousSnapshot;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    kioskHeaderModel.dispose();
    timerController.dispose();
  }
}
