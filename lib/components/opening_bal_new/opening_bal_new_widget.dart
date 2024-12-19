import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'opening_bal_new_model.dart';
export 'opening_bal_new_model.dart';

class OpeningBalNewWidget extends StatefulWidget {
  const OpeningBalNewWidget({
    super.key,
    this.shiftDetails,
    this.doc,
  });

  final dynamic shiftDetails;
  final DocumentReference? doc;

  @override
  State<OpeningBalNewWidget> createState() => _OpeningBalNewWidgetState();
}

class _OpeningBalNewWidgetState extends State<OpeningBalNewWidget> {
  late OpeningBalNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpeningBalNewModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<List<DeviceRecord>>(
            stream: queryDeviceRecord(
              queryBuilder: (deviceRecord) => deviceRecord.where(
                'deviceId',
                isEqualTo: valueOrDefault<String>(
                          FFAppState().dId,
                          '0',
                        ) !=
                        ''
                    ? valueOrDefault<String>(
                        FFAppState().dId,
                        '0',
                      )
                    : null,
              ),
              singleRecord: true,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitFadingCircle(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                );
              }
              List<DeviceRecord> containerDeviceRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final containerDeviceRecord = containerDeviceRecordList.isNotEmpty
                  ? containerDeviceRecordList.first
                  : null;

              return Container(
                width: 500.0,
                height: 250.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).customColor2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 440.0,
                      height: 210.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (getJsonField(
                                widget!.shiftDetails,
                                r'''$.shiftExists''',
                              ) ==
                              false)
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 5.0, 2.0, 0.0),
                                child: Container(
                                  width: 480.0,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 250.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vey0gwm5' /* Enter Opening Balance */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 160.0,
                                            height: 37.0,
                                            decoration: BoxDecoration(),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'w168dgrv' /* Enter Amount..... */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
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
                                                                    .headlineMediumFamily),
                                                      ),
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 480.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 380.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 330.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.msg''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 290.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '03764vqa' /* Shift Time In : */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                        ),
                                                        if (getJsonField(
                                                              widget!
                                                                  .shiftDetails,
                                                              r'''$.startTimeFormat''',
                                                            ) !=
                                                            '0')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.milisecToTimestamp(
                                                                    getJsonField(
                                                                              widget!.shiftDetails,
                                                                              r'''$.startTimeFormat''',
                                                                            ) ==
                                                                            '0'
                                                                        ? 0
                                                                        : valueOrDefault<
                                                                            int>(
                                                                            getJsonField(
                                                                              widget!.shiftDetails,
                                                                              r'''$.startTimeFormat''',
                                                                            ),
                                                                            0,
                                                                          )),
                                                                '00:00',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Container(
                                        width: 400.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  context.pop();
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'hig23h1e' /* Cancel */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 90.0,
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor2,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
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
                                                                    .titleSmallFamily),
                                                      ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  _model.isAppSetExistsNew =
                                                      await queryAppSettingsRecordOnce(
                                                    parent: FFAppState()
                                                        .outletIdRef,
                                                    queryBuilder:
                                                        (appSettingsRecord) =>
                                                            appSettingsRecord
                                                                .where(
                                                      'deviceId',
                                                      isEqualTo:
                                                          FFAppState().dId,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  _shouldSetState = true;
                                                  _model.taxcollection =
                                                      await queryTaxMasterRecordOnce();
                                                  _shouldSetState = true;
                                                  _model.paymentmode =
                                                      await queryPaymentModeRecordOnce();
                                                  _shouldSetState = true;
                                                  _model.masterAppsetting =
                                                      await queryAppSettingsMasterRecordOnce();
                                                  _shouldSetState = true;
                                                  if (_model
                                                          .isAppSetExistsNew !=
                                                      null) {
                                                    FFAppState().appSettings =
                                                        _model
                                                            .isAppSetExistsNew!
                                                            .settingList
                                                            .toList()
                                                            .cast<
                                                                AppSettingsStruct>();
                                                    safeSetState(() {});
                                                    _model.returnAppsettiing2 =
                                                        await actions
                                                            .returnAppsetting(
                                                      _model.masterAppsetting!
                                                          .toList(),
                                                      FFAppState()
                                                          .appSettings
                                                          .toList(),
                                                    );
                                                    _shouldSetState = true;

                                                    await _model
                                                        .isAppSetExistsNew!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'settingList':
                                                              getAppSettingsListFirestoreData(
                                                            _model
                                                                .returnAppsettiing2,
                                                          ),
                                                        },
                                                      ),
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'App Settings Updated !',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    );
                                                  } else {
                                                    _model.returnAppsettiing =
                                                        await actions
                                                            .returnAppsetting(
                                                      _model.masterAppsetting!
                                                          .toList(),
                                                      FFAppState()
                                                          .appSettings
                                                          .toList(),
                                                    );
                                                    _shouldSetState = true;

                                                    var appSettingsRecordReference =
                                                        AppSettingsRecord
                                                            .createDoc(FFAppState()
                                                                .outletIdRef!);
                                                    await appSettingsRecordReference
                                                        .set({
                                                      ...createAppSettingsRecordData(
                                                        deviceId:
                                                            FFAppState().dId,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'settingList':
                                                              getAppSettingsListFirestoreData(
                                                            _model
                                                                .returnAppsettiing,
                                                          ),
                                                        },
                                                      ),
                                                    });
                                                    _model.doc = AppSettingsRecord
                                                        .getDocumentFromData({
                                                      ...createAppSettingsRecordData(
                                                        deviceId:
                                                            FFAppState().dId,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'settingList':
                                                              getAppSettingsListFirestoreData(
                                                            _model
                                                                .returnAppsettiing,
                                                          ),
                                                        },
                                                      ),
                                                    }, appSettingsRecordReference);
                                                    _shouldSetState = true;
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'App Settings Created !',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    );
                                                  }

                                                  _model.devicew =
                                                      await queryAppSettingsRecordOnce(
                                                    parent: FFAppState()
                                                        .outletIdRef,
                                                    queryBuilder:
                                                        (appSettingsRecord) =>
                                                            appSettingsRecord
                                                                .where(
                                                      'deviceId',
                                                      isEqualTo:
                                                          FFAppState().dId,
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  _shouldSetState = true;
                                                  if (!getJsonField(
                                                    widget!.shiftDetails,
                                                    r'''$.shiftExists''',
                                                  )) {
                                                    FFAppState().shiftCount =
                                                        getJsonField(
                                                      widget!.shiftDetails,
                                                      r'''$.shiftCount''',
                                                    );
                                                    FFAppState().update(() {});

                                                    var shiftRecordReference =
                                                        ShiftRecord.createDoc(
                                                            FFAppState()
                                                                .outletIdRef!);
                                                    await shiftRecordReference
                                                        .set(
                                                            createShiftRecordData(
                                                      billCount: 0,
                                                      dayId:
                                                          functions.getDayId(),
                                                      discount: 0.0,
                                                      totalSale: 0.0,
                                                      deliveryCharges: 0.0,
                                                      tax: 0.0,
                                                      shiftId:
                                                          functions.getShiftId(
                                                              FFAppState()
                                                                  .shiftCount),
                                                      endTime: 0,
                                                      lastBillNo: '0',
                                                      lastBillTime: 0,
                                                      openingAmt:
                                                          double.tryParse(_model
                                                              .textController
                                                              .text),
                                                      cashSale: 0.0,
                                                      startTime: functions
                                                          .timestampToMili(
                                                              getCurrentTimestamp),
                                                      paymentJson:
                                                          '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0,\"upi_qr\":0.0}',
                                                    ));
                                                    _model.shiftDoc1 = ShiftRecord
                                                        .getDocumentFromData(
                                                            createShiftRecordData(
                                                              billCount: 0,
                                                              dayId: functions
                                                                  .getDayId(),
                                                              discount: 0.0,
                                                              totalSale: 0.0,
                                                              deliveryCharges:
                                                                  0.0,
                                                              tax: 0.0,
                                                              shiftId: functions
                                                                  .getShiftId(
                                                                      FFAppState()
                                                                          .shiftCount),
                                                              endTime: 0,
                                                              lastBillNo: '0',
                                                              lastBillTime: 0,
                                                              openingAmt: double
                                                                  .tryParse(_model
                                                                      .textController
                                                                      .text),
                                                              cashSale: 0.0,
                                                              startTime: functions
                                                                  .timestampToMili(
                                                                      getCurrentTimestamp),
                                                              paymentJson:
                                                                  '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0,\"upi_qr\":0.0}',
                                                            ),
                                                            shiftRecordReference);
                                                    _shouldSetState = true;
                                                    FFAppState()
                                                        .updateShiftDetailsStruct(
                                                      (e) => e
                                                        ..billCount = 0
                                                        ..dayId =
                                                            functions.getDayId()
                                                        ..lastBillNo = '0'
                                                        ..lastBillTime = 0
                                                        ..tax = 0.0
                                                        ..deliveryCharges = 0.0
                                                        ..code = null
                                                        ..endTime = 0
                                                        ..advanceAmtTotal = 0.0
                                                        ..customerReciveAmtTotal =
                                                            0.0
                                                        ..discount = 0.0
                                                        ..expensesAmtTotal = 0.0
                                                        ..openingAmt =
                                                            valueOrDefault<
                                                                double>(
                                                          double.tryParse(_model
                                                              .textController
                                                              .text),
                                                          0.0,
                                                        )
                                                        ..receiveAmtTotal = 0.0
                                                        ..refoundAmount = 0.0
                                                        ..totalSale = 0.0
                                                        ..roundOff = 0.0
                                                        ..cashInHand = 0.0
                                                        ..cashSale = 0.0
                                                        ..startTime = functions
                                                            .timestampToMili(
                                                                getCurrentTimestamp)
                                                        ..inActive = true
                                                        ..shiftNo = 0
                                                        ..subTotalBill = 0.0
                                                        ..userId =
                                                            widget!.doc?.id
                                                        ..deviceId =
                                                            containerDeviceRecord
                                                                ?.deviceId
                                                        ..paymentJson =
                                                            '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0}'
                                                        ..shiftId = functions
                                                            .getShiftId(
                                                                FFAppState()
                                                                    .shiftCount)
                                                        ..synC = true
                                                        ..newIDShift = functions
                                                            .getShiftIdInt(
                                                                FFAppState()
                                                                    .shiftCount)
                                                        ..version = FFAppState()
                                                            .shiftStructVersion
                                                        ..id = _model.shiftDoc1
                                                            ?.reference.id,
                                                    );
                                                    safeSetState(() {});

                                                    await _model
                                                        .shiftDoc1!.reference
                                                        .update(
                                                            createShiftRecordData(
                                                      id: _model.shiftDoc1
                                                          ?.reference.id,
                                                    ));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'New Shift Started !',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    _model.createdshiftDetailshive =
                                                        await actions
                                                            .hiveShiftCrud(
                                                      functions.getShiftIdInt(
                                                          FFAppState()
                                                              .shiftCount),
                                                      FFAppState().shiftDetails,
                                                      'create',
                                                    );
                                                    _shouldSetState = true;
                                                    _model.shiftdetailshive =
                                                        await actions
                                                            .hiveGetShiftDetails();
                                                    _shouldSetState = true;
                                                    FFAppState()
                                                            .shiftDetailslisthive =
                                                        _model.shiftdetailshive!
                                                            .toList()
                                                            .cast<
                                                                ShiftDetailsStruct>();
                                                    safeSetState(() {});
                                                    FFAppState().shiftDetails =
                                                        _model
                                                            .createdshiftDetailshive!;
                                                    safeSetState(() {});
                                                    _model.shiftDetailsNew2 =
                                                        await actions
                                                            .shiftDetailNew(
                                                      FFAppState()
                                                          .shiftDetailslisthive
                                                          .toList(),
                                                    );
                                                    _shouldSetState = true;
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  } else {
                                                    FFAppState().shiftCount =
                                                        getJsonField(
                                                      widget!.shiftDetails,
                                                      r'''$.shiftCount''',
                                                    );
                                                    FFAppState().update(() {});
                                                    _model.shiftidhive2 =
                                                        await actions
                                                            .shiftIdtoInt(
                                                      getJsonField(
                                                        widget!.shiftDetails,
                                                        r'''$.shiftId''',
                                                      ).toString(),
                                                    );
                                                    _shouldSetState = true;
                                                    _model.getOfflineShiftdetails =
                                                        await actions
                                                            .hiveShiftCrud(
                                                      _model.shiftidhive2,
                                                      FFAppState().shiftDetails,
                                                      'get',
                                                    );
                                                    _shouldSetState = true;
                                                    if (_model.getOfflineShiftdetails
                                                                ?.shiftId ==
                                                            null ||
                                                        _model.getOfflineShiftdetails
                                                                ?.shiftId ==
                                                            '') {
                                                      FFAppState()
                                                          .updateShiftDetailsStruct(
                                                        (e) => e
                                                          ..billCount =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.billCount''',
                                                          )
                                                          ..dayId =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.dayId''',
                                                          ).toString()
                                                          ..lastBillNo =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.lastBillNo''',
                                                          ).toString()
                                                          ..lastBillTime =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.lastBillTime''',
                                                          )
                                                          ..tax = getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.tax''',
                                                          )
                                                          ..deliveryCharges =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.deliveryCharges''',
                                                          )
                                                          ..code = null
                                                          ..endTime =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.endTime''',
                                                          )
                                                          ..advanceAmtTotal =
                                                              0.0
                                                          ..customerReciveAmtTotal =
                                                              0.0
                                                          ..discount =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.discount''',
                                                          )
                                                          ..expensesAmtTotal =
                                                              0.0
                                                          ..openingAmt =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.openingAmt''',
                                                          )
                                                          ..receiveAmtTotal =
                                                              0.0
                                                          ..refoundAmount = 0.0
                                                          ..totalSale = 0.0
                                                          ..roundOff = 0.0
                                                          ..cashInHand = 0.0
                                                          ..cashSale =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.cashSale''',
                                                          )
                                                          ..startTime =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.startTime''',
                                                          )
                                                          ..inActive = true
                                                          ..shiftNo =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.shiftCount''',
                                                          )
                                                          ..subTotalBill = 0.0
                                                          ..userId =
                                                              widget!.doc?.id
                                                          ..deviceId =
                                                              containerDeviceRecord
                                                                  ?.deviceId
                                                          ..paymentJson =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.paymentJson''',
                                                          ).toString()
                                                          ..shiftId =
                                                              getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.shiftId''',
                                                          ).toString()
                                                          ..synC = true
                                                          ..newIDShift = _model
                                                              .shiftidhive2
                                                          ..version = FFAppState()
                                                              .shiftStructVersion
                                                          ..id = getJsonField(
                                                            widget!
                                                                .shiftDetails,
                                                            r'''$.ref''',
                                                          ).toString(),
                                                      );
                                                      safeSetState(() {});
                                                      _model.createdshiftDetailshivenew =
                                                          await actions
                                                              .hiveShiftCrud(
                                                        functions.getShiftIdInt(
                                                            FFAppState()
                                                                .shiftCount),
                                                        FFAppState()
                                                            .shiftDetails,
                                                        'create',
                                                      );
                                                      _shouldSetState = true;
                                                      _model.getOfflineShiftdetailsagain =
                                                          await actions
                                                              .hiveShiftCrud(
                                                        _model.shiftidhive2,
                                                        FFAppState()
                                                            .shiftDetails,
                                                        'get',
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState()
                                                              .shiftDetails =
                                                          _model
                                                              .getOfflineShiftdetailsagain!;
                                                      FFAppState().count = _model
                                                          .getOfflineShiftdetailsagain!
                                                          .billCount;
                                                      safeSetState(() {});
                                                    } else {
                                                      FFAppState()
                                                              .shiftDetails =
                                                          _model
                                                              .getOfflineShiftdetails!;
                                                      FFAppState().count = _model
                                                          .getOfflineShiftdetails!
                                                          .billCount;
                                                      safeSetState(() {});
                                                    }

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Shift Resumed !',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                    if (!_model
                                                        .devicew!.settingList
                                                        .where((e) =>
                                                            e.title ==
                                                            'enableweightScale')
                                                        .toList()
                                                        .firstOrNull!
                                                        .value) {
                                                      if (FFAppState()
                                                              .navigate ==
                                                          'GROCERY') {}
                                                    }
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'dw10x265' /* Ok */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 90.0,
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmallFamily),
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
