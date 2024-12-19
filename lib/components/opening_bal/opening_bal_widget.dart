import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'opening_bal_model.dart';
export 'opening_bal_model.dart';

class OpeningBalWidget extends StatefulWidget {
  const OpeningBalWidget({
    super.key,
    this.shiftDetails,
    this.doc,
  });

  final dynamic shiftDetails;
  final DocumentReference? doc;

  @override
  State<OpeningBalWidget> createState() => _OpeningBalWidgetState();
}

class _OpeningBalWidgetState extends State<OpeningBalWidget> {
  late OpeningBalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OpeningBalModel());

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
          Container(
            width: 500.0,
            height: 250.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 200.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '3ndgfrm8' /* Enter Opening Balance */,
                                                ),
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
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'afwj36gk' /* Enter Amount..... */,
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .headlineMediumFamily),
                                              ),
                                          keyboardType: TextInputType.number,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 330.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        widget!.shiftDetails,
                                                        r'''$.msg''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 290.0,
                                                height: 30.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qse1o7lv' /* Shift Time In : */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                          widget!.shiftDetails,
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
                                                                          widget!
                                                                              .shiftDetails,
                                                                          r'''$.startTimeFormat''',
                                                                        ) ==
                                                                        '0'
                                                                    ? 0
                                                                    : valueOrDefault<
                                                                        int>(
                                                                        getJsonField(
                                                                          widget!
                                                                              .shiftDetails,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'uuw1285j' /* Cancel */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 90.0,
                                              height: 36.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor2,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              var _shouldSetState = false;
                                              _model.platform = await actions
                                                  .platformValidate();
                                              _shouldSetState = true;
                                              _model.isAppSetExists =
                                                  await actions
                                                      .appSettingExists(
                                                FFAppState().outletId,
                                                _model.platform!,
                                              );
                                              _shouldSetState = true;
                                              if (!_model.isAppSetExists!) {
                                                if (_model.platform !=
                                                    'windows') {
                                                  var appSettingsRecordReference =
                                                      AppSettingsRecord
                                                          .createDoc(FFAppState()
                                                              .outletIdRef!);
                                                  await appSettingsRecordReference
                                                      .set(
                                                          createAppSettingsRecordData(
                                                    saveButton: true,
                                                    billSettlement: true,
                                                    allowSaleWithoutTax: false,
                                                    askCustomerInBillCreation:
                                                        false,
                                                    billFormatSendToEmail:
                                                        false,
                                                    calculateReverseQuantity:
                                                        false,
                                                    captainDetails: false,
                                                    captainRequest: false,
                                                    checkInCheckOut: false,
                                                    couponKotHeader: false,
                                                    couponPrintBill: false,
                                                    couponSaveBill: false,
                                                    deliveryNote: false,
                                                    saveKot: false,
                                                    discountToBill: false,
                                                    doNotShowProductList: false,
                                                    barcodeMenu: false,
                                                    billModificationtoUser:
                                                        false,
                                                    comboPriceUpdate: false,
                                                    customerAdvance: false,
                                                    customerforcefully: false,
                                                    editingSettlement: false,
                                                    floatingKeyboard: false,
                                                    goodsReceivedMenu: false,
                                                    kotPrintAmountColumn: false,
                                                    kotReprint: false,
                                                    loyaltyPoints: false,
                                                    onlineOrderSystem: false,
                                                    openingBalanceAmountSet:
                                                        false,
                                                    openingBalancePopup: false,
                                                    paymentMenu: false,
                                                    salesman: false,
                                                    salesmanForcefully: false,
                                                    salesmanProductWise: false,
                                                    stockOutMenu: false,
                                                    store: false,
                                                    tableForcefully: false,
                                                    threeCharSearch: false,
                                                    wlanCommunication: false,
                                                    estimateMode: false,
                                                    hideKeyboard: false,
                                                    hideProductSearchCode:
                                                        false,
                                                    inclusiveTax: false,
                                                    itemStockRequestSent: false,
                                                    kotRemark: false,
                                                    manualPrice: false,
                                                    openPrice: false,
                                                    pemisesShowCodeWise: false,
                                                    productSuggestionRemove:
                                                        false,
                                                    regionalLanguage: false,
                                                    rfidMasterRead: false,
                                                    rfidMasterWrite: false,
                                                    searchWithOnlyBarcode:
                                                        false,
                                                    sendSMS: false,
                                                    showHoldListButton: false,
                                                    showPrintButtonsAfterPay:
                                                        false,
                                                    showProductImage: false,
                                                    sortHotKeys: false,
                                                    stockGettingMinus: false,
                                                    stockRequestAccept: false,
                                                    tables: false,
                                                    upiButton: false,
                                                    vehicleNumber: false,
                                                    weightMinus: false,
                                                    barcodeOnBill: false,
                                                    billRemark: false,
                                                    cgstSgstOnBill: false,
                                                    columnProductNameAndQtyPrint:
                                                        false,
                                                    dontPrintBillnoInbill:
                                                        false,
                                                    dontPrintRateColumn: false,
                                                    dontPrintSerialNoInbill:
                                                        false,
                                                    dontPrintTaxInvoiceOnBill:
                                                        false,
                                                    doubleprint: false,
                                                    duplicateBill: false,
                                                    billPrintingServicesPointWise:
                                                        false,
                                                    largeBillFont: false,
                                                    numberToWords: false,
                                                    signatureInBill: false,
                                                    fontBoldNetTotal: false,
                                                    gstBreakUpOnBill: false,
                                                    hsnNumber: false,
                                                    paymentModePrint: false,
                                                    printConsolidateTax: false,
                                                    printDiscountOnBill: false,
                                                    printMrpPrice: false,
                                                    printUnitTypeOnBill: false,
                                                    printUserNameInBill: false,
                                                    productNameCut: false,
                                                    productSerialNumber: false,
                                                    regionalBillPrint: false,
                                                    regionalKOTPrint: false,
                                                    saveMRPinBill: false,
                                                    totalQtyInBill: false,
                                                    trimNameForSingleLine:
                                                        false,
                                                    billAmountInWords: false,
                                                    couponKotSummary: false,
                                                    openSoftKeyWord: false,
                                                    rateColumnTax: false,
                                                    showProductImg: false,
                                                    regularScreen: true,
                                                    tableScreen: false,
                                                    fullScreenQr: false,
                                                    fullScreenBill: false,
                                                    productAndList: false,
                                                    deviceId: FFAppState().dId,
                                                  ));
                                                  _model.doc = AppSettingsRecord
                                                      .getDocumentFromData(
                                                          createAppSettingsRecordData(
                                                            saveButton: true,
                                                            billSettlement:
                                                                true,
                                                            allowSaleWithoutTax:
                                                                false,
                                                            askCustomerInBillCreation:
                                                                false,
                                                            billFormatSendToEmail:
                                                                false,
                                                            calculateReverseQuantity:
                                                                false,
                                                            captainDetails:
                                                                false,
                                                            captainRequest:
                                                                false,
                                                            checkInCheckOut:
                                                                false,
                                                            couponKotHeader:
                                                                false,
                                                            couponPrintBill:
                                                                false,
                                                            couponSaveBill:
                                                                false,
                                                            deliveryNote: false,
                                                            saveKot: false,
                                                            discountToBill:
                                                                false,
                                                            doNotShowProductList:
                                                                false,
                                                            barcodeMenu: false,
                                                            billModificationtoUser:
                                                                false,
                                                            comboPriceUpdate:
                                                                false,
                                                            customerAdvance:
                                                                false,
                                                            customerforcefully:
                                                                false,
                                                            editingSettlement:
                                                                false,
                                                            floatingKeyboard:
                                                                false,
                                                            goodsReceivedMenu:
                                                                false,
                                                            kotPrintAmountColumn:
                                                                false,
                                                            kotReprint: false,
                                                            loyaltyPoints:
                                                                false,
                                                            onlineOrderSystem:
                                                                false,
                                                            openingBalanceAmountSet:
                                                                false,
                                                            openingBalancePopup:
                                                                false,
                                                            paymentMenu: false,
                                                            salesman: false,
                                                            salesmanForcefully:
                                                                false,
                                                            salesmanProductWise:
                                                                false,
                                                            stockOutMenu: false,
                                                            store: false,
                                                            tableForcefully:
                                                                false,
                                                            threeCharSearch:
                                                                false,
                                                            wlanCommunication:
                                                                false,
                                                            estimateMode: false,
                                                            hideKeyboard: false,
                                                            hideProductSearchCode:
                                                                false,
                                                            inclusiveTax: false,
                                                            itemStockRequestSent:
                                                                false,
                                                            kotRemark: false,
                                                            manualPrice: false,
                                                            openPrice: false,
                                                            pemisesShowCodeWise:
                                                                false,
                                                            productSuggestionRemove:
                                                                false,
                                                            regionalLanguage:
                                                                false,
                                                            rfidMasterRead:
                                                                false,
                                                            rfidMasterWrite:
                                                                false,
                                                            searchWithOnlyBarcode:
                                                                false,
                                                            sendSMS: false,
                                                            showHoldListButton:
                                                                false,
                                                            showPrintButtonsAfterPay:
                                                                false,
                                                            showProductImage:
                                                                false,
                                                            sortHotKeys: false,
                                                            stockGettingMinus:
                                                                false,
                                                            stockRequestAccept:
                                                                false,
                                                            tables: false,
                                                            upiButton: false,
                                                            vehicleNumber:
                                                                false,
                                                            weightMinus: false,
                                                            barcodeOnBill:
                                                                false,
                                                            billRemark: false,
                                                            cgstSgstOnBill:
                                                                false,
                                                            columnProductNameAndQtyPrint:
                                                                false,
                                                            dontPrintBillnoInbill:
                                                                false,
                                                            dontPrintRateColumn:
                                                                false,
                                                            dontPrintSerialNoInbill:
                                                                false,
                                                            dontPrintTaxInvoiceOnBill:
                                                                false,
                                                            doubleprint: false,
                                                            duplicateBill:
                                                                false,
                                                            billPrintingServicesPointWise:
                                                                false,
                                                            largeBillFont:
                                                                false,
                                                            numberToWords:
                                                                false,
                                                            signatureInBill:
                                                                false,
                                                            fontBoldNetTotal:
                                                                false,
                                                            gstBreakUpOnBill:
                                                                false,
                                                            hsnNumber: false,
                                                            paymentModePrint:
                                                                false,
                                                            printConsolidateTax:
                                                                false,
                                                            printDiscountOnBill:
                                                                false,
                                                            printMrpPrice:
                                                                false,
                                                            printUnitTypeOnBill:
                                                                false,
                                                            printUserNameInBill:
                                                                false,
                                                            productNameCut:
                                                                false,
                                                            productSerialNumber:
                                                                false,
                                                            regionalBillPrint:
                                                                false,
                                                            regionalKOTPrint:
                                                                false,
                                                            saveMRPinBill:
                                                                false,
                                                            totalQtyInBill:
                                                                false,
                                                            trimNameForSingleLine:
                                                                false,
                                                            billAmountInWords:
                                                                false,
                                                            couponKotSummary:
                                                                false,
                                                            openSoftKeyWord:
                                                                false,
                                                            rateColumnTax:
                                                                false,
                                                            showProductImg:
                                                                false,
                                                            regularScreen: true,
                                                            tableScreen: false,
                                                            fullScreenQr: false,
                                                            fullScreenBill:
                                                                false,
                                                            productAndList:
                                                                false,
                                                            deviceId:
                                                                FFAppState()
                                                                    .dId,
                                                          ),
                                                          appSettingsRecordReference);
                                                  _shouldSetState = true;
                                                }
                                              }
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
                                                if (_model.platform ==
                                                    'windows') {
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                var shiftRecordReference =
                                                    ShiftRecord.createDoc(
                                                        FFAppState()
                                                            .outletIdRef!);
                                                await shiftRecordReference
                                                    .set(createShiftRecordData(
                                                  billCount: 0,
                                                  dayId: functions.getDayId(),
                                                  discount: 0.0,
                                                  totalSale: 0.0,
                                                  deliveryCharges: 0.0,
                                                  tax: 0.0,
                                                  shiftId: functions.getShiftId(
                                                      FFAppState().shiftCount),
                                                  endTime: 0,
                                                  lastBillNo: '0',
                                                  lastBillTime: 0,
                                                  openingAmt:
                                                      valueOrDefault<double>(
                                                    double.tryParse(_model
                                                        .textController.text),
                                                    0.0,
                                                  ),
                                                  cashSale: 0.0,
                                                  startTime:
                                                      functions.timestampToMili(
                                                          getCurrentTimestamp),
                                                  paymentJson:
                                                      '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0}',
                                                ));
                                                _model.shiftDoc1 = ShiftRecord
                                                    .getDocumentFromData(
                                                        createShiftRecordData(
                                                          billCount: 0,
                                                          dayId: functions
                                                              .getDayId(),
                                                          discount: 0.0,
                                                          totalSale: 0.0,
                                                          deliveryCharges: 0.0,
                                                          tax: 0.0,
                                                          shiftId: functions
                                                              .getShiftId(
                                                                  FFAppState()
                                                                      .shiftCount),
                                                          endTime: 0,
                                                          lastBillNo: '0',
                                                          lastBillTime: 0,
                                                          openingAmt:
                                                              valueOrDefault<
                                                                  double>(
                                                            double.tryParse(_model
                                                                .textController
                                                                .text),
                                                            0.0,
                                                          ),
                                                          cashSale: 0.0,
                                                          startTime: functions
                                                              .timestampToMili(
                                                                  getCurrentTimestamp),
                                                          paymentJson:
                                                              '{\"cash\":0,\"credit\":0,\"cheque\":0,\"digital\":0,\"card\":0,\"googlepay\":0,\"phonepe\":0,\"paytm\":0,\"other\":0,\"loyaltypoint\":0}',
                                                        ),
                                                        shiftRecordReference);
                                                _shouldSetState = true;

                                                await _model
                                                    .shiftDoc1!.reference
                                                    .update(
                                                        createShiftRecordData(
                                                  id: functions
                                                      .getIdFromShiftRef(_model
                                                          .shiftDoc1!
                                                          .reference),
                                                ));
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
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '0bk0pfix' /* Ok */,
                                            ),
                                            options: FFButtonOptions(
                                              width: 90.0,
                                              height: 36.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                                  BorderRadius.circular(8.0),
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
          ),
        ],
      ),
    );
  }
}
