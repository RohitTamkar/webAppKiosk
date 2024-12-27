import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'response_order_widget.dart' show ResponseOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResponseOrderModel extends FlutterFlowModel<ResponseOrderWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - shiftExists] action in responseOrder widget.
  dynamic? shiftDetailsNewweb;
  // Stores action output result for [Custom Action - filterProducts] action in responseOrder widget.
  List<SelItemListStruct>? prdListkiosk;
  // Stores action output result for [Backend Call - Create Document] action in responseOrder widget.
  InvoiceRecord? docInvoicekiosk;
  // Stores action output result for [Custom Action - calShiftSummary] action in responseOrder widget.
  dynamic? shiftSummarRkiosk;
  // Stores action output result for [Firestore Query - Query a collection] action in responseOrder widget.
  ShiftRecord? shiftref;
  // Stores action output result for [Firestore Query - Query a collection] action in responseOrder widget.
  List<TaxMasterRecord>? taxmaster2;
  // Stores action output result for [Firestore Query - Query a collection] action in responseOrder widget.
  OutletRecord? outletdoc2;
  // Stores action output result for [Firestore Query - Query a collection] action in responseOrder widget.
  AppSettingsRecord? appsetting1;
  // Stores action output result for [Custom Action - removeFromAllBillList] action in responseOrder widget.
  List<dynamic>? rm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
