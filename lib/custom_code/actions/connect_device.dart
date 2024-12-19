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
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

//import 'package:esc_pos_utils/esc_pos_utils.dart';

Future<bool> connectDevice(dynamic printers, String index) async {
  bool _isConnected = false;
  bool flag = false;
  var printerManager = PrinterManager.instance;
  List<dynamic> selectedPrinter = [];
  if (index == "0") {
    selectedPrinter.add(printers);
  } else {
    FFAppState().printerDevice.forEach((element) {
      if (FFAppState().posMode.toUpperCase() == "USB") {
        if (FFAppState().targetPlatform == "windows") {
          selectedPrinter.add(element);
          flag = true;
        } else {
          if (element["vendorId"] == index) {
            selectedPrinter.add(element);
            flag = true;
          }
        }
      } else if (FFAppState().posMode.toUpperCase() == "BLUETOOTH") {
        if (element["address"] == index) {
          selectedPrinter.add(element);
          flag = true;
        }
      }
    });
  }

  //if (selectedPrinter == null) return;
  switch (selectedPrinter[0]!["typePrinter"]) {
    case PrinterType.usb:
      await printerManager.connect(
          type: selectedPrinter[0]!["typePrinter"],
          model: UsbPrinterInput(
              name: selectedPrinter[0]!["deviceName"],
              productId: selectedPrinter[0]!["productId"],
              vendorId: selectedPrinter[0]!["vendorId"]));
      if (Platform.isAndroid) {
        if (printerManager.usbPrinterConnector.status.index == 0) {
          _isConnected = false;

          FFAppState().isPrinterConnected = false;
        } else {
          _isConnected = true;
          FFAppState().printerName = "USBStatus.connected";
          FFAppState().isPrinterConnected = true;
        }
      } else {
        _isConnected = true;
        FFAppState().printerName = "USBStatus.connected";
        FFAppState().isPrinterConnected = true;
      }
      break;
    case PrinterType.bluetooth:
      await printerManager.connect(
          type: selectedPrinter[0]!["typePrinter"],
          model: BluetoothPrinterInput(
            name: selectedPrinter[0]!["deviceName"],
            address: selectedPrinter[0]!["address"]!,
            isBle: selectedPrinter[0]!["isBle"] ?? false,
            //autoConnect: _reconnect
          ));
      FFAppState().printerName = "BTStatus.connected";
      FFAppState().isPrinterConnected = true;
      _isConnected = true;
      break;
    case PrinterType.network:
      await printerManager.connect(
          type: selectedPrinter[0]!.typePrinter,
          model: TcpPrinterInput(ipAddress: selectedPrinter[0]!.address!));
      _isConnected = true;
      break;
    default:
  }
  return _isConnected;
}
