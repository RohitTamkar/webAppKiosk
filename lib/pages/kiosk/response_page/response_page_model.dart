import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loader_widget.dart';
import '/components/transaction_status_failed/transaction_status_failed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'response_page_widget.dart' show ResponsePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResponsePageModel extends FlutterFlowModel<ResponsePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - shiftExists] action in responsePage widget.
  dynamic? shiftDetailsNewweb;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  QrwebconfigRecord? qrWebOutletdetails;
  // Stores action output result for [Backend Call - API (checkStatus)] action in responsePage widget.
  ApiCallResponse? checkStatus;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  QrTransactionsRecord? qrTransaction2;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  InvoiceRecord? invoice;
  // Stores action output result for [Custom Action - filterProducts] action in responsePage widget.
  List<SelItemListStruct>? prdListkiosk;
  // Stores action output result for [Backend Call - Create Document] action in responsePage widget.
  InvoiceRecord? docInvoicekiosk;
  // Stores action output result for [Firestore Query - Query a collection] action in responsePage widget.
  ShiftRecord? shiftref;
  // Stores action output result for [Custom Action - calShiftSummary] action in responsePage widget.
  dynamic? shiftSummarRkiosk;
  // Stores action output result for [Custom Action - removeFromAllBillList] action in responsePage widget.
  List<dynamic>? rm;
  // Model for transactionStatusFailed component.
  late TransactionStatusFailedModel transactionStatusFailedModel;

  @override
  void initState(BuildContext context) {
    transactionStatusFailedModel =
        createModel(context, () => TransactionStatusFailedModel());
  }

  @override
  void dispose() {
    transactionStatusFailedModel.dispose();
  }
}
