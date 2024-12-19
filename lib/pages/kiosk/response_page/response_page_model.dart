import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/transaction_status/transaction_status_widget.dart';
import '/components/transaction_status_failed/transaction_status_failed_widget.dart';
import '/components/transaction_status_pending/transaction_status_pending_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'response_page_widget.dart' show ResponsePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResponsePageModel extends FlutterFlowModel<ResponsePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - filterProducts] action in responsePage widget.
  List<SelItemListStruct>? prdListkiosk;
  // Stores action output result for [Backend Call - Create Document] action in responsePage widget.
  InvoiceRecord? docInvoicekiosk;
  // Stores action output result for [Custom Action - calShiftSummary] action in responsePage widget.
  dynamic? shiftSummarRkiosk;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  ShiftRecord? shiftref;
  // Stores action output result for [Custom Action - scanPrinter] action in responsePage widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in responsePage widget.
  bool? isConnected;
  // Stores action output result for [Custom Action - selectBillPrint] action in responsePage widget.
  List<dynamic>? returnedList2kiosk;
  // Stores action output result for [Custom Action - newCustomAction] action in responsePage widget.
  List<dynamic>? device;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  AppSettingsRecord? appsetting;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  OutletRecord? outletdoc;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  List<ServicePointOutletRecord>? spoutlet;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  ProductRecord? stockupdateprd;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  List<TaxMasterRecord>? taxmaster;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  List<TaxMasterRecord>? taxmaster2;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  OutletRecord? outletdoc2;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  AppSettingsRecord? appsetting1;
  // Stores action output result for [Custom Action - removeFromAllBillList] action in responsePage widget.
  List<dynamic>? rm;
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
    transactionStatusModel =
        createModel(context, () => TransactionStatusModel());
    transactionStatusFailedModel =
        createModel(context, () => TransactionStatusFailedModel());
    transactionStatusPendingModel =
        createModel(context, () => TransactionStatusPendingModel());
  }

  @override
  void dispose() {
    transactionStatusModel.dispose();
    transactionStatusFailedModel.dispose();
    transactionStatusPendingModel.dispose();
  }
}
