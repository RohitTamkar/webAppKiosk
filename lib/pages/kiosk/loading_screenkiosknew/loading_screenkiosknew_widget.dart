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
      setDarkModeSetting(context, ThemeMode.light);
      _model.link = await actions.getDomainLink();
      await actions.clearCacheBeforeRun2();
      _model.outletdetails = await queryQrwebconfigRecordOnce(
        queryBuilder: (qrwebconfigRecord) => qrwebconfigRecord.where(
          'domain',
          isEqualTo: _model.link,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.outletgetdirect = await queryOutletRecordOnce(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: _model.outletdetails?.outletId,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().outletIdRef = _model.outletgetdirect?.reference;
      FFAppState().outletName = _model.outletgetdirect!.name;
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
      FFAppState().orderType = 'DINE IN';
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
        FFAppState().shiftDetailsNEw = _model.shiftDetailsNew2!;
        safeSetState(() {});

        context.goNamed(
          'KioskBillScreen',
          queryParameters: {
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
        FFAppState().shiftDetailsNEw = _model.shiftDetailsNewresumed!;
        safeSetState(() {});

        context.goNamed(
          'KioskBillScreen',
          queryParameters: {
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
                StreamBuilder<List<HeaderRecord>>(
                  stream: queryHeaderRecord(
                    parent: FFAppState().outletIdRef,
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
                    List<HeaderRecord> containerHeaderRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerHeaderRecord =
                        containerHeaderRecordList.isNotEmpty
                            ? containerHeaderRecordList.first
                            : null;

                    return Container(
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
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fadeOutDuration:
                                            Duration(milliseconds: 500),
                                        imageUrl: functions.imageurltostring(
                                            containerHeaderRecord
                                                ?.logoImageUrl),
                                        width: 100.0,
                                        height: 160.0,
                                        fit: BoxFit.contain,
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.06,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/colorful_loader.gif',
                                            width: 100.0,
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Sensible_Connect_Logo_1.png',
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ],
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
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
