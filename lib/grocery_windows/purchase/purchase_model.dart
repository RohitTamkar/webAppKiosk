import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'purchase_widget.dart' show PurchaseWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PurchaseModel extends FlutterFlowModel<PurchaseWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldaccqty widget.
  FocusNode? textFieldaccqtyFocusNode;
  TextEditingController? textFieldaccqtyTextController;
  String? Function(BuildContext, String?)?
      textFieldaccqtyTextControllerValidator;
  // State field(s) for TextFieldrejqty widget.
  FocusNode? textFieldrejqtyFocusNode;
  TextEditingController? textFieldrejqtyTextController;
  String? Function(BuildContext, String?)?
      textFieldrejqtyTextControllerValidator;
  // State field(s) for TextFieldnote widget.
  FocusNode? textFieldnoteFocusNode;
  TextEditingController? textFieldnoteTextController;
  String? Function(BuildContext, String?)? textFieldnoteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldaccqtyFocusNode?.dispose();
    textFieldaccqtyTextController?.dispose();

    textFieldrejqtyFocusNode?.dispose();
    textFieldrejqtyTextController?.dispose();

    textFieldnoteFocusNode?.dispose();
    textFieldnoteTextController?.dispose();
  }
}
