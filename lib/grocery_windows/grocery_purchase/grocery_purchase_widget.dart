import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'grocery_purchase_model.dart';
export 'grocery_purchase_model.dart';

class GroceryPurchaseWidget extends StatefulWidget {
  const GroceryPurchaseWidget({
    super.key,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.unitList,
    this.jsonitem,
  });

  final ProductStructStruct? parameter2;
  final List<TaxMasterRecord>? parameter3;
  final bool? parameter4;
  final List<UnitTypeRecord>? unitList;
  final dynamic jsonitem;

  @override
  State<GroceryPurchaseWidget> createState() => _GroceryPurchaseWidgetState();
}

class _GroceryPurchaseWidgetState extends State<GroceryPurchaseWidget> {
  late GroceryPurchaseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroceryPurchaseModel());

    _model.textFieldqtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.quantity''',
    ).toString().toString());
    _model.textFieldqtFocusNode ??= FocusNode();
    _model.textFieldqtFocusNode!.addListener(() => safeSetState(() {}));
    _model.textFieldrateTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.price''',
    ).toString().toString());
    _model.textFieldrateFocusNode ??= FocusNode();

    _model.textFielddisPerTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.mfgDate''',
    ).toString().toString());
    _model.textFielddisPerFocusNode ??= FocusNode();

    _model.textFielddisAmtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.expDate''',
    ).toString().toString());
    _model.textFielddisAmtFocusNode ??= FocusNode();

    _model.textFieldtaxPerTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.taxPer''',
    ).toString().toString());
    _model.textFieldtaxPerFocusNode ??= FocusNode();

    _model.textFieldTaxAmtTextController ??= TextEditingController(
        text: getJsonField(
      widget!.jsonitem,
      r'''$.taxAmt''',
    ).toString().toString());
    _model.textFieldTaxAmtFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        if (FFAppState().groceryshow)
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 3.0, 0.0, 3.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            getJsonField(
                              widget!.jsonitem,
                              r'''$.srno''',
                            ).toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SelectionArea(
                              child: Text(
                            getJsonField(
                              widget!.jsonitem,
                              r'''$.barcode''',
                            ).toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          )),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            getJsonField(
                              widget!.jsonitem,
                              r'''$.name''',
                            ).toString(),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  color: Color(0xFF446AFE),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 25.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.remove,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 10.0,
                          ),
                          onPressed: () async {
                            if (_model.textFieldqtTextController.text !=
                                '1.0') {
                              safeSetState(() {
                                _model.textFieldqtTextController?.text =
                                    (double.parse(_model
                                                .textFieldqtTextController
                                                .text) -
                                            1)
                                        .toString();
                              });
                              _model.allbillistplusCopy =
                                  await actions.addToHoldListGrCalculationqty(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                double.parse(
                                    _model.textFielddisPerTextController.text),
                                double.parse(
                                    _model.textFielddisAmtTextController.text),
                                double.parse(
                                    _model.textFieldrateTextController.text),
                                double.parse(
                                    _model.textFieldqtTextController.text),
                                double.parse(
                                    _model.textFieldtaxPerTextController.text),
                                double.parse(
                                    _model.textFieldTaxAmtTextController.text),
                              );
                              safeSetState(() {
                                _model.textFielddisAmtTextController?.text =
                                    getJsonField(
                                  _model.allbillistplusCopy!
                                      .where((e) =>
                                          getJsonField(
                                            e,
                                            r'''$.id''',
                                          ) ==
                                          getJsonField(
                                            widget!.jsonitem,
                                            r'''$.id''',
                                          ))
                                      .toList()
                                      .firstOrNull,
                                  r'''$.disAmt''',
                                ).toString();
                              });
                              safeSetState(() {
                                _model.textFieldTaxAmtTextController?.text =
                                    getJsonField(
                                  _model.allbillistplusCopy!
                                      .where((e) =>
                                          getJsonField(
                                            e,
                                            r'''$.id''',
                                          ) ==
                                          getJsonField(
                                            widget!.jsonitem,
                                            r'''$.id''',
                                          ))
                                      .toList()
                                      .firstOrNull,
                                  r'''$.taxAmt''',
                                ).toString();
                              });
                              _model.output1Copy =
                                  await actions.calSubTotalForGrocery(
                                FFAppState().selBill.toString(),
                                FFAppState().allBillsList.toList(),
                              );
                              _model.reuslt121Copy =
                                  await actions.calBillAmtGrocery(
                                valueOrDefault<double>(
                                  FFAppState().disAmt,
                                  0.0,
                                ),
                                FFAppState().delCharges,
                              );
                              FFAppState().finalAmt = FFAppState().finalAmt;
                              FFAppState().update(() {});
                            } else {
                              safeSetState(() {
                                _model.textFieldqtTextController?.text = '1.0';
                              });
                            }

                            safeSetState(() {});
                          },
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _model.textFieldqtTextController,
                            focusNode: _model.textFieldqtFocusNode,
                            onFieldSubmitted: (_) async {
                              _model.allbillist =
                                  await actions.addToHoldListGrCalculationqty(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                double.parse(
                                    _model.textFielddisPerTextController.text),
                                double.parse(
                                    _model.textFielddisAmtTextController.text),
                                double.parse(
                                    _model.textFieldrateTextController.text),
                                double.parse(
                                    _model.textFieldqtTextController.text),
                                double.parse(
                                    _model.textFieldtaxPerTextController.text),
                                double.parse(
                                    _model.textFieldTaxAmtTextController.text),
                              );
                              safeSetState(() {
                                _model.textFielddisAmtTextController?.text =
                                    getJsonField(
                                  _model.allbillist!
                                      .where((e) =>
                                          getJsonField(
                                            widget!.jsonitem,
                                            r'''$.id''',
                                          ) ==
                                          getJsonField(
                                            e,
                                            r'''$.id''',
                                          ))
                                      .toList()
                                      .firstOrNull,
                                  r'''$.disAmt''',
                                ).toString();
                              });
                              safeSetState(() {
                                _model.textFieldTaxAmtTextController?.text =
                                    getJsonField(
                                  _model.allbillist!
                                      .where((e) =>
                                          getJsonField(
                                            widget!.jsonitem,
                                            r'''$.id''',
                                          ) ==
                                          getJsonField(
                                            e,
                                            r'''$.id''',
                                          ))
                                      .toList()
                                      .firstOrNull,
                                  r'''$.taxAmt''',
                                ).toString();
                              });
                              _model.output =
                                  await actions.calSubTotalForGrocery(
                                FFAppState().selBill.toString(),
                                FFAppState().allBillsList.toList(),
                              );
                              _model.reuslt12 = await actions.calBillAmtGrocery(
                                valueOrDefault<double>(
                                  FFAppState().disAmt,
                                  0.0,
                                ),
                                FFAppState().delCharges,
                              );

                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F6FB),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                            textAlign: TextAlign.center,
                            validator: _model.textFieldqtTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 25.0,
                          fillColor: FlutterFlowTheme.of(context).alternate,
                          icon: Icon(
                            Icons.add,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 10.0,
                          ),
                          onPressed: () async {
                            safeSetState(() {
                              _model.textFieldqtTextController?.text =
                                  (double.parse(_model
                                              .textFieldqtTextController.text) +
                                          1)
                                      .toString();
                            });
                            _model.all =
                                await actions.addToHoldListGrCalculationqty(
                              widget!.parameter2!,
                              FFAppState().selBill,
                              widget!.parameter3!.toList(),
                              functions.enabletaxinclusive(widget!.parameter4!),
                              widget!.unitList!.toList(),
                              double.parse(
                                  _model.textFielddisPerTextController.text),
                              double.parse(
                                  _model.textFielddisAmtTextController.text),
                              double.parse(
                                  _model.textFieldrateTextController.text),
                              double.parse(
                                  _model.textFieldqtTextController.text),
                              double.parse(
                                  _model.textFieldtaxPerTextController.text),
                              double.parse(
                                  _model.textFieldTaxAmtTextController.text),
                            );
                            safeSetState(() {
                              _model.textFielddisAmtTextController?.text =
                                  getJsonField(
                                _model.all!
                                    .where((e) =>
                                        getJsonField(
                                          widget!.jsonitem,
                                          r'''$.id''',
                                        ) ==
                                        getJsonField(
                                          e,
                                          r'''$.id''',
                                        ))
                                    .toList()
                                    .firstOrNull,
                                r'''$.disAmt''',
                              ).toString();
                            });
                            safeSetState(() {
                              _model.textFieldTaxAmtTextController?.text =
                                  getJsonField(
                                _model.all!
                                    .where((e) =>
                                        getJsonField(
                                          widget!.jsonitem,
                                          r'''$.id''',
                                        ) ==
                                        getJsonField(
                                          e,
                                          r'''$.id''',
                                        ))
                                    .toList()
                                    .firstOrNull,
                                r'''$.taxAmt''',
                              ).toString();
                            });
                            _model.output1 =
                                await actions.calSubTotalForGrocery(
                              FFAppState().selBill.toString(),
                              FFAppState().allBillsList.toList(),
                            );
                            _model.reuslt121 = await actions.calBillAmtGrocery(
                              valueOrDefault<double>(
                                FFAppState().disAmt,
                                0.0,
                              ),
                              FFAppState().delCharges,
                            );
                            FFAppState().finalAmt = FFAppState().finalAmt;
                            FFAppState().update(() {});

                            safeSetState(() {});
                          },
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            getJsonField(
                              widget!.jsonitem,
                              r'''$.unit''',
                            ).toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textFieldrateTextController,
                            focusNode: _model.textFieldrateFocusNode,
                            onFieldSubmitted: (_) async {
                              _model.ratechanged =
                                  await actions.ratePriceChangedFunctiongrocery(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                double.parse(
                                    _model.textFielddisPerTextController.text),
                                double.parse(
                                    _model.textFielddisAmtTextController.text),
                                double.parse(
                                    _model.textFieldrateTextController.text),
                                double.parse(
                                    _model.textFieldqtTextController.text),
                                double.parse(
                                    _model.textFieldtaxPerTextController.text),
                                double.parse(
                                    _model.textFieldTaxAmtTextController.text),
                              );
                              safeSetState(() {
                                _model.textFieldTaxAmtTextController?.text =
                                    valueOrDefault<String>(
                                  getJsonField(
                                    _model.ratechanged
                                        ?.where((e) =>
                                            getJsonField(
                                              e,
                                              r'''$.id''',
                                            ) ==
                                            getJsonField(
                                              widget!.jsonitem,
                                              r'''$.id''',
                                            ))
                                        .toList()
                                        ?.firstOrNull,
                                    r'''$.taxAmt''',
                                  )?.toString(),
                                  '0',
                                );
                              });
                              safeSetState(() {
                                _model.textFielddisAmtTextController?.text =
                                    valueOrDefault<String>(
                                  getJsonField(
                                    _model.ratechanged
                                        ?.where((e) =>
                                            getJsonField(
                                              e,
                                              r'''$.id''',
                                            ) ==
                                            getJsonField(
                                              widget!.jsonitem,
                                              r'''$.id''',
                                            ))
                                        .toList()
                                        ?.firstOrNull,
                                    r'''$.disAmt''',
                                  )?.toString(),
                                  '0',
                                );
                              });
                              _model.outputr2 =
                                  await actions.calSubTotalForGrocery(
                                FFAppState().selBill.toString(),
                                FFAppState().allBillsList.toList(),
                              );
                              _model.reuslt122 =
                                  await actions.calBillAmtGrocery(
                                valueOrDefault<double>(
                                  FFAppState().disAmt,
                                  0.0,
                                ),
                                FFAppState().delCharges,
                              );

                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F6FB),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                            textAlign: TextAlign.center,
                            validator: _model
                                .textFieldrateTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            getJsonField(
                              widget!.jsonitem,
                              r'''$.mrpPrice''',
                            ).toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textFielddisPerTextController,
                            focusNode: _model.textFielddisPerFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textFielddisPerTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.listCopy =
                                    await actions.addToHoldListGrmfgdate(
                                  widget!.parameter2!,
                                  FFAppState().selBill,
                                  widget!.parameter3!.toList(),
                                  functions
                                      .enabletaxinclusive(widget!.parameter4!),
                                  widget!.unitList!.toList(),
                                  _model.textFielddisPerTextController.text,
                                  _model.textFielddisAmtTextController.text,
                                );

                                safeSetState(() {});
                              },
                            ),
                            onFieldSubmitted: (_) async {
                              _model.list =
                                  await actions.addToHoldListGrmfgdate(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                _model.textFielddisPerTextController.text,
                                _model.textFielddisAmtTextController.text,
                              );

                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F6FB),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                            textAlign: TextAlign.center,
                            validator: _model
                                .textFielddisPerTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textFielddisAmtTextController,
                            focusNode: _model.textFielddisAmtFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textFielddisAmtTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.listCopyCopy =
                                    await actions.addToHoldListGrmfgdate(
                                  widget!.parameter2!,
                                  FFAppState().selBill,
                                  widget!.parameter3!.toList(),
                                  functions
                                      .enabletaxinclusive(widget!.parameter4!),
                                  widget!.unitList!.toList(),
                                  _model.textFielddisPerTextController.text,
                                  _model.textFielddisAmtTextController.text,
                                );

                                safeSetState(() {});
                              },
                            ),
                            onFieldSubmitted: (_) async {
                              _model.list645 =
                                  await actions.addToHoldListGrmfgdate(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                _model.textFielddisPerTextController.text,
                                _model.textFielddisAmtTextController.text,
                              );

                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F6FB),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                            textAlign: TextAlign.center,
                            validator: _model
                                .textFielddisAmtTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textFieldtaxPerTextController,
                            focusNode: _model.textFieldtaxPerFocusNode,
                            onFieldSubmitted: (_) async {
                              _model.taxperchenged =
                                  await actions.taxPerChangedFunctiongrocery(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                double.parse(
                                    _model.textFielddisPerTextController.text),
                                double.parse(
                                    _model.textFielddisAmtTextController.text),
                                double.parse(
                                    _model.textFieldrateTextController.text),
                                double.parse(
                                    _model.textFieldqtTextController.text),
                                double.parse(
                                    _model.textFieldtaxPerTextController.text),
                                double.parse(
                                    _model.textFieldTaxAmtTextController.text),
                              );
                              safeSetState(() {
                                _model.textFieldTaxAmtTextController?.text =
                                    getJsonField(
                                  _model.taxperchenged!
                                      .where((e) =>
                                          getJsonField(
                                            widget!.jsonitem,
                                            r'''$.id''',
                                          ) ==
                                          getJsonField(
                                            e,
                                            r'''$.id''',
                                          ))
                                      .toList()
                                      .firstOrNull,
                                  r'''$.taxAmt''',
                                ).toString();
                              });
                              _model.output2 =
                                  await actions.calSubTotalForGrocery(
                                FFAppState().selBill.toString(),
                                FFAppState().allBillsList.toList(),
                              );
                              _model.reuslt12m =
                                  await actions.calBillAmtGrocery(
                                valueOrDefault<double>(
                                  FFAppState().disAmt,
                                  0.0,
                                ),
                                FFAppState().delCharges,
                              );

                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F6FB),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                            textAlign: TextAlign.center,
                            validator: _model
                                .textFieldtaxPerTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textFieldTaxAmtTextController,
                            focusNode: _model.textFieldTaxAmtFocusNode,
                            onFieldSubmitted: (_) async {
                              _model.taxamtchanged =
                                  await actions.taxAmtChangedFunctiongrocery(
                                widget!.parameter2!,
                                FFAppState().selBill,
                                widget!.parameter3!.toList(),
                                functions
                                    .enabletaxinclusive(widget!.parameter4!),
                                widget!.unitList!.toList(),
                                double.parse(
                                    _model.textFielddisPerTextController.text),
                                double.parse(
                                    _model.textFielddisAmtTextController.text),
                                double.parse(
                                    _model.textFieldrateTextController.text),
                                double.parse(
                                    _model.textFieldqtTextController.text),
                                double.parse(
                                    _model.textFieldtaxPerTextController.text),
                                double.parse(
                                    _model.textFieldTaxAmtTextController.text),
                              );
                              safeSetState(() {
                                _model.textFieldtaxPerTextController?.text =
                                    getJsonField(
                                  _model.taxamtchanged!
                                      .where((e) =>
                                          getJsonField(
                                            widget!.jsonitem,
                                            r'''$.id''',
                                          ) ==
                                          getJsonField(
                                            e,
                                            r'''$.id''',
                                          ))
                                      .toList()
                                      .firstOrNull,
                                  r'''$.taxPer''',
                                ).toString();
                              });
                              _model.output3 =
                                  await actions.calSubTotalForGrocery(
                                FFAppState().selBill.toString(),
                                FFAppState().allBillsList.toList(),
                              );
                              _model.reuslt12g =
                                  await actions.calBillAmtGrocery(
                                valueOrDefault<double>(
                                  FFAppState().disAmt,
                                  0.0,
                                ),
                                FFAppState().delCharges,
                              );

                              safeSetState(() {});
                            },
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelMediumFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor2,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF5F6FB),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                            textAlign: TextAlign.center,
                            validator: _model
                                .textFieldTaxAmtTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            getJsonField(
                              widget!.jsonitem,
                              r'''$.total''',
                            ).toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelSmallFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelSmallFamily),
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 20.0,
                            thickness: 0.5,
                            color: FlutterFlowTheme.of(context).accent2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (!FFAppState().groceryshow)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              FFAppState().groceryshow = true;
              safeSetState(() {});
              safeSetState(() {
                _model.textFieldqtTextController?.text = valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.quantity''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldrateTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.price''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFielddisAmtTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.disAmt''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldTaxAmtTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.taxAmt''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFielddisPerTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.disPer''',
                  )?.toString(),
                  '0',
                );
              });
              safeSetState(() {
                _model.textFieldtaxPerTextController?.text =
                    valueOrDefault<String>(
                  getJsonField(
                    widget!.jsonitem,
                    r'''$.taxPer''',
                  )?.toString(),
                  '0',
                );
              });
            },
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 3.0, 0.0, 3.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.srno''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SelectionArea(
                                child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.barcode''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            )),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 14,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.name''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    color: Color(0xFF446AFE),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                getJsonField(
                                  widget!.jsonitem,
                                  r'''$.quantity''',
                                )?.toString(),
                                '0',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.unit''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.price''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.mrpPrice''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.mfgDate''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.expDate''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.taxPer''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.taxAmt''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              getJsonField(
                                widget!.jsonitem,
                                r'''$.total''',
                              ).toString(),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelSmallFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelSmallFamily),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 100.0,
                            child: VerticalDivider(
                              width: 20.0,
                              thickness: 0.5,
                              color: FlutterFlowTheme.of(context).accent2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
