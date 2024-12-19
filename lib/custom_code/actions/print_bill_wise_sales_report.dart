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

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

Future printBillWiseSalesReport(
  List<dynamic> data,
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String printerSize,
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
  if (statusName == "USBStatus.connected") {
    _currentUsbStatus = USBStatus.connected;
  }
  FFAppState().printerName = "";
  List<int> bytes = [];
  String billColumn3;
  dynamic obj, billObj;

  // changes according to size
  if (size == 46) {
    billColumn3 =
        "Bill No             Dis     Amt      TOTAL    "; // 20, 8, 9, 9 (46)

    if (data.length > 0) {
      billObj = data[0];
      obj = data[1];
      String saleOnDate = billObj[0]["dayId"].toString();
      bytes += generator.text("Bill Wise Sales ",
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      String dateString1 = '';

      final DateTime now = DateTime.now();

      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();

      printLine += dateString;

      final DateFormat formatter1 = DateFormat(' hh:mm:ss');
      final String formatted1 = formatter1.format(now);
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

      String title = "Sale on Date";

      printLine += title;
      final DateFormat formatter2 = DateFormat('yyyy-MM-dd');
      final String formatted2 = formatter2.format(now);
      dateString1 = saleOnDate.toString();

      for (int i = 1; i <= (size - (title.length + dateString1.length)); i++) {
        printLine += " ";
      }

      printLine += dateString1;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';

      bytes += generator.text("----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: "Bill No",
          width: 4,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
          ),
        ),
        PosColumn(
          text: "Dis",
          width: 2,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
          ),
        ),
        PosColumn(
          text: "Tax",
          width: 2,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
          ),
        ),
        PosColumn(
          text: "Amt",
          width: 2,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        ),
        PosColumn(
          text: "Total",
          width: 2,
          styles: PosStyles(
            fontType: PosFontType.fontA,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
          ),
        )
      ]);

      bytes += generator.text("----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      for (int i = 0; i < obj.length; i++) {
        bytes += generator.row([
          PosColumn(
            text: obj[i]["billNo"].toString(),
            width: 4,
            styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
              text: obj[i]["discount"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
              )),
          PosColumn(
            text: obj[i]["totalTax"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
            text: obj[i]["billAmt"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          ),
          PosColumn(
            text: obj[i]["finalAmt"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
            ),
          )
        ]);
      }
      bytes += generator.text("----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
//row1
      bytes += generator.row([
        PosColumn(
            text: "Net Amount:",
            width: 6,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.left)),
        PosColumn(
          text: billObj[0]["totalBillAmt"].toString(),
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.text("----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      //row2
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
          text: billObj[0]["finalBillAmt"].toString(),
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
          text: billObj[0]["totalBillAmt"].toString(),
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
          text: "Total Bill :",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: billObj[0]["billCount"].toString(),
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
          text: "Tax Amount(All Exc.):",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: billObj[0]["totalTax"].toString(),
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
          text: billObj[0]["totalDis"].toString(),
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
          text: "Total Delivery Charges:",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: billObj[0]["totalDelChg"].toString(),
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        )
      ]);

      bytes += generator.text("----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.text("** THANK YOU ! HAVE A NICE DAY !! **",
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
    // billColumn3 = "ITEM_NAME    QTY  RATE  TOTAL   "; //(32)
    //

    if (data.length > 0) {
      obj = data[1];
      billObj = data[0];
      String saleOnDate = billObj[0]["dayId"].toString();

      bytes += generator.text("Bill Wise Sales ",
          styles: PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              align: PosAlign.center));

      String printLine = '';
      String dateString = '';
      String dateString1 = '';

      final DateTime now = DateTime.now();

      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();

      printLine += dateString;

      final DateFormat formatter1 = DateFormat(' hh:mm:ss');
      final String formatted1 = formatter1.format(now);
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

      String title = "Sale on Date";

      printLine += title;
      final DateFormat formatter2 = DateFormat('yyyy-MM-dd');
      final String formatted2 = formatter2.format(now);
      dateString1 = saleOnDate.toString();

      for (int i = 1; i <= (size - (title.length + saleOnDate.length)); i++) {
        printLine += " ";
      }

      printLine += saleOnDate;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));
      printLine = '';

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: "Bill No",
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center),
        ),
        /*
        PosColumn(
          text: "Tax",
          width: 2,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        ),
        PosColumn(
          text: "Dis",
          width: 2,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.right),
        ),*/
        PosColumn(
          text: "Amt",
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center),
        ),
        PosColumn(
          text: "Total",
          width: 4,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center),
        )
      ]);

      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      for (int i = 0; i < obj.length; i++) {
        bytes += generator.row([
          PosColumn(
            text: obj[i]["billNo"].toString(),
            width: 4,
            styles: PosStyles(
                fontType: PosFontType.fontA,
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center),
          ),
          /*
          PosColumn(
            text: obj[i]["tax"].toString(),
            width: 2,
            styles: PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              // align: PosAlign.center
            ),
          ),
          PosColumn(
              text: obj[i]["discount"].toString(),
              width: 2,
              styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                  align: PosAlign.right
              )),*/
          PosColumn(
            text: obj[i]["billAmt"].toString(),
            width: 4,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.center),
          ),
          PosColumn(
            text: obj[i]["finalAmt"].toString(),
            width: 4,
            styles: PosStyles(
                height: PosTextSize.size1,
                width: PosTextSize.size1,
                bold: false,
                align: PosAlign.right),
          )
        ]);
      }
      bytes += generator.text("--------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: "Net Amount:",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: billObj[0]["totalSale"].toString(),
          width: 6,
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

      //row2
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
          text: billObj[0]["totalBillAmt"].toString(),
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
          text: "Total Bill :",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: billObj[0]["billCount"].toString(),
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
          text: "Tax Amount(All Exc.):",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: billObj[0]["totalTax"].toString(),
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
          text: billObj[0]["totalDis"].toString(),
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
          text: "Total Delivery Charges:",
          width: 8,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: billObj[0]["totalDelChg"].toString(),
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
