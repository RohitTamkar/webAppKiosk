import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'discount_and_delivery_copy_widget.dart'
    show DiscountAndDeliveryCopyWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiscountAndDeliveryCopyModel
    extends FlutterFlowModel<DiscountAndDeliveryCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldDis widget.
  FocusNode? textFieldDisFocusNode;
  TextEditingController? textFieldDisTextController;
  String? Function(BuildContext, String?)? textFieldDisTextControllerValidator;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldDis widget.
  double? result12;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? result33;
  // State field(s) for TextFieldDisPercent widget.
  FocusNode? textFieldDisPercentFocusNode;
  TextEditingController? textFieldDisPercentTextController;
  String? Function(BuildContext, String?)?
      textFieldDisPercentTextControllerValidator;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldDisPercent widget.
  double? result19;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? result43;
  // State field(s) for TextFieldDeliverychar widget.
  FocusNode? textFieldDeliverycharFocusNode;
  TextEditingController? textFieldDeliverycharTextController;
  String? Function(BuildContext, String?)?
      textFieldDeliverycharTextControllerValidator;
  // Stores action output result for [Custom Action - calBillAmt] action in TextFieldDeliverychar widget.
  double? result13;
  // Stores action output result for [Custom Action - calBillAmt] action in IconButton widget.
  double? result23;
  // State field(s) for TextFieldTEnder widget.
  FocusNode? textFieldTEnderFocusNode;
  TextEditingController? textFieldTEnderTextController;
  String? Function(BuildContext, String?)?
      textFieldTEnderTextControllerValidator;
  // State field(s) for TextFieldReturn widget.
  FocusNode? textFieldReturnFocusNode;
  TextEditingController? textFieldReturnTextController;
  String? Function(BuildContext, String?)?
      textFieldReturnTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldDisFocusNode?.dispose();
    textFieldDisTextController?.dispose();

    textFieldDisPercentFocusNode?.dispose();
    textFieldDisPercentTextController?.dispose();

    textFieldDeliverycharFocusNode?.dispose();
    textFieldDeliverycharTextController?.dispose();

    textFieldTEnderFocusNode?.dispose();
    textFieldTEnderTextController?.dispose();

    textFieldReturnFocusNode?.dispose();
    textFieldReturnTextController?.dispose();
  }
}
