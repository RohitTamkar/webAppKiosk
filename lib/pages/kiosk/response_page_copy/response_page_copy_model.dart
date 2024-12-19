import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/transaction_status/transaction_status_widget.dart';
import '/components/transaction_status_failed/transaction_status_failed_widget.dart';
import '/components/transaction_status_pending/transaction_status_pending_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'response_page_copy_widget.dart' show ResponsePageCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResponsePageCopyModel extends FlutterFlowModel<ResponsePageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - filterProducts] action in responsePageCopy widget.
  List<SelItemListStruct>? prdListkiosk;
  // Stores action output result for [Backend Call - Create Document] action in responsePageCopy widget.
  InvoiceRecord? docInvoicekiosk;
  // Stores action output result for [Custom Action - calShiftSummary] action in responsePageCopy widget.
  dynamic? shiftSummarRkiosk;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  ShiftRecord? shiftref;
  // Stores action output result for [Custom Action - scanPrinter] action in responsePageCopy widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in responsePageCopy widget.
  bool? isConnected;
  // Stores action output result for [Custom Action - selectBillPrint] action in responsePageCopy widget.
  List<dynamic>? returnedList2kiosk;
  // Stores action output result for [Custom Action - newCustomAction] action in responsePageCopy widget.
  List<dynamic>? device;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  AppSettingsRecord? appsetting;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  OutletRecord? outletdoc;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  List<ServicePointOutletRecord>? spoutlet;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  List<TaxMasterRecord>? taxmaster;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  List<TaxMasterRecord>? taxmaster2;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  OutletRecord? outletdoc2;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePageCopy widget.
  AppSettingsRecord? appsetting1;
  // Stores action output result for [Custom Action - removeFromAllBillList] action in responsePageCopy widget.
  List<dynamic>? rm;
  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // Model for transactionStatus component.
  late TransactionStatusModel transactionStatusModel;
  // Stores action output result for [Custom Action - scanPrinter] action in Text widget.
  bool? resDevice2Copy1;
  // Stores action output result for [Custom Action - connectDevice] action in Text widget.
  bool? isConnectedCopy;
  // Stores action output result for [Custom Action - selectBillPrint] action in Text widget.
  List<dynamic>? returnedList2kioskCopy;
  // Stores action output result for [Custom Action - newCustomAction] action in Text widget.
  List<dynamic>? deviceCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  AppSettingsRecord? appsettingCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  OutletRecord? outletdocCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<ServicePointOutletRecord>? spoutletCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<TaxMasterRecord>? taxmasterCopy;
  // Stores action output result for [Custom Action - shiftExists] action in Text widget.
  dynamic? shiftDetailsNewresumed;
  // Model for transactionStatusFailed component.
  late TransactionStatusFailedModel transactionStatusFailedModel;
  // Model for transactionStatusPending component.
  late TransactionStatusPendingModel transactionStatusPendingModel;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
    transactionStatusModel =
        createModel(context, () => TransactionStatusModel());
    transactionStatusFailedModel =
        createModel(context, () => TransactionStatusFailedModel());
    transactionStatusPendingModel =
        createModel(context, () => TransactionStatusPendingModel());
  }

  @override
  void dispose() {
    kioskHeaderModel.dispose();
    transactionStatusModel.dispose();
    transactionStatusFailedModel.dispose();
    transactionStatusPendingModel.dispose();
  }
}
