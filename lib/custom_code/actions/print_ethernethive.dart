// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';
import "package:firedart/firedart.dart";

Future<void> printEthernethive(
  List<dynamic> data,
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  dynamic outletDetails,
  InvoiceStructStruct invoiceDetails,
  String printerSize,
  String port,
  String? ipaddress,
  List<ServicePointOutletRecord> list,
  AppSettingsRecord appSetting,
) async {
  // Determine the size of the print based on the printer size
  int size = printerSize == "3 inch" ? 46 : 32;

  // Load the printer profile and generator
  final profile = await CapabilityProfile.load();
  final generator = size == 32
      ? Generator(PaperSize.mm58, profile)
      : Generator(PaperSize.mm80, profile);

  List<int>? pendingTask;
  BTStatus _currentStatus = BTStatus.none;
  USBStatus _currentUsbStatus = USBStatus.none;
  if (statusName == "BTStatus.connected") {
    _currentStatus = BTStatus.connected;
  }
  // _currentUsbStatus is only supported on Android
  if (statusName == "USBStatus.connected") {
    _currentUsbStatus = USBStatus.connected;
  }
  // Initialize the printer manager
  var printerManager = PrinterManager.instance;

  // Fetch service point details associated with each product
  Map<String, List<dynamic>> servicePointProducts = {};
  for (var product in invoiceDetails.productList) {
    QuerySnapshot querySnapshot;
    querySnapshot = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(FFAppState().outletIdRef?.id)
        .collection('PRODUCT')
        .where('id', isEqualTo: product.id)
        .get();

    for (var doc in querySnapshot.docs) {
      var serviceOutletRefId = doc["serviceRefId"];
      if (!servicePointProducts.containsKey(serviceOutletRefId)) {
        servicePointProducts[serviceOutletRefId] = [];
      }
      servicePointProducts[serviceOutletRefId]?.add(product);
    }
  }

  // Iterate through service points to print products
  for (var servicePoint in list) {
    if (servicePointProducts.containsKey(servicePoint.id)) {
      List<dynamic> productsToPrint = servicePointProducts[servicePoint.id]!;
      List<int> bytes = [];
      if (size == 46) {
        String billColumn3 = "ITEM NAME                                  QTY";
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));

        bytes += generator.text(FFAppState().PayMode,
            styles: const PosStyles(
                height: PosTextSize.size2,
                width: PosTextSize.size2,
                bold: false,
                align: PosAlign.center));

        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        bytes += generator.text("# NEW KOT #",
            styles: PosStyles(
                height: PosTextSize.size2,
                width: PosTextSize.size2,
                align: PosAlign.center));
        bytes += generator.text(servicePoint.name,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));

        String printLine = '';
        String dateString = '';
        String serialTemp = 'Serial no: ' + FFAppState().count.toString();

        final DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(now);
        dateString = formatted.toString();
        printLine = serialTemp;
        for (int i = 1;
            i <= (size - (serialTemp.length + dateString.length));
            i++) {
          printLine += " ";
        }

        printLine += dateString;

        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));
        printLine = '';
        final DateTime now1 = DateTime.now();
        final DateFormat formatter1 = DateFormat('h:mm:ss');
        final String formatted1 = formatter1.format(now1);

        String dateTimeString = formatted1.toString();
        String billNo = 'Bill No: ' + invoiceDetails.invoice.toString();
        printLine = billNo;
        for (int i = 1;
            i <= (size - (billNo.length + dateTimeString.length));
            i++) {
          printLine += " ";
        }
        printLine += dateTimeString;
        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        bytes += generator.text(billColumn3,
            styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        for (var product in productsToPrint) {
          bytes += generatePrintBytes(generator, product);
        }
      } else {
        String billColumn3 = "ITEM NAME                   QTY";
        bytes += generator.text("# NEW KOT #",
            styles: PosStyles(
                height: PosTextSize.size2,
                width: PosTextSize.size2,
                align: PosAlign.center));
        bytes += generator.text(servicePoint.name,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));

        String printLine = '';
        String dateString = '';
        String serialTemp = 'Serial no: ' + FFAppState().count.toString();

        final DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(now);
        dateString = formatted.toString();
        printLine = serialTemp;
        for (int i = 1;
            i <= (size - (serialTemp.length + dateString.length));
            i++) {
          printLine += " ";
        }

        printLine += dateString;

        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));
        printLine = '';
        final DateTime now1 = DateTime.now();
        final DateFormat formatter1 = DateFormat('h:mm:ss');
        final String formatted1 = formatter1.format(now1);

        String dateTimeString = formatted1.toString();
        String billNo = 'Bill No: ' + invoiceDetails.invoice.toString();
        printLine = billNo;
        for (int i = 1;
            i <= (size - (billNo.length + dateTimeString.length));
            i++) {
          printLine += " ";
        }
        printLine += dateTimeString;
        bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        bytes += generator.text(billColumn3,
            styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        for (var product in productsToPrint) {
          bytes += generatePrintBytes(generator, product);
        }
      }
      if (bytes.isNotEmpty) {
        // Add the bytes for feeding and cutting paper
        bytes += generator.feed(2);
        bytes += generator.cut();

        // Connect to the printer via Ethernet
        await printerManager.connect(
            type: PrinterType.network,
            model: TcpPrinterInput(
                ipAddress: servicePoint.printerIpAddress,
                port: servicePoint.printerPortNumber));

        // Send the bytes to the printer
        printerManager.send(type: PrinterType.network, bytes: bytes);
      }
    }
  }
}

List<int> generatePrintBytes(Generator generator, dynamic product) {
  List<int> bytes = [];

  bytes += generator.row([
    PosColumn(
      text: product.name.toString(),
      width: 6,
      styles: PosStyles(
          fontType: PosFontType.fontA,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
          bold: true,
          align: PosAlign.left),
    ),
    PosColumn(
      text: product.quantity.toString(),
      width: 6,
      styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
          bold: true,
          align: PosAlign.right),
    ),
  ]);

  return bytes;
}
