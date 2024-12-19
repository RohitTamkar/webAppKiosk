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
import 'dart:typed_data';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class UserInput extends StatefulWidget {
  const UserInput({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _date2Controller = TextEditingController();
  final TextEditingController _mrpController = TextEditingController();
  final TextEditingController _copiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Your existing content here
          ElevatedButton(
            onPressed: () async {
              // Define the action you want to perform when the button is pressed
              // For example, you can show a dialog
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Button Pressed'),
                  content: Text('You pressed the button!'),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        bool sk = true;
                        Map<String, dynamic> data = {
                          'quantityType': 'quantityType',
                          'quantity': '1',
                          'dateType': 'dateType',
                          'date': '2024-12-12',
                          'showDate2': sk,
                          'date2': '2024-12-12',
                          'mrp': '2024',
                          'copies': '2',
                          'name': 'Sensible',
                          'address': 'Pune',
                          'fssai': 'fssai',
                          'phone': '7066998333',
                          'bestBefore': 'gg'
                        };
                        Printer _printer = Printer();
                        await _printer.init();
                        await _printer.printLabel(data);
                        Navigator.pop(context);
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Press Me'),
          ),
        ],
      ),
    );
  }
}

class Company {
  final String name;
  final String address;
  final String fssai;
  final String phone;

  Company(
      {required this.name,
      required this.address,
      required this.fssai,
      required this.phone});
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

  // Print a label with the provided data
  Future<void> printLabel(Map<String, dynamic> data) async {
    await sendCommand('SIZE 25 mm,50 mm\r\n');
    await sendCommand('GAP 2.5 mm,0 mm\r\n');
    await sendCommand('CLS\r\n');
    await sendCommand('REFERENCE 0,0\r\n');
    await sendCommand('TEXT 30,30,"B.FNT",0,2,3,"${data['name']}"\r\n');
    await sendCommand('TEXT 430,30,"B.FNT",0,2,3,"${data['name']}"\r\n');
    await sendCommand('TEXT 30,80,"3.EFT",0,1,1,"${data['dateType']}:"\r\n');
    await sendCommand('TEXT 430,80,"3.EFT",0,1,1,"${data['dateType']}:"\r\n');
    await sendCommand('TEXT 110,82,"D.FNT",0,1,1,"${data['date']}"\r\n');
    await sendCommand('TEXT 510,82,"D.FNT",0,1,1,"${data['date']}"\r\n');
    await sendCommand(
        'TEXT 30,110,"3.EFT",0,1,1,"${data['quantityType']}:"\r\n');
    await sendCommand(
        'TEXT 430,110,"3.EFT",0,1,1,"${data['quantityType']}:"\r\n');
    await sendCommand('TEXT 130,112,"D.FNT",0,1,1,"${data['quantity']}"\r\n');
    await sendCommand('TEXT 530,112,"D.FNT",0,1,1,"${data['quantity']}"\r\n');
    await sendCommand('TEXT 30,140,"3.EFT",0,1,1,"MRP:"\r\n');
    await sendCommand('TEXT 430,140,"3.EFT",0,1,1,"MRP:"\r\n');
    await sendCommand('TEXT 90,142,"D.FNT",0,1,1,"${data['mrp']}"\r\n');
    await sendCommand('TEXT 490,142,"D.FNT",0,1,1,"${data['mrp']}"\r\n');

    if (data['bestBefore'] != null) {
      await sendCommand(
          'TEXT 30,170,"D.FNT",0,1,1,"Best before ${data['bestBefore']}"\r\n');
      await sendCommand(
          'TEXT 430,170,"D.FNT",0,1,1,"Best before ${data['bestBefore']}"\r\n');
    }

    if (data['phone'] != null && data['phone'] != '') {
      await sendCommand(
          'TEXT 30,200,"0",0,6,5,"Customer Care: ${data['phone']}"\r\n');
      await sendCommand(
          'TEXT 430,200,"0",0,6,5,"Customer Care: ${data['phone']}"\r\n');
    }

    if (data['fssai'] != null && data['fssai'] != '') {
      await sendCommand('TEXT 30,220,"0",0,6,5,"fssai: ${data['fssai']}"\r\n');
      await sendCommand('TEXT 430,220,"0",0,6,5,"fssai: ${data['fssai']}"\r\n');
    }

    /*  if (data['address'] != null && data['address'] != '') {
      await sendCommand('BLOCK 240,190,160,50,"0",0,6,5,"MFD BY: ${data['address']}"\r\n');
      await sendCommand('BLOCK 640,190,160,50,"0",0,6,5,"MFD BY: ${data['address']}"\r\n');
    }*/

    int copies = 1;
    copies = (copies / 2).ceil();
    await sendCommand('PRINT $copies\r\n');
  }
}

class UsbDevice {
  final int vid;
  final int pid;

  UsbDevice(this.vid, this.pid);

  @override
  String toString() {
    return 'UsbDevice{vid: $vid, pid: $pid}';
  }
}
