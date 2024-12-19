import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import 'kiosk_customer_info_widget.dart' show KioskCustomerInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskCustomerInfoModel extends FlutterFlowModel<KioskCustomerInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fd37c86v' /* Enter Mobile Number */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'sh145ohz' /* Atleast 10 digit requird  */,
      );
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidate;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PartyRecord? partyDoc;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    kioskHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
