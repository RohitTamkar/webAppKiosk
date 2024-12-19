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

import 'dart:io';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

Future printbillcreditPayment(
  PartyRecord? customer,
  List<dynamic> selectedPrinter,
  bool status,
  String statusName,
  String printerSize,
  String note,
  String paidamt,
) async {
  // Add your function code here!
  {
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

    // changes according to size
    if (size == 46) {
      billColumn3 = "NAME                      NOTE       AMT ";
      bytes += generator.text("Customer Credit Payment",
          styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      String printLine = '';
      /*
      String dateString = '';
      String serialTemp = 'Serial no: ' + FFAppState().count.toString();

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(now);
      dateString = formatted.toString();
    //  printLine = serialTemp;


      printLine += dateString;

      bytes += generator.text(printLine,
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false));*/
      printLine = '';
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('h:mm:ss');
      final String formatted1 = formatter1.format(now1);

      String dateTimeString = formatted1.toString();
      String billNo = 'Payment On Date: ';
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
            //align: PosAlign.center
          ));

      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));

      bytes += generator.row([
        PosColumn(
          text: "Customer name :",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: customer!.name.toString(),
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.right,
          ),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: "Paid :",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: paidamt,
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.right,
          ),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: "Note :",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: note,
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.right,
          ),
        ),
      ]);
      bytes += generator.row([
        PosColumn(
          text: "Balance: ",
          width: 6,
          styles: PosStyles(
              fontType: PosFontType.fontA,
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.left),
        ),
        PosColumn(
          text: customer!.oldBalance.toString(),
          width: 6,
          styles: PosStyles(
            height: PosTextSize.size1,
            width: PosTextSize.size1,
            bold: false,
            align: PosAlign.right,
          ),
        ),
      ]);
      bytes += generator.text("-----------------------------------------------",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
      bytes += generator.text("Thank You ! Have A Nice Day !",
          styles: const PosStyles(
              height: PosTextSize.size1,
              width: PosTextSize.size1,
              bold: false,
              align: PosAlign.center));
    } else if (size == 32) {}

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
        printerManager.send(
            type: bluetoothPrinter["typePrinter"], bytes: bytes);
      }
    }
  }
}
