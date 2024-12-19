import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_screenkiosknew_model.dart';
export 'loading_screenkiosknew_model.dart';

class LoadingScreenkiosknewWidget extends StatefulWidget {
  const LoadingScreenkiosknewWidget({super.key});

  @override
  State<LoadingScreenkiosknewWidget> createState() =>
      _LoadingScreenkiosknewWidgetState();
}

class _LoadingScreenkiosknewWidgetState
    extends State<LoadingScreenkiosknewWidget> {
  late LoadingScreenkiosknewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenkiosknewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.outletgetdirect = await queryOutletRecordOnce(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: 'mMqegB3BKICpheHkQsWQ',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().outletIdRef = _model.outletgetdirect?.reference;
      safeSetState(() {});
      _model.shiftlist = await queryShiftRecordOnce(
        parent: FFAppState().outletIdRef,
      );
      _model.shiftdetailskiosknew = await actions.shiftExists(
        functions.getDayId(),
        '0',
        FFAppState().outletIdRef!.id,
      );
      _model.shiftDetailsNew = await actions.shiftDetailNewpark(
        _model.shiftlist?.toList(),
      );
      _model.taxcollection = await queryTaxMasterRecordOnce();
      FFAppState().shiftexist = getJsonField(
        _model.shiftDetailsNew,
        r'''$.shiftExists''',
      ).toString().toString();
      safeSetState(() {});
      _model.shiftboolean = await actions.shiftkiosknew(
        getJsonField(
          _model.shiftDetailsNew,
          r'''$.shiftExists''',
        ).toString().toString(),
      );
      if (!_model.shiftboolean!) {
        FFAppState().updateShiftDetailsStruct(
          (e) => e
            ..billCount = 0
            ..dayId = functions.getDayId()
            ..lastBillNo = '0'
            ..lastBillTime = 0
            ..tax = 0.0
            ..deliveryCharges = 0.0
            ..code = null
            ..endTime = 0
            ..advanceAmtTotal = 0.0
            ..customerReciveAmtTotal = 0.0
            ..discount = 0.0
            ..expensesAmtTotal = 0.0
            ..openingAmt = 0.0
            ..receiveAmtTotal = 0.0
            ..refoundAmount = 0.0
            ..totalSale = 0.0
            ..roundOff = 0.0
            ..cashInHand = 0.0
            ..cashSale = 0.0
            ..startTime = functions.timestampToMili(getCurrentTimestamp)
            ..inActive = true
            ..shiftNo = 0
            ..subTotalBill = 0.0
            ..userId = '0'
            ..deviceId = FFAppState().deviceqrId
            ..paymentJson =
                '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0}'
            ..shiftId = functions.getShiftId(FFAppState().shiftCount)
            ..synC = false
            ..newIDShift = functions.getShiftIdInt(FFAppState().shiftCount)
            ..version = FFAppState().shiftStructVersion,
        );
        safeSetState(() {});
        FFAppState().shiftCount = getJsonField(
          _model.shiftDetailsNew,
          r'''$.shiftCount''',
        );
        FFAppState().update(() {});

        var shiftRecordReference =
            ShiftRecord.createDoc(FFAppState().outletIdRef!);
        await shiftRecordReference.set(createShiftRecordData(
          billCount: 0,
          dayId: functions.getDayId(),
          discount: 0.0,
          totalSale: 0.0,
          deliveryCharges: 0.0,
          tax: 0.0,
          shiftId: functions.getShiftId(FFAppState().shiftCount),
          endTime: 0,
          lastBillNo: '0',
          lastBillTime: 0,
          openingAmt: 0.0,
          cashSale: 0.0,
          startTime: functions.timestampToMili(getCurrentTimestamp),
          paymentJson:
              '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0,\"upi_qr\":0}',
        ));
        _model.shiftDoc1 = ShiftRecord.getDocumentFromData(
            createShiftRecordData(
              billCount: 0,
              dayId: functions.getDayId(),
              discount: 0.0,
              totalSale: 0.0,
              deliveryCharges: 0.0,
              tax: 0.0,
              shiftId: functions.getShiftId(FFAppState().shiftCount),
              endTime: 0,
              lastBillNo: '0',
              lastBillTime: 0,
              openingAmt: 0.0,
              cashSale: 0.0,
              startTime: functions.timestampToMili(getCurrentTimestamp),
              paymentJson:
                  '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0,\"upi_qr\":0}',
            ),
            shiftRecordReference);

        await _model.shiftDoc1!.reference.update(createShiftRecordData(
          id: _model.shiftDoc1?.reference.id,
        ));
        _model.shiftDetailsNew2 = await actions.shiftExists(
          functions.getDayId(),
          '0',
          FFAppState().outletIdRef!.id,
        );
        _model.appsetting = await queryAppSettingsRecordOnce(
          parent: FFAppState().outletIdRef,
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.invoicecount = await queryInvoiceRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (invoiceRecord) =>
              invoiceRecord.orderBy('invoiceDate', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.appsetting!.settingList
            .where((e) => e.title == 'resetserialNoDaily')
            .toList()
            .firstOrNull!
            .value) {
          FFAppState().count = 100;
          safeSetState(() {});
        } else {
          if (_model.invoicecount?.count != null) {
            FFAppState().count = _model.invoicecount!.count;
            safeSetState(() {});
          } else {
            FFAppState().count = 0;
            safeSetState(() {});
          }
        }

        context.pushNamed(
          'KioskBillScreen',
          queryParameters: {
            'shiftdoc': serializeParam(
              _model.shiftDetailsNew2,
              ParamType.JSON,
            ),
            'appsetting': serializeParam(
              _model.appsetting,
              ParamType.Document,
            ),
            'taxcollection': serializeParam(
              _model.taxcollection,
              ParamType.Document,
              isList: true,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'appsetting': _model.appsetting,
            'taxcollection': _model.taxcollection,
          },
        );

        return;
      } else {
        FFAppState().shiftCount = getJsonField(
          _model.shiftDetailsNew,
          r'''$.shiftCount''',
        );
        FFAppState().update(() {});
        _model.shiftDetailsNewresumed = await actions.shiftExists(
          functions.getDayId(),
          '0',
          FFAppState().outletIdRef!.id,
        );
        _model.appsetting2 = await queryAppSettingsRecordOnce(
          parent: FFAppState().outletIdRef,
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        _model.invoicecountshiftresumed = await queryInvoiceRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (invoiceRecord) =>
              invoiceRecord.orderBy('invoiceDate', descending: true),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.appsetting2!.settingList
            .where((e) => e.title == 'resetserialNoDaily')
            .toList()
            .firstOrNull!
            .value) {
          if ((_model.invoicecountshiftresumed?.count != null) &&
              (_model.invoicecountshiftresumed?.shiftId ==
                  getJsonField(
                    _model.shiftDetailsNewresumed,
                    r'''$.shiftId''',
                  ).toString().toString())) {
            FFAppState().count = _model.invoicecountshiftresumed!.count;
            safeSetState(() {});
          } else {
            FFAppState().count = 100;
            safeSetState(() {});
          }
        } else {
          if ((_model.invoicecountshiftresumed?.count != null) &&
              (_model.invoicecountshiftresumed?.shiftId ==
                  getJsonField(
                    _model.shiftDetailsNewresumed,
                    r'''$.shiftId''',
                  ).toString().toString())) {
            FFAppState().count = _model.invoicecountshiftresumed!.count;
            safeSetState(() {});
          } else {
            FFAppState().count = 0;
            safeSetState(() {});
          }
        }

        context.pushNamed(
          'KioskBillScreen',
          queryParameters: {
            'shiftdoc': serializeParam(
              _model.shiftDetailsNewresumed,
              ParamType.JSON,
            ),
            'appsetting': serializeParam(
              _model.appsetting2,
              ParamType.Document,
            ),
            'taxcollection': serializeParam(
              _model.taxcollection,
              ParamType.Document,
              isList: true,
            ),
          }.withoutNulls,
          extra: <String, dynamic>{
            'appsetting': _model.appsetting2,
            'taxcollection': _model.taxcollection,
          },
        );

        return;
      }
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
        title: 'loadingScreenkiosknew',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Container(
                                  width: 85.0,
                                  height: 85.0,
                                  decoration: BoxDecoration(),
                                  child: Image.asset(
                                    'assets/images/IMG_20220412_140945.png',
                                    width: 100.0,
                                    height: 160.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'qbvs5rrx' /* SENSIBLE */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displaySmallFamily,
                                        fontSize: 36.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'laf4ajsw' /* CONNECT */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 5.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.06,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/10-11-02-622_512.gif',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
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
          ),
        ));
  }
}
