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

import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> labelPrint(
  List<PurchaseSaleItemListStruct> prdList,
  String labelSize, // size is 50mm, 25mm
) async {
  // Initialize the printer
  Printer _printer = Printer();
  await _printer.init();

  // Check if the printer is initialized successfully
  if (_printer.device != null) {
    for (var item in prdList) {
      // Prepare data for each item

      Map<String, dynamic> data = {
        'Name': item.name, // assuming these properties exist in your struct
        'Price': item.price.toString(),
        'mrpPrice': item.mrpPrice.toString(),
        'MfgDate': item.mfgDate,
        'ExpDate': item.expDate,
        'barcode': item.barcode,
        'copies': item.quantity.toInt(), // assuming quantity is a number
      };

      // Print the label for the current item
      await _printer.printLabel(data, labelSize);
    }
  } else {
    print("Printer not initialized or no USB devices found.");
  }
}

class Printer {
  static const platform = MethodChannel('com.mycompany.printer/usb');
  late UsbDevice device;

  // Request USB permission
  Future<void> requestUsbPermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        await platform.invokeMethod('requestUsbPermission');
      } on PlatformException catch (e) {
        print("Failed to request USB permission: ${e.message}");
      }
    } else if (status.isDenied) {
      // Explain to the user why the permission is needed and ask again
    } else if (status.isPermanentlyDenied) {
      // Open app settings to allow permission
    }
  }

  // Initialize the printer
  Future<void> init() async {
    try {
      List<dynamic> devices = await platform.invokeMethod('listDevices');
      print(devices);
      if (devices.isNotEmpty) {
        var firstDevice = devices[0];
        device = UsbDevice(firstDevice['vid'], firstDevice['pid']);
        bool permissionGranted = await platform.invokeMethod(
            'hasPermission', {'vendorId': device.vid, 'productId': device.pid});
        if (permissionGranted) {
          await platform.invokeMethod(
              'openDevice', {'vendorId': device.vid, 'productId': device.pid});
        } else {
          print("USB permission not granted.");
        }
      } else {
        print("No USB devices found.");
      }
    } catch (e) {
      print(e);
    }
  }

  // Send a command to the printer
  Future<void> sendCommand(String command) async {
    try {
      await platform.invokeMethod('sendCommand', {'command': command});
    } catch (e) {
      print(e);
    }
  }

  Future<void> printLabel(Map<String, dynamic> data, String labelSize) async {
    if (labelSize == 'SIZE 50mm,25mm') {
      // Set the label size to 50 mm x 25 mm
      await sendCommand('SIZE 50 mm,25 mm\r\n');
      await sendCommand('GAP 2.5 mm,0 mm\r\n');

      // Clear the printer buffer before starting a new label
      await sendCommand('CLS\r\n'); // Only clear once before adding content

      await sendCommand('REFERENCE 0,0\r\n');

      // 1. Print Item name
      await sendCommand('TEXT 20,10,"B.FNT",0,2,2,"${data['Name']}"\r\n');

      // 2. Print MRP and Rate on the same line
      await sendCommand(
          'TEXT 20,40,"3.EFT",0,1,1,"MRP:${data['mrpPrice']}    Rate:${data['Price']}"\r\n');

      // 3. Print Manufacture Date and Expiry Date
      await sendCommand(
          'TEXT 20,70,"3.EFT",0,1,1,"Mfg Date: ${data['MfgDate']}"\r\n');
      await sendCommand(
          'TEXT 20,90,"3.EFT",0,1,1,"Exp Date: ${data['ExpDate']}"\r\n');

      // 4. Print the Barcode at the bottom
      await sendCommand(
          'BARCODE 20,120,"128",60,1,0,2,2,"${data['barcode']}"\r\n');

      // Ensure the number of copies is properly initialized
      int copies = data['copies'] ?? 1; // Default to 1 copy if not provided

      // Debugging line to check the copies value before sending to the printer
      print("Number of copies to print: $copies");

      // Do not clear before printing; instead, send the print command now
      await sendCommand(
          'PRINT $copies\r\n'); // Send the correct number of copies to print
    } else if (labelSize == 'SIZE 35mm,15mm') {
      // Set the label size to 35mm x 15mm

      await sendCommand('SIZE 35 mm,15 mm\r\n');
      await sendCommand('GAP 2.5 mm,0 mm\r\n');
      await sendCommand('CLS\r\n');
      await sendCommand('REFERENCE 0,0\r\n');

      // 1. Print Item name (adjusted position and font size for the smaller label)
      await sendCommand('TEXT 10,10,"B.FNT",0,1,1,"${data['Name']}"\r\n');

      // 2. Print MRP on a new line
      await sendCommand(
          'TEXT 10,30,"3.EFT",0,1,1,"MRP: ${data['mrpPrice']}"\r\n');

      // 3. Print Rate on a new line (adjusted to a lower position to avoid overlap)
      await sendCommand(
          'TEXT 10,50,"3.EFT",0,1,1,"Rate: ${data['Price']}"\r\n');

      // 4. Print the Barcode at the bottom (adjusted barcode height to fit the label)
      await sendCommand(
          'BARCODE 10,70,"128",50,1,0,2,2,"${data['barcode']}"\r\n');

      // Ensure the number of copies is properly initialized
      int copies = data['copies'] ?? 1; // Default to 1 copy if not provided

      // Send the print command
      await sendCommand('PRINT $copies\r\n');
    } else if (labelSize == 'SIZE 25mm,15mm') {
      // Set the label size to 25mm x 15mm
      await sendCommand('SIZE 25 mm,15 mm\r\n');
      await sendCommand('GAP 2.5 mm,0 mm\r\n');
      await sendCommand('CLS\r\n');
      await sendCommand('REFERENCE 0,0\r\n');

      // 1. Print Item name (reduce font size and position to avoid clipping)
      await sendCommand('TEXT 5,25,"B.FNT",0,1,1,"${data['Name']}"\r\n');

      // 2. Print MRP (further adjust Y-position to avoid overlap with Name)
      await sendCommand(
          'TEXT 6,45,"3.EFT",0,1,1,"MRP:${data['mrpPrice']}"\r\n');

      // 3. Print Rate (adjust position to ensure it doesn't overlap with MRP)
      await sendCommand('TEXT 5,65,"3.EFT",0,1,1,"Rate:${data['Price']}"\r\n');

      // 4. Print the Barcode (move barcode further down, very close to bottom)
      await sendCommand(
          'BARCODE 2,82,"128",40,1,0,2,2,"${data['barcode']}"\r\n');

      // Ensure the number of copies is properly initialized
      int copies = data['copies'] ?? 1; // Default to 1 copy if not provided

      // Send the print command
      await sendCommand('PRINT $copies\r\n');
    }
  }
}

//2024/06
class UsbDevice {
  final int vid;
  final int pid;

  UsbDevice(this.vid, this.pid);

  @override
  String toString() {
    return 'UsbDevice{vid: $vid, pid: $pid}';
  }
}
