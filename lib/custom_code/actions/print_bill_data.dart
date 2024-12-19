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
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

Future printBillData(List<dynamic> data, List<dynamic> selectedPrinter,
    bool status, String statusName, String printerSize) async {
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
  if (statusName == "USBStatus.connected") {
    _currentUsbStatus = USBStatus.connected;
  }
  FFAppState().printerName = "";
  List<int> bytes = [];
  String billColumn3;
  dynamic obj;
  String saleDate = data[0]["dayId"].toString();

  // changes according to size
  if (size == 46) {
    billColumn3 =
        "ITEM_NAME            QTY    RATE     TOTAL    "; // 20, 8, 9, 9 (46)

    if (data.length > 0) {
      obj = data[0]["allProducts"];

      bytes += generator.text("Product Wise Sale",
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));

      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      String saleOnDate = '';

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
      printLine = dateString;

      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();

      for (int i = 1;
          i <= (size - (dateString.length + dateTimeString.length));
          i++) {
        printLine += " ";
      }

      printLine += dateTimeString;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';

      saleOnDate = 'Sale On Date : ';
      printLine = saleOnDate;
      for (int i = 1;
          i <= (size - (saleOnDate.length + saleDate.length));
          i++) {
        printLine += " ";
      }
      printLine += saleDate;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));

      bytes += generator.text("-----------------------------------------------",
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
              align: PosAlign.center));

      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      for (int i = 0; i < obj.length; i++) {
        bytes += generator.row([
          PosColumn(
            text: obj[i]["name"].toString(),
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left),
          ),
          PosColumn(
            text: obj[i]["quantity"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              // align: PosAlign.center
            ),
          ),
          PosColumn(
            text: obj[i]["price"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              // align: PosAlign.center
            ),
          ),
          PosColumn(
            text: obj[i]["total"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              //align: PosAlign.center
            ),
          )
        ]);
      }

      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: "Net Sale:",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalSale"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);
      bytes += generator.text("---------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: "Total Sale:",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["allProductTotal"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.row([
        PosColumn(
          text: "No of Bills:",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalBill"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.row([
        PosColumn(
          text: "Tax Amount: ",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalTax"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.row([
        PosColumn(
          text: "Total Discount:",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalDis"].toString(),
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);
      bytes += generator.row([
        PosColumn(
          text: "Delivery chargers:",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalDelChg"].toString(),
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);
      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("** THANK YOU **",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
    } else {
      bytes += generator.text('TEST Print',
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
    }
  } else if (size == 32) {
    billColumn3 = "ITEM_NAME     QTY   RATE  TOTAL "; //(32)
    //

    if (data.length > 0) {
      obj = data[0]["allProducts"];

      bytes += generator.text("Product Sale",
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      String saleOnDate = '';

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
      printLine = dateString;

      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();

      for (int i = 1;
          i <= (size - (dateString.length + dateTimeString.length));
          i++) {
        printLine += " ";
      }

      printLine += dateTimeString;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';

      saleOnDate = 'Sale On Date : ';
      printLine = saleOnDate;
      for (int i = 1;
          i <= (size - (saleOnDate.length + saleDate.length));
          i++) {
        printLine += " ";
      }
      printLine += saleDate;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));

      bytes += generator.text("--------------------------------",
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
              align: PosAlign.center));

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      for (int i = 0; i < obj.length; i++) {
        if (obj[i]["name"].toString().length >= 15) {
          bytes += generator.row([
            PosColumn(
              text: obj[i]["name"].toString(),
              width: 10,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.left),
            ),
            PosColumn(
              text: '',
              width: 2,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            ),
          ]);
          bytes += generator.row([
            PosColumn(
              text: '',
              width: 4,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.left),
            ),
            PosColumn(
              text: obj[i]["quantity"].toString(),
              width: 2,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            ),
            PosColumn(
              text: obj[i]["price"].toString(),
              width: 3,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            ),
            PosColumn(
              text: obj[i]["total"].toString(),
              width: 3,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            )
          ]);
        } else {
          bytes += generator.row([
            PosColumn(
              text: obj[i]["name"].toString(),
              width: 4,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.left),
            ),
            PosColumn(
              text: obj[i]["quantity"].toString(),
              width: 2,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            ),
            PosColumn(
              text: obj[i]["price"].toString(),
              width: 3,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            ),
            PosColumn(
              text: obj[i]["total"].toString(),
              width: 3,
              styles: PosStyles(
                  height: PosTextSize.size1,
                  width: PosTextSize.size1,
                  bold: false,
                  align: PosAlign.right),
            )
          ]);
        }
      }

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.row([
        PosColumn(
          text: "Net Sale:",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalSale"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);
      bytes += generator.text("-------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: "Total Sale:",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["allProductTotal"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.row([
        PosColumn(
          text: "No of Bills:",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalBill"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.row([
        PosColumn(
          text: "Tax Amount: ",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalTax"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.row([
        PosColumn(
          text: "Total Discount:",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalDis"].toString(),
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);
      bytes += generator.row([
        PosColumn(
          text: "Delivery chargers:",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: data[0]["otherDetails"]["totalDelChg"].toString(),
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);
      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("** THANK YOU **",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
    } else {
      bytes += generator.text('Test Print',
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));
    }
  }

  if (bytes.length > 0) {
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
      printerManager.send(type: bluetoothPrinter["typePrinter"], bytes: bytes);
    }
  }
}
