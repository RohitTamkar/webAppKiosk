import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'product_search_widget.dart' show ProductSearchWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ProductSearchModel extends FlutterFlowModel<ProductSearchWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldsearchProd widget.
  FocusNode? textFieldsearchProdFocusNode;
  TextEditingController? textFieldsearchProdTextController;
  String? Function(BuildContext, String?)?
      textFieldsearchProdTextControllerValidator;
  List<ProductRecord> simpleSearchResults = [];
  // Stores action output result for [Custom Action - addToListCopy] action in Card widget.
  List<dynamic>? productListSearch;
  // Stores action output result for [Custom Action - calSubTotal] action in Card widget.
  double? subTotal;
  // Stores action output result for [Custom Action - addToListCopy] action in Card widget.
  List<dynamic>? productResultList;
  // Stores action output result for [Custom Action - calSubTotal] action in Card widget.
  double? subTotal1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldsearchProdFocusNode?.dispose();
    textFieldsearchProdTextController?.dispose();
  }
}
