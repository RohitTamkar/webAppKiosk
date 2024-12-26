import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/transaction_status_failed/transaction_status_failed_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'response_page_model.dart';
export 'response_page_model.dart';

class ResponsePageWidget extends StatefulWidget {
  const ResponsePageWidget({super.key});

  @override
  State<ResponsePageWidget> createState() => _ResponsePageWidgetState();
}

class _ResponsePageWidgetState extends State<ResponsePageWidget>
    with TickerProviderStateMixin {
  late ResponsePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResponsePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.shiftDetailsNewweb = await actions.shiftExists(
        functions.getDayId(),
        '0',
        FFAppState().outletIdRef!.id,
      );
      _model.checkStatus = await CheckStatusCall.call(
        merchantId: 'PGTESTPAYUAT131',
        merchantTransactionId: FFAppState().transactionid,
        outletId: FFAppState().outletIdRef?.id,
        orderId: FFAppState().paytmOrderId,
      );

      if ((_model.checkStatus?.succeeded ?? true)) {
        _model.qrTransaction = await queryQrTransactionsRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (qrTransactionsRecord) => qrTransactionsRecord.where(
            'orderId',
            isEqualTo: FFAppState().paytmOrderId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().shiftDetailsNEw = _model.shiftDetailsNewweb!;
        FFAppState().msg = valueOrDefault<String>(
          getJsonField(
            (_model.checkStatus?.jsonBody ?? ''),
            r'''$[:1].message''',
          )?.toString()?.toString(),
          'null',
        );
        safeSetState(() {});
        FFAppState().shiftDetailsJson = _model.shiftDetailsNewweb!;
        FFAppState().kioskAmt = FFAppState().finalAmt;
        safeSetState(() {});
        FFAppState().shiftexist = 'True';
        safeSetState(() {});
        if (_model.qrTransaction!.status) {
          _model.prdListkiosk = await actions.filterProducts(
            FFAppState().selBill,
            FFAppState().allBillsList.toList(),
          );

          var invoiceRecordReference =
              InvoiceRecord.createDoc(FFAppState().outletIdRef!);
          await invoiceRecordReference.set({
            ...createInvoiceRecordData(
              invoice: FFAppState().paytmOrderId,
              party: FFAppState().setCustName,
              invoiceDate: functions.timestampToMili(getCurrentTimestamp),
              dayId: functions.getDayId(),
              paymentMode: 'UPI QR',
              discountAmt: valueOrDefault<double>(
                FFAppState().disAmt,
                0.0,
              ),
              discountPer: valueOrDefault<double>(
                FFAppState().disPer,
                0.0,
              ),
              delliveryChrg: FFAppState().delCharges * FFAppState().noOfItems,
              taxAmt: valueOrDefault<double>(
                FFAppState().taxamt,
                0.0,
              ),
              billAmt: valueOrDefault<double>(
                FFAppState().billAmt,
                0.0,
              ),
              finalBillAmt: FFAppState().finalAmt,
              roundOff: 0.0,
              shiftId: getJsonField(
                FFAppState().shiftDetailsJson,
                r'''$.shiftId''',
              ).toString().toString(),
              orderType: FFAppState().orderType,
              kotStatus: 'PENDING',
              count: FFAppState().count,
            ),
            ...mapToFirestore(
              {
                'productList': getSelItemListListFirestoreData(
                  _model.prdListkiosk,
                ),
              },
            ),
          });
          _model.docInvoicekiosk = InvoiceRecord.getDocumentFromData({
            ...createInvoiceRecordData(
              invoice: FFAppState().paytmOrderId,
              party: FFAppState().setCustName,
              invoiceDate: functions.timestampToMili(getCurrentTimestamp),
              dayId: functions.getDayId(),
              paymentMode: 'UPI QR',
              discountAmt: valueOrDefault<double>(
                FFAppState().disAmt,
                0.0,
              ),
              discountPer: valueOrDefault<double>(
                FFAppState().disPer,
                0.0,
              ),
              delliveryChrg: FFAppState().delCharges * FFAppState().noOfItems,
              taxAmt: valueOrDefault<double>(
                FFAppState().taxamt,
                0.0,
              ),
              billAmt: valueOrDefault<double>(
                FFAppState().billAmt,
                0.0,
              ),
              finalBillAmt: FFAppState().finalAmt,
              roundOff: 0.0,
              shiftId: getJsonField(
                FFAppState().shiftDetailsJson,
                r'''$.shiftId''',
              ).toString().toString(),
              orderType: FFAppState().orderType,
              kotStatus: 'PENDING',
              count: FFAppState().count,
            ),
            ...mapToFirestore(
              {
                'productList': getSelItemListListFirestoreData(
                  _model.prdListkiosk,
                ),
              },
            ),
          }, invoiceRecordReference);

          await _model.docInvoicekiosk!.reference
              .update(createInvoiceRecordData(
            id: _model.docInvoicekiosk?.reference.id,
          ));
          if (getJsonField(
            _model.shiftDetailsNewweb,
            r'''$.shiftExists''',
          )) {
            FFAppState().billcount = getJsonField(
              _model.shiftDetailsNewweb,
              r'''$.billCount''',
            );
            safeSetState(() {});
            FFAppState().billcount = FFAppState().billcount + 1;
            safeSetState(() {});
            _model.shiftSummarRkiosk = await actions.calShiftSummary(
              _model.docInvoicekiosk!,
              FFAppState().shiftDetailsJson,
            );
            _model.shiftref = await queryShiftRecordOnce(
              parent: FFAppState().outletIdRef,
              queryBuilder: (shiftRecord) => shiftRecord.where(
                'shiftId',
                isEqualTo: getJsonField(
                  _model.shiftDetailsNewweb,
                  r'''$.shiftId''',
                ).toString().toString(),
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);

            await _model.shiftref!.reference.update(createShiftRecordData(
              billCount: FFAppState().billcount,
              totalSale: getJsonField(
                _model.shiftDetailsNewweb,
                r'''$.totalSale''',
              ),
              deliveryCharges: getJsonField(
                _model.shiftDetailsNewweb,
                r'''$.deliveryCharges''',
              ),
              tax: getJsonField(
                _model.shiftDetailsNewweb,
                r'''$.tax''',
              ),
              lastBillNo: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.lastBillNo''',
              ).toString().toString(),
              discount: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.discount''',
              ),
              lastBillTime: functions.timestampToMili(getCurrentTimestamp),
              cashSale: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.cashSale''',
              ),
              paymentJson: getJsonField(
                _model.shiftSummarRkiosk,
                r'''$.paymentJson''',
              ).toString().toString(),
            ));
            FFAppState().lastBill = FFAppState().finalAmt;
            FFAppState().update(() {});
            _model.appsetting = await queryAppSettingsRecordOnce(
              parent: FFAppState().outletIdRef,
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            await Future.delayed(const Duration(milliseconds: 10000));
            _model.outletdoc = await queryOutletRecordOnce(
              queryBuilder: (outletRecord) => outletRecord.where(
                'id',
                isEqualTo: FFAppState().outletIdRef?.id,
              ),
              singleRecord: true,
            ).then((s) => s.firstOrNull);
            await actions.removeFromAllBillList(
              FFAppState().selBill,
            );
            await actions.clearValue();
            FFAppState().subTotal = 0.0;
            FFAppState().update(() {});
            FFAppState().finalAmt = 0.0;
            FFAppState().billAmt = 0.0;
            FFAppState().count = FFAppState().count;
            FFAppState().cartItem = [];
            FFAppState().isBillPrinted = true;
            FFAppState().noOfItems = 0;
            FFAppState().delCharges = 0.0;
            FFAppState().update(() {});
            _model.taxmaster = await queryTaxMasterRecordOnce();
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  content: Text('DONE'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Login again to start Shift ',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: Color(0x00000000),
              ),
            );
            return;
          }
        } else {
          await Future.delayed(const Duration(milliseconds: 2000));
          _model.taxmaster2 = await queryTaxMasterRecordOnce();
          _model.outletdoc2 = await queryOutletRecordOnce(
            queryBuilder: (outletRecord) => outletRecord.where(
              'id',
              isEqualTo: FFAppState().outletIdRef?.id,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.appsetting1 = await queryAppSettingsRecordOnce(
            parent: FFAppState().outletIdRef,
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          _model.rm = await actions.removeFromAllBillList(
            FFAppState().selBill,
          );
          await actions.clearValue();
          FFAppState().subTotal = 0.0;
          FFAppState().update(() {});
          FFAppState().finalAmt = 0.0;
          FFAppState().billAmt = 0.0;
          FFAppState().count = FFAppState().count;
          FFAppState().cartItem = [];
          FFAppState().isBillPrinted = true;
          FFAppState().noOfItems = 0;
          FFAppState().delCharges = 0.0;
          FFAppState().transactionid = '';
          FFAppState().update(() {});
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: Text('Failed'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              );
            },
          );
          return;
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('Failed'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transactionStatusFailedOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
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
        title: 'responsePage',
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
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (_model.qrTransaction?.status ?? true)
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                Color(0x38FFAC47),
                                Color(0xFF673AB7),
                                Colors.blue
                              ],
                              stops: [0.0, 1.0, 1.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'y4rnysxj' /* Thank You ! */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily),
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation1']!),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'e8xv42wg' /* Show Below Token No To Collect... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayLargeFamily,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.italic,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily),
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation2']!),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Text(
                                  'TOKEN NO :${_model.docInvoicekiosk?.count?.toString()}',
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily),
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation3']!),
                              ),
                              Container(
                                width: 500.0,
                                height: 400.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF04A24C),
                                  borderRadius: BorderRadius.circular(0.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'snuv9cux' /* Receipt  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(FlutterFlowTheme
                                                              .of(context)
                                                          .headlineLargeFamily),
                                                ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            _model.qrTransaction?.orderId,
                                            '- -',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineLargeFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22.0),
                                            child: Image.asset(
                                              'assets/images/TwitterVerifiedIconGIF-TwitterVerifiedIcon-DiscoverShareGIFs-ezgif.com-gif-maker.gif',
                                              width: 200.0,
                                              height: 150.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '33p1y43u' /* Payment 
Successful */
                                            ,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .displayMediumFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          ' ₹ ${valueOrDefault<String>(
                                            FFAppState().kioskAmt.toString(),
                                            '0',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineMediumFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            _model.qrTransaction?.msg,
                                            '--',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'fte141e1' /* Redirects Automatically */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily),
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
                    ),
                  if (!_model.qrTransaction!.status)
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.transactionStatusFailedModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TransactionStatusFailedWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'transactionStatusFailedOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
