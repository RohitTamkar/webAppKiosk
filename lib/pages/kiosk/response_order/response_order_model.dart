import '/backend/backend.dart';
import '/components/transaction_status/transaction_status_widget.dart';
import '/components/transaction_status_failed/transaction_status_failed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'response_order_widget.dart' show ResponseOrderWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResponseOrderModel extends FlutterFlowModel<ResponseOrderWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for transactionStatus component.
  late TransactionStatusModel transactionStatusModel;
  // Model for transactionStatusFailed component.
  late TransactionStatusFailedModel transactionStatusFailedModel;

  @override
  void initState(BuildContext context) {
    transactionStatusModel =
        createModel(context, () => TransactionStatusModel());
    transactionStatusFailedModel =
        createModel(context, () => TransactionStatusFailedModel());
  }

  @override
  void dispose() {
    transactionStatusModel.dispose();
    transactionStatusFailedModel.dispose();
  }
}
