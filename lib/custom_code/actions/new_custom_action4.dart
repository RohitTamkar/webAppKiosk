// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart' as actions;

import '/flutter_flow/custom_functions.dart' as functions;

Future newCustomAction4(
  List<ProductStructStruct> document,
  int billno,
  String billnum,
  double disAmt,
  double delChargs,
  List<TaxMasterRecord> taxcollection,
  AppSettingsRecord appSettingsRecord,
  String barcode,
) async {
  // Add your function code here!

  /* List<ProductStructStruct> matchingProducts = document
      .where((product) => product.barcode == barcode)
      .toList();*/
  final _model = LoadingScreenNewModel();
  LoadingScreenNewModel createModel(
      BuildContext context, LoadingScreenNewModel Function() modelBuilder) {
    return modelBuilder();
  }

  String enteredValue = barcode;
  List<ProductStructStruct> matchingProducts =
      document.where((product) => product.barcode == enteredValue).toList();

  ProductStructStruct selectedProduct = matchingProducts.first;

  if (FFAppState().holdBillCount == 0) {
    FFAppState().holdBillCount = FFAppState().holdBillCount + 1;
    FFAppState().addToAllBillsList(functions.generateBillDetailsJson(
        0.0,
        0.0,
        0.0,
        'CASH',
        0.0,
        0.0,
        FFAppState().billAmt,
        0.0,
        FFAppState().finalAmt,
        '0',
        FFAppState().itemCartList.toList(),
        FFAppState().holdBillCount));
    FFAppState().selBill = 1;
  }
  _model.addtosavebill = await actions.addToHoldListprdCopy(
    selectedProduct,
    FFAppState().selBill,
    taxcollection!.toList(),
    functions.enabletaxinclusive(appSettingsRecord.inclusiveTax),
  );
  _model.calculateResult = await actions.calSubTotalForHoldList(
    FFAppState().selBill.toString(),
    _model.addtosavebill!.toList(),
  );
  _model.calbillAmt = await actions.calBillAmt(
    FFAppState().disAmt,
    FFAppState().delCharges,
  );
  await _model.listViewprd?.animateTo(
    _model.listViewprd!.position.maxScrollExtent,
    duration: Duration(milliseconds: 100),
    curve: Curves.ease,
  );
}

class LoadingScreenNewModel {
  List<ProductStructStruct> productHive = [];
  void addToProductHive(ProductStructStruct item) => productHive.add(item);
  void initState(BuildContext context) {}
  final unfocusNode = FocusNode();
  List<ProductStructStruct>? hiveProductList;

  List<dynamic>? addtosavebill;

  double? calculateResult;

  double? calbillAmt;

  ProductStructStruct? getproductForupdate;

  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;

  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  ScrollController? listViewprd;
}
