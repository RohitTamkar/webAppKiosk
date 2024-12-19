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

// Imports other custom actions

// Add your function code here!
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';

//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';

import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

Future<bool> scanPrinter(String type) async {
  var defaultPrinterType;
  if (type.toUpperCase() == "USB") {
    defaultPrinterType = PrinterType.usb;
  } else if (type.toUpperCase() == "BLUETOOTH") {
    defaultPrinterType = PrinterType.bluetooth;
  }

  // var defaultPrinterType=PrinterType.usb;
  var printerManager = PrinterManager.instance;
  var devices = <BluetoothPrinter>[];
  var _isBle = false;
  StreamSubscription<PrinterDevice>? _subscription;
  StreamSubscription<BTStatus>? _subscriptionBtStatus;
  StreamSubscription<USBStatus>? _subscriptionUsbStatus;
  BTStatus _currentStatus = BTStatus.none;
  devices.clear();
  FFAppState().printerDevice = [];
  String _port = '9100';
  String _ipAddress = '';

  //if (Platform.isWindows) defaultPrinterType = PrinterType.usb;

  _subscription = printerManager
      .discovery(type: defaultPrinterType, isBle: _isBle)
      .listen((device) {
    print(device.name);
    devices.add(BluetoothPrinter(
      deviceName: device.name,
      address: device.address != null ? device.address : device.vendorId,
      isBle: _isBle,
      vendorId: device.vendorId,
      productId: device.productId,
      typePrinter: defaultPrinterType,
    ));
    FFAppState().printerDevice.add({
      "deviceName": device.name,
      "address": device.address != null ? device.address : device.vendorId,
      "isBle": _isBle,
      "vendorId": device.vendorId,
      "productId": device.productId,
      "typePrinter": defaultPrinterType
    });

    void setPort(String value) {
      if (value.isEmpty) value = '9100';
      _port = value;
      var device = BluetoothPrinter(
        deviceName: value,
        address: _ipAddress,
        port: _port,
        typePrinter: PrinterType.network,
        state: false,
      );
    }
    /*
    if (device.name == "HC-05") {
      devices.add(BluetoothPrinter(
        deviceName: device.name,
        address: device.address,
        isBle: _isBle,
        vendorId: device.vendorId,
        productId: device.productId,
        typePrinter: defaultPrinterType,
      ));
      FFAppState().printerDevice = [];

      FFAppState().printerDevice.add({
        "deviceName": device.name,
        "address": device.address,
        "isBle": _isBle,
        "vendorId": device.vendorId,
        "productId": device.productId,
        "typePrinter": defaultPrinterType
      });
    }
    if (device.name == "printer-80") {
      devices.add(BluetoothPrinter(
        deviceName: device.name,
        address: device.address,
        isBle: _isBle,
        vendorId: device.vendorId,
        productId: device.productId,
        typePrinter: defaultPrinterType,
      ));

      print(device.name);

      FFAppState().printerDevice = [];

      FFAppState().printerDevice.add({
        "deviceName": device.name,
        "address": device.address,
        "isBle": _isBle,
        "vendorId": device.vendorId,
        "productId": device.productId,
        "typePrinter": defaultPrinterType
      });
    }*/
  });
  if (FFAppState().printerDevice.length == 0) {
    return false;
  } else {
    return true;
  }
}

class BluetoothPrinter {
  int? id;
  String? deviceName;
  String? address;
  String? port;
  String? vendorId;
  String? productId;
  bool? isBle;

  PrinterType typePrinter;
  bool? state;

  BluetoothPrinter(
      {this.deviceName,
      this.address,
      this.port,
      this.state,
      this.vendorId,
      this.productId,
      this.typePrinter = PrinterType.bluetooth,
      this.isBle = false});
}
