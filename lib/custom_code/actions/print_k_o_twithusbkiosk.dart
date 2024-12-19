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

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

Future printKOTwithusbkiosk(
  List<dynamic> data,
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  dynamic outletDetails,
  InvoiceRecord invoiceDetails,
  String printerSize,
  AppSettingsRecord appSetting,
  String port,
  String? ipaddress,
  List<ServicePointOutletRecord> list,
) async {
  // Add your function code here!
  int size = 32;
  if (printerSize == "3 inch") {
    size = 46;
  } else if (printerSize == "2 inch") {
    size = 32;
  }
  final profile = await CapabilityProfile.load();
  final generator = size == 32
      ? Generator(PaperSize.mm58, profile)
      : Generator(PaperSize.mm80, profile);

  var printerManager = PrinterManager.instance;
  List<int>? pendingTask;
  BTStatus _currentStatus = BTStatus.none;
  USBStatus _currentUsbStatus = USBStatus.none;
  if (statusName == "BTStatus.connected") {
    _currentStatus = BTStatus.connected;
  }
  // _currentUsbStatus is only supports on Android
  if (statusName == "connected usb") {
    _currentUsbStatus = USBStatus.connected;
  }
  FFAppState().printerName = "";
  List<int> bytes = [];
  String billColumn3;
  String taxColumn3;
  dynamic obj;

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
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));
        bytes += generator.text(servicePoint.name,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        bytes += generator.text('Token no: ' + FFAppState().count.toString(),
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size2,
                bold: true,
                align: PosAlign.center));
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));

        String printLine = '';
        String dateString = '';
        // String serialTemp = 'Token no: ' + FFAppState().count.toString();

        final DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        final String formatted = formatter.format(now);
        dateString = formatted.toString();

        //  printLine = serialTemp;
        /*  for (int i = 1;
            i <= (size - (serialTemp.length + dateString.length));
            i++) {
          printLine += " ";
        }*/
        /*    for (int i = 1;
        i <= (size - (dateString.length));
        i++) {
          printLine += " ";
          printLine += dateString;
        }*/
        /*bytes += generator.text(printLine,
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false));*/
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
        bytes += generator.text('Date:' + dateString,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.left));
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
        bytes += generator.text(
            "-----------------------------------------------",
            styles: const PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center));
        bytes += generator.text("# KOT IS REQUIRED TO COLLECT TOUR ORDER #",
            styles: PosStyles(
                bold: true,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));
      } else {
        String billColumn3 = "ITEM NAME                   QTY";
        bytes += generator.text("# NEW KOT #",
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));
        bytes += generator.text(servicePoint.name,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                align: PosAlign.center));

        String printLine = '';
        String dateString = '';
        String serialTemp = 'Token no: ' + FFAppState().count.toString();

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
      /* if (bytes.isNotEmpty) {
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
      }*/

      if (bytes.isNotEmpty) {
        //_printEscPos(bytes, generator);

        if (selectedPrinter == null) return;
        var bluetoothPrinter = selectedPrinter[0]!;

        switch (bluetoothPrinter["typePrinter"]) {
          case PrinterType.usb:
            bytes += generator.feed(2);
            bytes += generator.cut();
            FFAppState().printerName = statusName;
            FFAppState().isPrinterConnected = status;
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: UsbPrinterInput(
                    name: bluetoothPrinter["deviceName"],
                    productId: bluetoothPrinter["productId"],
                    vendorId: bluetoothPrinter["vendorId"]));
            pendingTask = null;
            if (Platform.isAndroid) pendingTask = bytes;
            break;
          case PrinterType.bluetooth:
            bytes += generator.cut();
            FFAppState().printerName = statusName;
            FFAppState().isPrinterConnected = status;
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: BluetoothPrinterInput(
                  name: bluetoothPrinter["deviceName"],
                  address: bluetoothPrinter["address"],
                  isBle: bluetoothPrinter["isBle"] ?? false,
                ));
            pendingTask = null;
            if (Platform.isIOS || Platform.isAndroid) pendingTask = bytes;
            break;
          case PrinterType.network:
            bytes += generator.feed(2);
            bytes += generator.cut();
            await printerManager.connect(
                type: bluetoothPrinter["typePrinter"],
                model: TcpPrinterInput(ipAddress: bluetoothPrinter.address!));
            break;
          default:
        }
        if (bluetoothPrinter["typePrinter"] == PrinterType.bluetooth) {
          _currentStatus = BTStatus.connected;

          if (_currentStatus == BTStatus.connected) {
            FFAppState().printerName = "connected bt";
            printerManager.send(
                type: bluetoothPrinter["typePrinter"], bytes: bytes);
            pendingTask = null;
          }
        } else if (bluetoothPrinter["typePrinter"] == PrinterType.usb &&
            Platform.isAndroid) {
          // _currentUsbStatus is only supports on Android
          if (_currentUsbStatus == USBStatus.connected) {
            FFAppState().printerName = "connected usb";
            printerManager.send(
                type: bluetoothPrinter["typePrinter"], bytes: bytes);
            pendingTask = null;
          }
        } else {
          printerManager.send(
              type: bluetoothPrinter["typePrinter"], bytes: bytes);
        }
      }
    }
  }
}

List<int> generatePrintBytes(Generator generator, dynamic product) {
  List<int> bytes = [];
  bytes += generator.row([
    PosColumn(
      text: product.name.toString(),
      width: 10,
      styles: PosStyles(
        fontType: PosFontType.fontA,
        height: PosTextSize.size1,
        width: PosTextSize.size1,
        bold: true,
        align: PosAlign.left,
      ),
    ),
    PosColumn(
      text: product.quantity.toString(),
      width: 2,
      styles: PosStyles(
        height: PosTextSize.size1,
        width: PosTextSize.size1,
        bold: true,
        align: PosAlign.right,
      ),
    ),
  ]);
  // Define the maximum length per line for the product name conservatively
/*  const int maxLineLength =
      15; // Adjust this value based on your printer's actual character width per line

  // Split the product name into multiple lines if necessary
  String productName = product.name.toString();
  List<String> nameLines = [];
  for (int i = 0; i < productName.length; i += maxLineLength) {
    int end = (i + maxLineLength < productName.length)
        ? i + maxLineLength
        : productName.length;
    nameLines.add(productName.substring(i, end));
  }*/

  // Print each line of the product name
  /*for (int i = 0; i < nameLines.length; i++) {
    if (i == 0) {
      // First line: print product name and quantity
      bytes += generator.row([
        PosColumn(
          text: nameLines[i],
          width: 8,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: product.quantity.toString(),
          width: 4,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.right,
          ),
        ),
      ]);
    } else {
      // Subsequent lines: print product name parts only
      bytes += generator.row([
        PosColumn(
          text: nameLines[i],
          width: 8,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.left,
          ),
        ),
        PosColumn(
          text: '',
          width: 4, // Empty column to maintain the total width of 12
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.right,
          ),
        ),
      ]);
    }
  }*/

  return bytes;
}
