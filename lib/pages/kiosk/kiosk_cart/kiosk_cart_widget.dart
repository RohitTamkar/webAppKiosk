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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_cart_model.dart';
export 'kiosk_cart_model.dart';

class KioskCartWidget extends StatefulWidget {
  const KioskCartWidget({
    super.key,
    this.doc,
    this.shiftdetails,
    this.appsetting,
    this.taxcollection,
  });

  final DocumentReference? doc;
  final dynamic shiftdetails;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<KioskCartWidget> createState() => _KioskCartWidgetState();
}

class _KioskCartWidgetState extends State<KioskCartWidget> {
  late KioskCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskCartModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.btnPressed = false;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'KioskCart',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: AlignmentDirectional(0.0, -1.0),
                    image: Image.asset(
                      'assets/images/Top_img_4.png',
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.16,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 20.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: wrapWithModel(
                                  model: _model.kioskHeaderModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: KioskHeaderWidget(),
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 5.0,
                                        borderWidth: 0.5,
                                        buttonSize: 35.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.keyboard_backspace_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 15.0,
                                        ),
                                        onPressed: () async {
                                          context.goNamed(
                                            'KioskBillScreen',
                                            queryParameters: {
                                              'doc': serializeParam(
                                                widget!.doc,
                                                ParamType.DocumentReference,
                                              ),
                                              'shiftdoc': serializeParam(
                                                widget!.shiftdetails,
                                                ParamType.JSON,
                                              ),
                                              'appsetting': serializeParam(
                                                widget!.appsetting,
                                                ParamType.Document,
                                              ),
                                              'taxcollection': serializeParam(
                                                widget!.taxcollection,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'appsetting': widget!.appsetting,
                                              'taxcollection':
                                                  widget!.taxcollection,
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '770ul0ha' /* Confirm Your Order */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily),
                                          ),
                                    ),
                                    Flexible(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Container(
                                              height: 35.0,
                                              decoration: BoxDecoration(),
                                              child: FlutterFlowChoiceChips(
                                                options: [
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'm630vqg2' /* DINE IN */,
                                                  )),
                                                  ChipData(FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '9hqpozct' /* PARCEL */,
                                                  ))
                                                ],
                                                onChanged: (val) async {
                                                  safeSetState(() =>
                                                      _model.choiceChipsValue =
                                                          val?.firstOrNull);
                                                  FFAppState().orderType =
                                                      _model.choiceChipsValue!;
                                                  safeSetState(() {});
                                                },
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumFamily),
                                                          ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  iconSize: 10.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      Color(0xFFD7D4E8),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 12.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                chipSpacing: 10.0,
                                                rowSpacing: 8.0,
                                                multiselect: false,
                                                initialized:
                                                    _model.choiceChipsValue !=
                                                        null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .choiceChipsValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  [FFAppState().orderType],
                                                ),
                                                wrapped: false,
                                              ),
                                            ),
                                          ),
                                        ],
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
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Builder(
                                  builder: (context) {
                                    final listview = functions
                                        .filterBillList(FFAppState().selBill,
                                            FFAppState().allBillsList.toList())
                                        .toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listview.length,
                                      itemBuilder: (context, listviewIndex) {
                                        final listviewItem =
                                            listview[listviewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Container(
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F5FA),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 2.0,
                                                  color: Color(0x1A000000),
                                                  offset: Offset(
                                                    1.0,
                                                    3.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      7.0, 10.0, 7.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          getJsonField(
                                                            listviewItem,
                                                            r'''$.imageUrl''',
                                                          )?.toString(),
                                                          'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
                                                        ),
                                                        width: 75.0,
                                                        height: 75.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .returnTitlecase(
                                                                      getJsonField(
                                                                listviewItem,
                                                                r'''$.name''',
                                                              ).toString()),
                                                              'MAGIC ICE CREAM FACTORY',
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'vi0q6yhk' /* ₹   */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    getJsonField(
                                                                      listviewItem,
                                                                      r'''$.price''',
                                                                    )?.toString(),
                                                                    '1000',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .parkingPrimary,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100.0,
                                                          height: 35.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      12.0,
                                                                  buttonSize: double
                                                                      .infinity,
                                                                  fillColor: Color(
                                                                      0xFFA7D348),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    _model.res2cart =
                                                                        await actions
                                                                            .reduceQuantityHoldListkiosk(
                                                                      listviewItem,
                                                                      FFAppState()
                                                                          .selBill,
                                                                      widget!
                                                                          .taxcollection!
                                                                          .toList(),
                                                                      functions.enabletaxinclusive(
                                                                          valueOrDefault<
                                                                              bool>(
                                                                        widget!
                                                                            .appsetting
                                                                            ?.settingList
                                                                            ?.where((e) =>
                                                                                e.title ==
                                                                                'enableInclusiveTax')
                                                                            .toList()
                                                                            ?.firstOrNull
                                                                            ?.value,
                                                                        false,
                                                                      )),
                                                                    );
                                                                    _model.res2345 =
                                                                        await actions
                                                                            .calSubTotalForHoldListkiosk(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .selBill
                                                                            .toString(),
                                                                        '1',
                                                                      ),
                                                                      FFAppState()
                                                                          .allBillsList
                                                                          .toList(),
                                                                      functions.enabletaxinclusive(
                                                                          valueOrDefault<
                                                                              bool>(
                                                                        widget!
                                                                            .appsetting
                                                                            ?.settingList
                                                                            ?.where((e) =>
                                                                                e.title ==
                                                                                'enableInclusiveTax')
                                                                            .toList()
                                                                            ?.firstOrNull
                                                                            ?.value,
                                                                        false,
                                                                      )),
                                                                    );
                                                                    _model.reu34 =
                                                                        await actions
                                                                            .calBillAmt(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        FFAppState()
                                                                            .disAmt,
                                                                        0.0,
                                                                      ),
                                                                      FFAppState()
                                                                          .delCharges,
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                        listviewItem,
                                                                        r'''$.quantity''',
                                                                      )?.toString(),
                                                                      '0',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                          fontSize:
                                                                              13.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      12.0,
                                                                  buttonSize: double
                                                                      .infinity,
                                                                  fillColor: Color(
                                                                      0xFFA7D348),
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    var _shouldSetState =
                                                                        false;
                                                                    if (getJsonField(
                                                                      listviewItem,
                                                                      r'''$.stockable''',
                                                                    )) {
                                                                      if (!functions.greatethanlesskiosk(
                                                                          functions.jsontoint(getJsonField(
                                                                            listviewItem,
                                                                            r'''$.currentStock''',
                                                                          )),
                                                                          functions.jsontoint(getJsonField(
                                                                            listviewItem,
                                                                            r'''$.quantity''',
                                                                          )))) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              content: Text('Item Out Of Stock.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      }
                                                                    }
                                                                    _model.resultkioskcart =
                                                                        await actions
                                                                            .plusQuantityHoldListkiosk(
                                                                      getJsonField(
                                                                        listviewItem,
                                                                        r'''$''',
                                                                      ),
                                                                      FFAppState()
                                                                          .selBill,
                                                                      widget!
                                                                          .taxcollection!
                                                                          .toList(),
                                                                      functions.enabletaxinclusive(
                                                                          valueOrDefault<
                                                                              bool>(
                                                                        widget!
                                                                            .appsetting
                                                                            ?.settingList
                                                                            ?.where((e) =>
                                                                                e.title ==
                                                                                'enableInclusiveTax')
                                                                            .toList()
                                                                            ?.firstOrNull
                                                                            ?.value,
                                                                        false,
                                                                      )),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    _model.res23456 =
                                                                        await actions
                                                                            .calSubTotalForHoldListkiosk(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .selBill
                                                                            .toString(),
                                                                        '1',
                                                                      ),
                                                                      FFAppState()
                                                                          .allBillsList
                                                                          .toList(),
                                                                      functions.enabletaxinclusive(
                                                                          valueOrDefault<
                                                                              bool>(
                                                                        widget!
                                                                            .appsetting
                                                                            ?.settingList
                                                                            ?.where((e) =>
                                                                                e.title ==
                                                                                'enableInclusiveTax')
                                                                            .toList()
                                                                            ?.firstOrNull
                                                                            ?.value,
                                                                        false,
                                                                      )),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    _model.reuslt12 =
                                                                        await actions
                                                                            .calBillAmt(
                                                                      valueOrDefault<
                                                                          double>(
                                                                        FFAppState()
                                                                            .disAmt,
                                                                        0.0,
                                                                      ),
                                                                      FFAppState()
                                                                          .delCharges,
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    3.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'tz46iv7q' /* Sub Total */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                color: Color(
                                                                    0xFF00A03F),
                                                                fontSize: 9.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    10.0),
                                                        child: RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'fk7ffxym' /* ₹  */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      color: Color(
                                                                          0xFF00A03F),
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                              TextSpan(
                                                                text: functions
                                                                    .getTotal(
                                                                        getJsonField(
                                                                          listviewItem,
                                                                          r'''$.quantity''',
                                                                        ),
                                                                        getJsonField(
                                                                          listviewItem,
                                                                          r'''$.price''',
                                                                        ))
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily,
                                                                      color: Color(
                                                                          0xFF00A03F),
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                    ),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: Color(
                                                                      0xFF0046D3),
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 7.0,
                                                        borderWidth: 0.5,
                                                        buttonSize: 35.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons.delete_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 18.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.res20Copy =
                                                              await actions
                                                                  .removeHoldListItem(
                                                            listviewItem,
                                                            FFAppState()
                                                                .selBill,
                                                          );
                                                          _model.res21Copy =
                                                              await actions
                                                                  .calSubTotalForHoldList(
                                                            FFAppState()
                                                                .selBill
                                                                .toString(),
                                                            FFAppState()
                                                                .allBillsList
                                                                .toList(),
                                                          );
                                                          _model.reuslt22Copy =
                                                              await actions
                                                                  .calBillAmt(
                                                            valueOrDefault<
                                                                double>(
                                                              FFAppState()
                                                                  .disAmt,
                                                              0.0,
                                                            ),
                                                            valueOrDefault<
                                                                double>(
                                                              FFAppState()
                                                                  .delCharges,
                                                              0.0,
                                                            ),
                                                          );
                                                          FFAppState().removeFromCartItem(functions
                                                              .returnidRef(
                                                                  getJsonField(
                                                                    listviewItem,
                                                                    r'''$.id''',
                                                                  ).toString(),
                                                                  FFAppState()
                                                                      .outletIdRef!
                                                                      .id)!);
                                                          safeSetState(() {});

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: double.infinity,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD1DFFF),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Are You Sure You Want To Cancel This Order ?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await actions.removeFromAllBillList(
                                            FFAppState().selBill,
                                          );
                                          await actions.clearValue();
                                          FFAppState().subTotal = 0.0;
                                          FFAppState().update(() {});
                                          FFAppState().finalAmt = 0.0;
                                          FFAppState().billAmt = 0.0;
                                          FFAppState().count =
                                              FFAppState().count;
                                          FFAppState().cartItem = [];
                                          FFAppState().isBillPrinted = true;
                                          FFAppState().noOfItems = 0;
                                          FFAppState().update(() {});

                                          context.pushNamed(
                                            'KioskBillScreen',
                                            queryParameters: {
                                              'doc': serializeParam(
                                                widget!.doc,
                                                ParamType.DocumentReference,
                                              ),
                                              'shiftdoc': serializeParam(
                                                widget!.shiftdetails,
                                                ParamType.JSON,
                                              ),
                                              'appsetting': serializeParam(
                                                widget!.appsetting,
                                                ParamType.Document,
                                              ),
                                              'taxcollection': serializeParam(
                                                widget!.taxcollection,
                                                ParamType.Document,
                                                isList: true,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'appsetting': widget!.appsetting,
                                              'taxcollection':
                                                  widget!.taxcollection,
                                            },
                                          );
                                        }
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        's9g1enft' /*  */,
                                      ),
                                      icon: Icon(
                                        Icons.close,
                                        size: 24.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 50.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x00B6001A),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.shopping_cart_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            FFAppState().noOfItems.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '9dk0mden' /* ₹  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          ),
                                          TextSpan(
                                            text: FFAppState()
                                                .finalAmt
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmallFamily),
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    FFButtonWidget(
                                      onPressed: _model.btnPressed
                                          ? null
                                          : () async {
                                              _model.btnPressed = true;
                                              safeSetState(() {});
                                              _model.outletDOc =
                                                  await queryOutletRecordOnce(
                                                queryBuilder: (outletRecord) =>
                                                    outletRecord.where(
                                                  'id',
                                                  isEqualTo: FFAppState()
                                                      .outletIdRef
                                                      ?.id,
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (functions
                                                  .filterBillList(
                                                      FFAppState().selBill,
                                                      FFAppState()
                                                          .allBillsList
                                                          .toList())
                                                  .isNotEmpty) {
                                                if (_model.outletDOc
                                                            ?.merchantId !=
                                                        null &&
                                                    _model.outletDOc
                                                            ?.merchantId !=
                                                        '') {
                                                  if (getJsonField(
                                                    widget!.shiftdetails,
                                                    r'''$.shiftExists''',
                                                  )) {
                                                    FFAppState().count =
                                                        FFAppState().count + 1;
                                                    safeSetState(() {});
                                                  } else {
                                                    FFAppState().count =
                                                        FFAppState().count + 1;
                                                    safeSetState(() {});
                                                  }

                                                  FFAppState().orderId =
                                                      FFAppState().orderId + 10;
                                                  FFAppState().paytmOrderId =
                                                      valueOrDefault<String>(
                                                    'ORD-${getCurrentTimestamp.millisecondsSinceEpoch.toString()}',
                                                    '0',
                                                  );
                                                  FFAppState().outletId =
                                                      _model.outletDOc!.id;
                                                  FFAppState().transactionid =
                                                      'MT${getCurrentTimestamp.millisecondsSinceEpoch.toString()}';
                                                  safeSetState(() {});
                                                  _model.apiResulttja =
                                                      await PayApiCall.call(
                                                    merchantId:
                                                        'PGTESTPAYUAT131',
                                                    merchantTransactionId:
                                                        FFAppState()
                                                            .transactionid,
                                                    merchantUserId:
                                                        getCurrentTimestamp
                                                            .millisecondsSinceEpoch
                                                            .toString(),
                                                    amount:
                                                        FFAppState().finalAmt *
                                                            100,
                                                    redirectUrl:
                                                        'themagicicecreamfactory.in/responsePage',
                                                    redirectMode: 'POST',
                                                    callbackUrl:
                                                        'themagicicecreamfactory.in',
                                                    mobileNumber: 0,
                                                    type: 'PAY_PAGE',
                                                    outletId: FFAppState()
                                                        .outletIdRef
                                                        ?.id,
                                                    orderId: FFAppState()
                                                        .paytmOrderId,
                                                  );

                                                  if ((_model.apiResulttja
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.checkstatus =
                                                        await CheckStatusCall
                                                            .call(
                                                      merchantId:
                                                          'PGTESTPAYUAT131',
                                                      outletId: FFAppState()
                                                          .outletIdRef
                                                          ?.id,
                                                      orderId: FFAppState()
                                                          .paytmOrderId,
                                                      merchantTransactionId:
                                                          FFAppState()
                                                              .transactionid,
                                                    );

                                                    _model.prdListkiosk =
                                                        await actions
                                                            .filterProducts(
                                                      FFAppState().selBill,
                                                      FFAppState()
                                                          .allBillsList
                                                          .toList(),
                                                    );
                                                    _model.qRtransaction =
                                                        await queryQrTransactionsRecordOnce(
                                                      parent: FFAppState()
                                                          .outletIdRef,
                                                      queryBuilder:
                                                          (qrTransactionsRecord) =>
                                                              qrTransactionsRecord
                                                                  .where(
                                                        'orderId',
                                                        isEqualTo: FFAppState()
                                                            .paytmOrderId,
                                                      ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);

                                                    await _model.qRtransaction!
                                                        .reference
                                                        .update({
                                                      ...createQrTransactionsRecordData(
                                                        shiftId: getJsonField(
                                                          widget!.shiftdetails,
                                                          r'''$.shiftId''',
                                                        ).toString(),
                                                        count:
                                                            FFAppState().count,
                                                        orderType: FFAppState()
                                                            .orderType,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'productList':
                                                              getSelItemListListFirestoreData(
                                                            _model.prdListkiosk,
                                                          ),
                                                        },
                                                      ),
                                                    });
                                                    await actions.launchUrl(
                                                      getJsonField(
                                                        (_model.apiResulttja
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.data.instrumentResponse.redirectInfo.url''',
                                                      ).toString(),
                                                    );
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Failed'),
                                                          content: Text((_model
                                                                      .apiResulttja
                                                                      ?.jsonBody ??
                                                                  '')
                                                              .toString()),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            'Merchant Id  Is Not Available Contact Support!'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Cart Is Empty !'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );

                                                context.goNamed(
                                                  'KioskBillScreen',
                                                  queryParameters: {
                                                    'doc': serializeParam(
                                                      widget!.doc,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'shiftdoc': serializeParam(
                                                      widget!.shiftdetails,
                                                      ParamType.JSON,
                                                    ),
                                                    'appsetting':
                                                        serializeParam(
                                                      widget!.appsetting,
                                                      ParamType.Document,
                                                    ),
                                                    'taxcollection':
                                                        serializeParam(
                                                      widget!.taxcollection,
                                                      ParamType.Document,
                                                      isList: true,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'appsetting':
                                                        widget!.appsetting,
                                                    'taxcollection':
                                                        widget!.taxcollection,
                                                  },
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                      text: FFLocalizations.of(context).getText(
                                        'sq4xgrw1' /* Proceed to Pay */,
                                      ),
                                      icon: Icon(
                                        Icons.chevron_right,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
