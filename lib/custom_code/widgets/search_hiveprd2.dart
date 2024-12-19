// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/scheduler.dart';
import '/custom_code/actions/index.dart' as actions;

import '/flutter_flow/custom_functions.dart' as functions;
// Imports other custom widgets
import '/flutter_flow/custom_functions.dart' as functions;
import '../actions/setup_item_hive.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter/scheduler.dart';

class SearchHiveprd2 extends StatefulWidget {
  const SearchHiveprd2({
    Key? key,
    this.width,
    this.height,
    required this.document,
    required this.billno,
    required this.billnum,
    required this.disAmt,
    required this.delChargs,
    required this.taxcollection,
    required this.appSettingsRecord,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<ProductStructStruct> document;
  final int billno;
  final String billnum;
  final double disAmt;
  final double delChargs;
  final List<TaxMasterRecord> taxcollection;
  final AppSettingsRecord appSettingsRecord;

  @override
  _SearchHiveprd2State createState() => _SearchHiveprd2State();
}

class _SearchHiveprd2State extends State<SearchHiveprd2> {
  TextEditingController _productNameController = TextEditingController();

  late LoadingScreenNewModel _model;
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => LoadingScreenNewModel());
  }

  LoadingScreenNewModel createModel(
      BuildContext context, LoadingScreenNewModel Function() modelBuilder) {
    return modelBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeAheadField<ProductStructStruct>(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _productNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          suggestionsCallback: (pattern) async {
            try {
              // Simulate an asynchronous call with Future.delayed
              await Future.delayed(Duration(seconds: 1));

              return widget.document
                  .where((product) => product.name
                      .toLowerCase()
                      .contains(pattern.toLowerCase()))
                  .toList();
            } catch (e) {
              print('Error fetching suggestions: $e');
              return [];
            }
          },
          itemBuilder: (context, ProductStructStruct product) {
            return ListTile(
              title: Text(product.name),
              subtitle: Text('\₹${product.sellingPrice.toStringAsFixed(2)}'),
            );
          },
          /* loadingBuilder: (BuildContext context) {
              return SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              );
            },*/
          noItemsFoundBuilder: (BuildContext context) {
            return Text('No products found');
          },
          debounceDuration: Duration(milliseconds: 500),
          onSuggestionSelected: (ProductStructStruct document) async {
            _productNameController.clear();
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
              document,
              FFAppState().selBill,
              widget.taxcollection!.toList(),
              functions
                  .enabletaxinclusive(widget.appSettingsRecord.inclusiveTax),
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
          },
        ),
      ],
    );
  }
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
  void submitForm() async {
    print('Form submitted!');
  }
}
