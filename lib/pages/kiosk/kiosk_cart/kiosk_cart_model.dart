import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'kiosk_cart_widget.dart' show KioskCartWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskCartModel extends FlutterFlowModel<KioskCartWidget> {
  ///  Local state fields for this page.

  bool btnPressed = false;

  ///  State fields for stateful widgets in this page.

  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - reduceQuantityHoldListkiosk] action in IconButton widget.
  List<dynamic>? res2cart;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in IconButton widget.
  double? res2345;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? reu34;
  // Stores action output result for [Custom Action - plusQuantityHoldListkiosk] action in IconButton widget.
  List<dynamic>? resultkioskcart;
  // Stores action output result for [Custom Action - calSubTotalForHoldListkiosk] action in IconButton widget.
  double? res23456;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? reuslt12;
  // Stores action output result for [Custom Action - removeHoldListItem] action in IconButton widget.
  List<dynamic>? res20Copy;
  // Stores action output result for [Custom Action - calSubTotalForHoldList] action in IconButton widget.
  double? res21Copy;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? reuslt22Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outletDOc;
  // Stores action output result for [Backend Call - API (payApi)] action in Button widget.
  ApiCallResponse? apiResulttja;
  // Stores action output result for [Backend Call - API (checkStatus)] action in Button widget.
  ApiCallResponse? checkstatus;
  // Stores action output result for [Custom Action - filterProducts] action in Button widget.
  List<SelItemListStruct>? prdListkiosk;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  QrTransactionsRecord? qRtransaction;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
  }

  @override
  void dispose() {
    kioskHeaderModel.dispose();
  }
}
