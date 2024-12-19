import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'loading_screenkiosknew_widget.dart' show LoadingScreenkiosknewWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoadingScreenkiosknewModel
    extends FlutterFlowModel<LoadingScreenkiosknewWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenkiosknew widget.
  OutletRecord? outletgetdirect;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenkiosknew widget.
  List<ShiftRecord>? shiftlist;
  // Stores action output result for [Custom Action - shiftExists] action in loadingScreenkiosknew widget.
  dynamic? shiftdetailskiosknew;
  // Stores action output result for [Custom Action - shiftDetailNewpark] action in loadingScreenkiosknew widget.
  dynamic? shiftDetailsNew;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenkiosknew widget.
  List<TaxMasterRecord>? taxcollection;
  // Stores action output result for [Custom Action - shiftkiosknew] action in loadingScreenkiosknew widget.
  bool? shiftboolean;
  // Stores action output result for [Backend Call - Create Document] action in loadingScreenkiosknew widget.
  ShiftRecord? shiftDoc1;
  // Stores action output result for [Custom Action - shiftExists] action in loadingScreenkiosknew widget.
  dynamic? shiftDetailsNew2;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenkiosknew widget.
  AppSettingsRecord? appsetting;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenkiosknew widget.
  InvoiceRecord? invoicecount;
  // Stores action output result for [Custom Action - shiftExists] action in loadingScreenkiosknew widget.
  dynamic? shiftDetailsNewresumed;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenkiosknew widget.
  AppSettingsRecord? appsetting2;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenkiosknew widget.
  InvoiceRecord? invoicecountshiftresumed;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
