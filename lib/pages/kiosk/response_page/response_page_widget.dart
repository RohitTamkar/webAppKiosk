import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/loader_widget.dart';
import '/components/transaction_status_failed/transaction_status_failed_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

class _ResponsePageWidgetState extends State<ResponsePageWidget> {
  late ResponsePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      _model.qrWebOutletdetails = await queryQrwebconfigRecordOnce(
        queryBuilder: (qrwebconfigRecord) => qrwebconfigRecord.where(
          'outletId',
          isEqualTo: FFAppState().outletIdRef?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.checkStatus = await CheckStatusCall.call(
        merchantId: _model.qrWebOutletdetails?.phonePeMid,
        merchantTransactionId: FFAppState().transactionid,
        outletId: FFAppState().outletIdRef?.id,
        orderId: FFAppState().paytmOrderId,
        merchantKey: _model.qrWebOutletdetails?.phonePeMkey,
        isProd: _model.qrWebOutletdetails?.isProdWeb,
        amount: FFAppState().finalAmt,
      );

      await Future.delayed(const Duration(milliseconds: 2000));
      if ((_model.checkStatus?.succeeded ?? true)) {
        _model.qrTransaction2 = await queryQrTransactionsRecordOnce(
          parent: FFAppState().outletIdRef,
          queryBuilder: (qrTransactionsRecord) => qrTransactionsRecord.where(
            'orderId',
            isEqualTo: FFAppState().paytmOrderId,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        FFAppState().shiftDetailsNEw = _model.shiftDetailsNewweb!;
        FFAppState().msg = getJsonField(
          (_model.checkStatus?.jsonBody ?? ''),
          r'''$[0].message''',
        ).toString().toString();
        safeSetState(() {});
        FFAppState().shiftDetailsJson = _model.shiftDetailsNewweb!;
        FFAppState().kioskAmt = FFAppState().finalAmt;
        safeSetState(() {});
        FFAppState().shiftexist = 'True';
        safeSetState(() {});
        if ((FFAppState().paytmOrderId != null &&
                FFAppState().paytmOrderId != '') &&
            _model.qrTransaction2!.status) {
          _model.invoice = await queryInvoiceRecordOnce(
            parent: FFAppState().outletIdRef,
            queryBuilder: (invoiceRecord) => invoiceRecord
                .where(
                  'source',
                  isEqualTo: 'WEB ORDER',
                )
                .orderBy('invoiceDate', descending: true),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          if ((_model.invoice?.count != null) &&
              (_model.invoice?.shiftId ==
                  getJsonField(
                    _model.shiftDetailsNewweb,
                    r'''$.shiftId''',
                  ).toString().toString())) {
            FFAppState().count = _model.invoice!.count;
            safeSetState(() {});
          } else {
            FFAppState().count = 0;
            safeSetState(() {});
          }

          _model.prdListkiosk = await actions.filterProducts(
            FFAppState().selBill,
            FFAppState().allBillsList.toList(),
          );
          FFAppState().count = FFAppState().count + 1;
          safeSetState(() {});

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
              count:
                  functions.stringToint('00${FFAppState().count.toString()}'),
              source: 'WEB ORDER',
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
              count:
                  functions.stringToint('00${FFAppState().count.toString()}'),
              source: 'WEB ORDER',
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
            FFAppState().billcount = _model.shiftref!.billCount;
            safeSetState(() {});
            FFAppState().billcount = FFAppState().billcount + 1;
            safeSetState(() {});
            _model.shiftSummarRkiosk = await actions.calShiftSummary(
              _model.docInvoicekiosk!,
              FFAppState().shiftDetailsJson,
            );

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
            FFAppState().shiftDetailsNEw = _model.shiftSummarRkiosk!;
            FFAppState().paytmOrderId = '';
            FFAppState().orderType = '';
            FFAppState().update(() {});
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
          FFAppState().shiftDetailsNEw = _model.shiftDetailsNewweb!;
          FFAppState().orderType = 'DINE IN';
          FFAppState().update(() {});
          return;
        }
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Payment Failed !'),
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

        context.goNamed('loadingScreenkiosknew');

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

    return StreamBuilder<List<QrTransactionsRecord>>(
      stream: queryQrTransactionsRecord(
        parent: FFAppState().outletIdRef,
        queryBuilder: (qrTransactionsRecord) => qrTransactionsRecord.where(
          'orderId',
          isEqualTo: FFAppState().paytmOrderId,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: LoaderWidget(),
            ),
          );
        }
        List<QrTransactionsRecord> responsePageQrTransactionsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final responsePageQrTransactionsRecord =
            responsePageQrTransactionsRecordList.isNotEmpty
                ? responsePageQrTransactionsRecordList.first
                : null;

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
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (responsePageQrTransactionsRecord?.status ?? true)
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
                                    Color(0x38FFEB47),
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
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context
                                              .goNamed('loadingScreenkiosknew');
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'e8xv42wg' /* Click Here To Order Again....! */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                  if ((FFAppState().count == null) &&
                                      (FFAppState().count == 0))
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        _model.shiftDetailsNewwebCopy =
                                            await actions.shiftExists(
                                          functions.getDayId(),
                                          '0',
                                          FFAppState().outletIdRef!.id,
                                        );
                                        _shouldSetState = true;
                                        _model.qrWebOutletdetails23 =
                                            await queryQrwebconfigRecordOnce(
                                          queryBuilder: (qrwebconfigRecord) =>
                                              qrwebconfigRecord.where(
                                            'outletId',
                                            isEqualTo:
                                                FFAppState().outletIdRef?.id,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        _model.checkStatusCopy =
                                            await CheckStatusCall.call(
                                          merchantId: _model
                                              .qrWebOutletdetails23?.phonePeMid,
                                          merchantTransactionId:
                                              FFAppState().transactionid,
                                          outletId:
                                              FFAppState().outletIdRef?.id,
                                          orderId: FFAppState().paytmOrderId,
                                          merchantKey: _model
                                              .qrWebOutletdetails23
                                              ?.phonePeMkey,
                                          isProd: _model
                                              .qrWebOutletdetails23?.isProdWeb,
                                          amount: FFAppState().finalAmt,
                                        );

                                        _shouldSetState = true;
                                        await Future.delayed(
                                            const Duration(milliseconds: 2000));
                                        if ((_model
                                                .checkStatusCopy?.succeeded ??
                                            true)) {
                                          _model.qrTransaction2Copy =
                                              await queryQrTransactionsRecordOnce(
                                            parent: FFAppState().outletIdRef,
                                            queryBuilder:
                                                (qrTransactionsRecord) =>
                                                    qrTransactionsRecord.where(
                                              'orderId',
                                              isEqualTo:
                                                  FFAppState().paytmOrderId,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          FFAppState().shiftDetailsNEw =
                                              _model.shiftDetailsNewwebCopy!;
                                          FFAppState().msg = getJsonField(
                                            (_model.checkStatusCopy?.jsonBody ??
                                                ''),
                                            r'''$[0].message''',
                                          ).toString();
                                          safeSetState(() {});
                                          FFAppState().shiftDetailsJson =
                                              _model.shiftDetailsNewwebCopy!;
                                          FFAppState().kioskAmt =
                                              FFAppState().finalAmt;
                                          safeSetState(() {});
                                          FFAppState().shiftexist = 'True';
                                          safeSetState(() {});
                                          if ((FFAppState().paytmOrderId !=
                                                      null &&
                                                  FFAppState().paytmOrderId !=
                                                      '') &&
                                              _model.qrTransaction2!.status) {
                                            _model.invoiceCopy =
                                                await queryInvoiceRecordOnce(
                                              parent: FFAppState().outletIdRef,
                                              queryBuilder: (invoiceRecord) =>
                                                  invoiceRecord
                                                      .where(
                                                        'source',
                                                        isEqualTo: 'WEB ORDER',
                                                      )
                                                      .orderBy('invoiceDate',
                                                          descending: true),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            _shouldSetState = true;
                                            if ((_model.invoiceCopy?.count !=
                                                    null) &&
                                                (_model.invoiceCopy?.shiftId ==
                                                    getJsonField(
                                                      _model
                                                          .shiftDetailsNewwebCopy,
                                                      r'''$.shiftId''',
                                                    ).toString())) {
                                              FFAppState().count =
                                                  _model.invoiceCopy!.count;
                                              safeSetState(() {});
                                            } else {
                                              FFAppState().count = 0;
                                              safeSetState(() {});
                                            }

                                            _model.prdListkioskCopy =
                                                await actions.filterProducts(
                                              FFAppState().selBill,
                                              FFAppState()
                                                  .allBillsList
                                                  .toList(),
                                            );
                                            _shouldSetState = true;
                                            FFAppState().count =
                                                FFAppState().count + 1;
                                            safeSetState(() {});

                                            var invoiceRecordReference =
                                                InvoiceRecord.createDoc(
                                                    FFAppState().outletIdRef!);
                                            await invoiceRecordReference.set({
                                              ...createInvoiceRecordData(
                                                invoice:
                                                    FFAppState().paytmOrderId,
                                                party: FFAppState().setCustName,
                                                invoiceDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                dayId: functions.getDayId(),
                                                paymentMode: 'UPI QR',
                                                discountAmt:
                                                    valueOrDefault<double>(
                                                  FFAppState().disAmt,
                                                  0.0,
                                                ),
                                                discountPer:
                                                    valueOrDefault<double>(
                                                  FFAppState().disPer,
                                                  0.0,
                                                ),
                                                delliveryChrg:
                                                    FFAppState().delCharges *
                                                        FFAppState().noOfItems,
                                                taxAmt: valueOrDefault<double>(
                                                  FFAppState().taxamt,
                                                  0.0,
                                                ),
                                                billAmt: valueOrDefault<double>(
                                                  FFAppState().billAmt,
                                                  0.0,
                                                ),
                                                finalBillAmt:
                                                    FFAppState().finalAmt,
                                                roundOff: 0.0,
                                                shiftId: getJsonField(
                                                  FFAppState().shiftDetailsJson,
                                                  r'''$.shiftId''',
                                                ).toString(),
                                                orderType:
                                                    FFAppState().orderType,
                                                kotStatus: 'PENDING',
                                                count: functions.stringToint(
                                                    '00${FFAppState().count.toString()}'),
                                                source: 'WEB ORDER',
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'productList':
                                                      getSelItemListListFirestoreData(
                                                    _model.prdListkioskCopy,
                                                  ),
                                                },
                                              ),
                                            });
                                            _model.docInvoicekioskCopy =
                                                InvoiceRecord
                                                    .getDocumentFromData({
                                              ...createInvoiceRecordData(
                                                invoice:
                                                    FFAppState().paytmOrderId,
                                                party: FFAppState().setCustName,
                                                invoiceDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                dayId: functions.getDayId(),
                                                paymentMode: 'UPI QR',
                                                discountAmt:
                                                    valueOrDefault<double>(
                                                  FFAppState().disAmt,
                                                  0.0,
                                                ),
                                                discountPer:
                                                    valueOrDefault<double>(
                                                  FFAppState().disPer,
                                                  0.0,
                                                ),
                                                delliveryChrg:
                                                    FFAppState().delCharges *
                                                        FFAppState().noOfItems,
                                                taxAmt: valueOrDefault<double>(
                                                  FFAppState().taxamt,
                                                  0.0,
                                                ),
                                                billAmt: valueOrDefault<double>(
                                                  FFAppState().billAmt,
                                                  0.0,
                                                ),
                                                finalBillAmt:
                                                    FFAppState().finalAmt,
                                                roundOff: 0.0,
                                                shiftId: getJsonField(
                                                  FFAppState().shiftDetailsJson,
                                                  r'''$.shiftId''',
                                                ).toString(),
                                                orderType:
                                                    FFAppState().orderType,
                                                kotStatus: 'PENDING',
                                                count: functions.stringToint(
                                                    '00${FFAppState().count.toString()}'),
                                                source: 'WEB ORDER',
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'productList':
                                                      getSelItemListListFirestoreData(
                                                    _model.prdListkioskCopy,
                                                  ),
                                                },
                                              ),
                                            }, invoiceRecordReference);
                                            _shouldSetState = true;

                                            await _model
                                                .docInvoicekioskCopy!.reference
                                                .update(createInvoiceRecordData(
                                              id: _model.docInvoicekioskCopy
                                                  ?.reference.id,
                                            ));
                                            if (getJsonField(
                                              _model.shiftDetailsNewwebCopy,
                                              r'''$.shiftExists''',
                                            )) {
                                              _model.shiftrefCopy =
                                                  await queryShiftRecordOnce(
                                                parent:
                                                    FFAppState().outletIdRef,
                                                queryBuilder: (shiftRecord) =>
                                                    shiftRecord.where(
                                                  'shiftId',
                                                  isEqualTo: getJsonField(
                                                    _model
                                                        .shiftDetailsNewwebCopy,
                                                    r'''$.shiftId''',
                                                  ).toString(),
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              _shouldSetState = true;
                                              FFAppState().billcount =
                                                  getJsonField(
                                                _model.shiftDetailsNewwebCopy,
                                                r'''$.billCount''',
                                              );
                                              safeSetState(() {});
                                              FFAppState().billcount =
                                                  FFAppState().billcount + 1;
                                              safeSetState(() {});
                                              _model.shiftSummarRkioskCopy =
                                                  await actions.calShiftSummary(
                                                _model.docInvoicekioskCopy!,
                                                FFAppState().shiftDetailsJson,
                                              );
                                              _shouldSetState = true;

                                              await _model
                                                  .shiftrefCopy!.reference
                                                  .update(createShiftRecordData(
                                                billCount:
                                                    FFAppState().billcount,
                                                totalSale: getJsonField(
                                                  _model.shiftSummarRkioskCopy,
                                                  r'''$.totalSale''',
                                                ),
                                                deliveryCharges: getJsonField(
                                                  _model.shiftSummarRkioskCopy,
                                                  r'''$.deliveryCharges''',
                                                ),
                                                tax: getJsonField(
                                                  _model.shiftSummarRkioskCopy,
                                                  r'''$.tax''',
                                                ),
                                                lastBillNo: getJsonField(
                                                  _model.shiftSummarRkioskCopy,
                                                  r'''$.lastBillno''',
                                                ).toString(),
                                                discount: getJsonField(
                                                  _model.shiftSummarRkioskCopy,
                                                  r'''$.discount''',
                                                ),
                                                lastBillTime:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                cashSale: getJsonField(
                                                  _model.shiftSummarRkioskCopy,
                                                  r'''$.cashSale''',
                                                ),
                                                paymentJson: getJsonField(
                                                  _model.shiftSummarRkioskCopy,
                                                  r'''$.paymentJson''',
                                                ).toString(),
                                              ));
                                              FFAppState().lastBill =
                                                  FFAppState().finalAmt;
                                              FFAppState().update(() {});
                                              await actions
                                                  .removeFromAllBillList(
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
                                              FFAppState().delCharges = 0.0;
                                              FFAppState().shiftDetailsNEw =
                                                  _model.shiftSummarRkioskCopy!;
                                              FFAppState().paytmOrderId = '';
                                              FFAppState().orderType = '';
                                              FFAppState().update(() {});
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Login again to start Shift ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                ),
                                              );
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          } else {
                                            await Future.delayed(const Duration(
                                                milliseconds: 2000));
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: Text(
                                                      'ORDER ID NOT GENERATE'),
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
                                            _model.rmCopy = await actions
                                                .removeFromAllBillList(
                                              FFAppState().selBill,
                                            );
                                            _shouldSetState = true;
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
                                            FFAppState().delCharges = 0.0;
                                            FFAppState().transactionid = '';
                                            FFAppState().shiftDetailsNEw =
                                                _model.shiftDetailsNewwebCopy!;
                                            FFAppState().orderType = 'DINE IN';
                                            FFAppState().update(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Payment Failed !'),
                                                content: Text('Failed'),
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

                                          context
                                              .goNamed('loadingScreenkiosknew');

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'c1xcvjf5' /* If Token Not Generate Click He... */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
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
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'zilnpb2n' /* Show Below Token No To Collect... */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: Text(
                                            'Date : ${valueOrDefault<String>(
                                              dateTimeFormat(
                                                "yMMMd",
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              '15/1/2025',
                                            )} ${dateTimeFormat(
                                              "h:mm a ",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.italic,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displayLargeFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 50.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        'TOKEN NO :00${FFAppState().count.toString()}',
                                        'NA',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                                    ),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'snuv9cux' /* Receipt  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBtnText,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily),
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              FFAppState().msg,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '33p1y43u' /* Payment 
Successful */
                                                ,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displayMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
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
                                                FFAppState()
                                                    .kioskAmt
                                                    .toString(),
                                                '0',
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 20.0,
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
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model.docInvoicekiosk?.invoice,
                                                '--',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color: FlutterFlowTheme
                                                                .of(context)
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
                                          children: [],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (!responsePageQrTransactionsRecord!.status)
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
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context
                                              .goNamed('loadingScreenkiosknew');
                                        },
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '2w322of1' /* Click Here To Order Again....! */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeFamily),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
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
      },
    );
  }
}
