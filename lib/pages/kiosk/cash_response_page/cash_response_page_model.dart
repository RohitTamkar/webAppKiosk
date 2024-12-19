import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/cash_confirm_order/cash_confirm_order_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'cash_response_page_widget.dart' show CashResponsePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CashResponsePageModel extends FlutterFlowModel<CashResponsePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - filterProducts] action in cashResponsePage widget.
  List<SelItemListStruct>? prdListkiosk;
  // Stores action output result for [Backend Call - Create Document] action in cashResponsePage widget.
  InvoiceRecord? docInvoicekiosk;
  // Stores action output result for [Backend Call - Create Document] action in cashResponsePage widget.
  QrTransactionsRecord? qRTransDocOut;
  // Stores action output result for [Custom Action - calShiftSummary] action in cashResponsePage widget.
  dynamic? shiftSummarRkiosk;
  // Stores action output result for [Firestore Query - Query a collection] action in cashResponsePage widget.
  ShiftRecord? shiftref;
  // Stores action output result for [Custom Action - scanPrinter] action in cashResponsePage widget.
  bool? resDevice2;
  // Stores action output result for [Custom Action - connectDevice] action in cashResponsePage widget.
  bool? isConnected;
  // Stores action output result for [Custom Action - selectBillPrint] action in cashResponsePage widget.
  List<dynamic>? returnedList2kiosk;
  // Stores action output result for [Custom Action - newCustomAction] action in cashResponsePage widget.
  List<dynamic>? device;
  // Stores action output result for [Firestore Query - Query a collection] action in cashResponsePage widget.
  AppSettingsRecord? appsetting;
  // Stores action output result for [Firestore Query - Query a collection] action in cashResponsePage widget.
  OutletRecord? outletdoc;
  // Stores action output result for [Firestore Query - Query a collection] action in cashResponsePage widget.
  List<ServicePointOutletRecord>? spoutlet;
  // Stores action output result for [Firestore Query - Query a collection] action in cashResponsePage widget.
  ProductRecord? stockupdateprd;
  // Stores action output result for [Firestore Query - Query a collection] action in cashResponsePage widget.
  List<TaxMasterRecord>? taxmaster;
  // Model for cashConfirmOrder component.
  late CashConfirmOrderModel cashConfirmOrderModel;
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

  @override
  void initState(BuildContext context) {
    cashConfirmOrderModel = createModel(context, () => CashConfirmOrderModel());
  }

  @override
  void dispose() {
    cashConfirmOrderModel.dispose();
  }
}
