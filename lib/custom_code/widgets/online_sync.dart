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

import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;

import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

import 'dart:isolate';
import 'package:connectivity_plus/connectivity_plus.dart';

class OnlineSync extends StatefulWidget {
  const OnlineSync({
    Key? key,
    this.width,
    this.height,
    required this.outletRef,
    required this.userDoc,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DocumentReference outletRef;
  final DocumentReference userDoc;

  @override
  _OnlineSyncState createState() => _OnlineSyncState();
}

class _OnlineSyncState extends State<OnlineSync> {
  bool isOnline = false;
  late StreamSubscription<ConnectivityResult> _subscription;
  late LoadingScreenNewModel _model;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
    startBackgroundTask();
    _model = createModel(context, () => LoadingScreenNewModel());
  }

  LoadingScreenNewModel createModel(
      BuildContext context, LoadingScreenNewModel Function() modelBuilder) {
    return modelBuilder();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    updateConnectivityState(connectivityResult);
  }

  void startBackgroundTask() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      updateConnectivityState(result);

      if (isOnline) {
        // Run the background task continuously every 5 seconds
        _runBackgroundTask();
      }
    });
  }

  void updateConnectivityState(ConnectivityResult connectivityResult) {
    setState(() {
      isOnline = connectivityResult != ConnectivityResult.none;
    });
    FFAppState().internet = isOnline;
  }

  Future<void> _runBackgroundTask() async {
    // Execute your background task logic here
    _model.hiveInvoiceListCopy = await actions.hiveGetInvoices();
    _model.shiftdetailsHive = await actions.hiveGetShiftDetails();
    setState(() {
      FFAppState().invoiceList =
          _model.hiveInvoiceListCopy!.toList().cast<InvoiceStructStruct>();
      FFAppState().startLoop = 0;
      FFAppState().endLoop = _model.hiveInvoiceListCopy!.length;
    });
    if (FFAppState().invoiceList.length > 0) {
      while (FFAppState().startLoop < FFAppState().endLoop) {
        if ((_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.synC ==
            true) {
          await functions
              .genInvoiceDocRefById(
                  (_model.hiveInvoiceListCopy![FFAppState().startLoop]).id,
                  widget.outletRef!.id)
              .update({
            ...createInvoiceRecordData(
              id: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.id,
              invoice: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.invoice,
              party:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.party,
              products: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.products,
              invoiceDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.invoiceDate,
              paymentMode: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.paymentMode,
              dayId:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.dayId,
              discountAmt: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.discountAmt,
              discountPer: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.discountPer,
              delliveryChrg:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                      ?.delliveryChrg,
              taxAmt:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.taxAmt,
              billAmt: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.billAmt,
              finalBillAmt:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                      ?.finalBillAmt,
              createdBy: widget.userDoc,
              createdDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.createdDate,
              updatedDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.updatedDate,
              roundOff: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.roundOff,
              updatedBy: widget.userDoc,
              code: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.code,
              shiftId: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.shiftId,
              partyMobNo: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.partyMobNo,
            ),
            ...mapToFirestore(
              {
                'productList': getSelItemListListFirestoreData(
                  functions.returnProductlist(
                      _model.hiveInvoiceListCopy![FFAppState().startLoop]),
                ),
              },
            ),
          });
        } else {
          var invoiceRecordReference =
              InvoiceRecord.createDoc(widget.outletRef!);
          await invoiceRecordReference.set({
            ...createInvoiceRecordData(
              id: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.id,
              invoice: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.invoice,
              party:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.party,
              products: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.products,
              invoiceDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.invoiceDate,
              paymentMode: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.paymentMode,
              dayId:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.dayId,
              discountAmt: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.discountAmt,
              discountPer: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.discountPer,
              delliveryChrg:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                      ?.delliveryChrg,
              taxAmt:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.taxAmt,
              billAmt: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.billAmt,
              finalBillAmt:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                      ?.finalBillAmt,
              createdBy: widget.userDoc,
              createdDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.createdDate,
              updatedDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.updatedDate,
              roundOff: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.roundOff,
              updatedBy: widget.userDoc,
              code: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.code,
              shiftId: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.shiftId,
              partyMobNo: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.partyMobNo,
            ),
            ...mapToFirestore(
              {
                'productList': getSelItemListListFirestoreData(
                  functions.returnProductlist(
                      _model.hiveInvoiceListCopy![FFAppState().startLoop]),
                ),
              },
            ),
          });
          _model.invoicedocumentcreated = InvoiceRecord.getDocumentFromData({
            ...createInvoiceRecordData(
              id: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.id,
              invoice: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.invoice,
              party:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.party,
              products: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.products,
              invoiceDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.invoiceDate,
              paymentMode: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.paymentMode,
              dayId:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.dayId,
              discountAmt: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.discountAmt,
              discountPer: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.discountPer,
              delliveryChrg:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                      ?.delliveryChrg,
              taxAmt:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.taxAmt,
              billAmt: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.billAmt,
              finalBillAmt:
                  (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                      ?.finalBillAmt,
              createdBy: widget.userDoc,
              createdDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.createdDate,
              updatedDate: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.updatedDate,
              roundOff: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.roundOff,
              updatedBy: widget.userDoc,
              code: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.code,
              shiftId: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.shiftId,
              partyMobNo: (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                  ?.partyMobNo,
            ),
            ...mapToFirestore(
              {
                'productList': getSelItemListListFirestoreData(
                  functions.returnProductlist(
                      _model.hiveInvoiceListCopy![FFAppState().startLoop]),
                ),
              },
            ),
          }, invoiceRecordReference);
          await actions.updateHiveInvoice(
            _model.invoicedocumentcreated?.reference.id,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.invoice,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.products,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.party,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.invoiceDate,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.dayId,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.paymentMode,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.discountAmt,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.discountPer,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])
                ?.delliveryChrg,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.taxAmt,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.billAmt,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.finalBillAmt,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.createdDate,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.updatedDate,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.roundOff,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.updatedBy,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.code,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.partyMobNo,
            functions
                .returnProductlist(
                    _model.hiveInvoiceListCopy![FFAppState().startLoop])
                .toList(),
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.createdBy,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.shiftId,
            true,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.hivekey,
            (_model.hiveInvoiceListCopy?[FFAppState().startLoop])?.version,
          );
        }

        setState(() {
          FFAppState().startLoop = FFAppState().startLoop + 1;
        });
      }
      setState(() {
        FFAppState().startLoop = 0;
        FFAppState().shiftDetailslisthive =
            _model.shiftdetailsHive!.toList().cast<ShiftDetailsStruct>();
        FFAppState().endLoop = _model.shiftdetailsHive!.length;
      });
      if (_model.shiftdetailsHive!.length > 0) {
        while (FFAppState().startLoop < FFAppState().endLoop) {
          if ((_model.shiftdetailsHive?[FFAppState().startLoop])?.synC ==
              true) {
            await functions
                .genShidtDocRefById(
                    (_model.shiftdetailsHive![FFAppState().startLoop]).id,
                    widget.outletRef!.id)
                .update(createShiftRecordData(
                  billCount: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.billCount,
                  dayId:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.dayId,
                  lastBillNo: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.lastBillNo,
                  lastBillTime:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.lastBillTime,
                  tax: (_model.shiftdetailsHive?[FFAppState().startLoop])?.tax,
                  deliveryCharges:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.deliveryCharges,
                  shiftId: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.shiftId,
                  code:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.code,
                  endTime: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.endTime,
                  advanceAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.advanceAmtTotal,
                  customerReciveAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.customerReciveAmtTotal,
                  discount: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.discount,
                  expensesAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.expensesAmtTotal,
                  openingAmt: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.openingAmt,
                  receiveAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.receiveAmtTotal,
                  refoundAmount:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.refoundAmount,
                  totalSale: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.totalSale,
                  roundOff: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.roundOff,
                  cashInHand: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.cashInHand,
                  cashSale: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.cashSale,
                  startTime: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.startTime,
                  inActive: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.inActive,
                  shiftNo: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.shiftNo,
                  subTotalBill:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.subTotalBill,
                  userId: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.userId,
                  deviceId: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.deviceId,
                  paymentJson:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.paymentJson,
                ));
          } else {
            var shiftRecordReference = ShiftRecord.createDoc(widget.outletRef!);
            await shiftRecordReference.set(createShiftRecordData(
              billCount:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.billCount,
              dayId: (_model.shiftdetailsHive?[FFAppState().startLoop])?.dayId,
              lastBillNo: (_model.shiftdetailsHive?[FFAppState().startLoop])
                  ?.lastBillNo,
              lastBillTime: (_model.shiftdetailsHive?[FFAppState().startLoop])
                  ?.lastBillTime,
              tax: (_model.shiftdetailsHive?[FFAppState().startLoop])?.tax,
              deliveryCharges:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.deliveryCharges,
              shiftId:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.shiftId,
              code: (_model.shiftdetailsHive?[FFAppState().startLoop])?.code,
              endTime:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.endTime,
              advanceAmtTotal:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.advanceAmtTotal,
              customerReciveAmtTotal:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.customerReciveAmtTotal,
              discount:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.discount,
              expensesAmtTotal:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.expensesAmtTotal,
              openingAmt: (_model.shiftdetailsHive?[FFAppState().startLoop])
                  ?.openingAmt,
              receiveAmtTotal:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.receiveAmtTotal,
              refoundAmount: (_model.shiftdetailsHive?[FFAppState().startLoop])
                  ?.refoundAmount,
              totalSale:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.totalSale,
              roundOff:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.roundOff,
              cashInHand: (_model.shiftdetailsHive?[FFAppState().startLoop])
                  ?.cashInHand,
              cashSale:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.cashSale,
              startTime:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.startTime,
              inActive:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.inActive,
              shiftNo:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.shiftNo,
              subTotalBill: (_model.shiftdetailsHive?[FFAppState().startLoop])
                  ?.subTotalBill,
              userId:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.userId,
              deviceId:
                  (_model.shiftdetailsHive?[FFAppState().startLoop])?.deviceId,
              paymentJson: (_model.shiftdetailsHive?[FFAppState().startLoop])
                  ?.paymentJson,
            ));
            _model.createddocShift = ShiftRecord.getDocumentFromData(
                createShiftRecordData(
                  billCount: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.billCount,
                  dayId:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.dayId,
                  lastBillNo: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.lastBillNo,
                  lastBillTime:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.lastBillTime,
                  tax: (_model.shiftdetailsHive?[FFAppState().startLoop])?.tax,
                  deliveryCharges:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.deliveryCharges,
                  shiftId: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.shiftId,
                  code:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.code,
                  endTime: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.endTime,
                  advanceAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.advanceAmtTotal,
                  customerReciveAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.customerReciveAmtTotal,
                  discount: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.discount,
                  expensesAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.expensesAmtTotal,
                  openingAmt: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.openingAmt,
                  receiveAmtTotal:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.receiveAmtTotal,
                  refoundAmount:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.refoundAmount,
                  totalSale: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.totalSale,
                  roundOff: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.roundOff,
                  cashInHand: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.cashInHand,
                  cashSale: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.cashSale,
                  startTime: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.startTime,
                  inActive: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.inActive,
                  shiftNo: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.shiftNo,
                  subTotalBill:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.subTotalBill,
                  userId: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.userId,
                  deviceId: (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.deviceId,
                  paymentJson:
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.paymentJson,
                ),
                shiftRecordReference);
            setState(() {
              FFAppState().updateShiftDetailsStruct(
                (e) => e
                  ..id = _model.createddocShift?.reference.id
                  ..billCount =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.billCount
                  ..dayId =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.dayId
                  ..lastBillNo =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.lastBillNo
                  ..lastBillTime =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.lastBillTime
                  ..tax =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.tax
                  ..deliveryCharges =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.deliveryCharges
                  ..code =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.code
                  ..endTime = (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.endTime
                  ..advanceAmtTotal =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.advanceAmtTotal
                  ..customerReciveAmtTotal =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.customerReciveAmtTotal
                  ..discount =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.discount
                  ..expensesAmtTotal =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.expensesAmtTotal
                  ..openingAmt =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.openingAmt
                  ..receiveAmtTotal =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.receiveAmtTotal
                  ..refoundAmount =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.refoundAmount
                  ..totalSale =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.totalSale
                  ..roundOff =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.roundOff
                  ..cashSale =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.cashSale
                  ..cashInHand =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.cashInHand
                  ..startTime =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.startTime
                  ..inActive =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.inActive
                  ..shiftNo = (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.shiftNo
                  ..subTotalBill =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.subTotalBill
                  ..userId =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])?.userId
                  ..deviceId =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.deviceId
                  ..paymentJson =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.paymentJson
                  ..version = (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.version
                  ..shiftId = (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.shiftId
                  ..synC = true
                  ..newIDShift =
                      (_model.shiftdetailsHive?[FFAppState().startLoop])
                          ?.newIDShift
                  ..hivekey = (_model.shiftdetailsHive?[FFAppState().startLoop])
                      ?.hivekey,
              );
            });
            await actions.hiveShiftCrud(
              (_model.shiftdetailsHive?[FFAppState().startLoop])?.newIDShift,
              FFAppState().shiftDetails,
              'update',
            );
          }

          setState(() {
            FFAppState().startLoop = FFAppState().startLoop + 1;
          });
        }
      }
    }
    // Schedule the next run after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      if (isOnline) {
        _runBackgroundTask();
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isOnline ? Colors.green : Colors.red,
      child: Center(
        child: Text(
          isOnline ? 'ONLINE' : 'OFFLINE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class LoadingScreenNewModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - checkInternetConnection] action in loadingScreenNew widget.
  bool? checkInternetConnection2;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  List<ProductRecord>? productListCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in loadingScreenNew widget.
  List<CategoryRecord>? categoryList;
  // Stores action output result for [Custom Action - hiveGetInvoices] action in loadingScreenNew widget.
  List<InvoiceStructStruct>? hiveInvoiceListCopy;
  // Stores action output result for [Custom Action - hiveGetShiftDetails] action in loadingScreenNew widget.
  List<ShiftDetailsStruct>? shiftdetailsHive;
  // Stores action output result for [Backend Call - Create Document] action in loadingScreenNew widget.
  InvoiceRecord? invoicedocumentcreated;
  // Stores action output result for [Backend Call - Create Document] action in loadingScreenNew widget.
  ShiftRecord? createddocShift;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }
}
