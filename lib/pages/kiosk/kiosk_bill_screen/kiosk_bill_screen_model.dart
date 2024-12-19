import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'kiosk_bill_screen_widget.dart' show KioskBillScreenWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskBillScreenModel extends FlutterFlowModel<KioskBillScreenWidget> {
  ///  Local state fields for this page.

  List<ProductRecord> productDoc = [];
  void addToProductDoc(ProductRecord item) => productDoc.add(item);
  void removeFromProductDoc(ProductRecord item) => productDoc.remove(item);
  void removeAtIndexFromProductDoc(int index) => productDoc.removeAt(index);
  void insertAtIndexInProductDoc(int index, ProductRecord item) =>
      productDoc.insert(index, item);
  void updateProductDocAtIndex(int index, Function(ProductRecord) updateFn) =>
      productDoc[index] = updateFn(productDoc[index]);

  int? startLoop;

  bool pressed = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in KioskBillScreen widget.
  List<ProductRecord>? prodoc;
  // Stores action output result for [Firestore Query - Query a collection] action in KioskBillScreen widget.
  List<CategoryRecord>? categorydoc;
  // Stores action output result for [Custom Action - scanPrinter] action in KioskBillScreen widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in KioskBillScreen widget.
  bool? connectdeviceCOPY23;
  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  AppSettingsRecord? appsettingresfresh;
  // Stores action output result for [Custom Action - addToHoldListkioskGst] action in Container widget.
  List<dynamic>? result1;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in Container widget.
  double? resp2;
  // Stores action output result for [Custom Action - calBillAmt] action in Container widget.
  double? res3;
  // Stores action output result for [Custom Action - addToHoldListkioskGst] action in Container widget.
  List<dynamic>? result4;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in Container widget.
  double? res5;
  // Stores action output result for [Custom Action - calBillAmt] action in Container widget.
  double? res6;
  // Stores action output result for [Custom Action - reduceQuantityHoldListkiosk] action in IconButton widget.
  List<dynamic>? resultkiosk;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in IconButton widget.
  double? res2345;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? reu34;
  // Stores action output result for [Custom Action - plusQuantityHoldListkiosk] action in IconButton widget.
  List<dynamic>? kioskresult;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in IconButton widget.
  double? res234;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? reuslt12;
  // Stores action output result for [Backend Call - API (phonePeQR)] action in Button widget.
  ApiCallResponse? phonePedata;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
  }

  @override
  void dispose() {
    kioskHeaderModel.dispose();
  }
}
