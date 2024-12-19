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

import 'dart:async';
import 'dart:developer';
import 'dart:io';
//import 'package:flutter_pos_printer_platform/flutter_pos_printer_platform.dart';
import 'package:flutter_pos_printer_platform_image_3_sdt/flutter_pos_printer_platform_image_3_sdt.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';

class PosPrintingCopy extends StatefulWidget {
  const PosPrintingCopy({
    Key? key,
    this.width,
    this.height,
    this.selectedPrinter,
    required this.isConnected,
    required this.connectDevice,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic selectedPrinter;
  final bool isConnected;
  final Future<dynamic> Function() connectDevice;

  @override
  _PosPrintingCopyState createState() => _PosPrintingCopyState();
}

class _PosPrintingCopyState extends State<PosPrintingCopy> {
  var defaultPrinterType = PrinterType.bluetooth;
  var _isBle = false;
  var _reconnect = false;
  var _selectedPrinter;
  var _isConnected = false;
  var printerManager = PrinterManager.instance;
  var devices = <BluetoothPrinter>[];
  StreamSubscription<PrinterDevice>? _subscription;
  StreamSubscription<BTStatus>? _subscriptionBtStatus;
  StreamSubscription<USBStatus>? _subscriptionUsbStatus;
  BTStatus _currentStatus = BTStatus.none;

  // _currentUsbStatus is only supports on Android
  USBStatus _currentUsbStatus = USBStatus.none;
  List<int>? pendingTask;
  String _ipAddress = '';
  String _port = '9100';
  final _ipController = TextEditingController();
  final _portController = TextEditingController();
  BluetoothPrinter? selectedPrinter;
  @override
  void initState() {
    if (Platform.isWindows) defaultPrinterType = PrinterType.usb;
    super.initState();
    _portController.text = _port;
    _scan();

    // subscription to listen change status of bluetooth connection
    _subscriptionBtStatus =
        PrinterManager.instance.stateBluetooth.listen((status) {
      log(' ----------------- status bt $status ------------------ ');
      _currentStatus = status;
      if (status == BTStatus.connected) {
        setState(() {
          _isConnected = true;
        });
      }
      if (status == BTStatus.none) {
        setState(() {
          _isConnected = false;
        });
      }
      if (status == BTStatus.connected && pendingTask != null) {
        if (Platform.isAndroid) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            PrinterManager.instance
                .send(type: PrinterType.bluetooth, bytes: pendingTask!);
            pendingTask = null;
          });
        } else if (Platform.isIOS) {
          PrinterManager.instance
              .send(type: PrinterType.bluetooth, bytes: pendingTask!);
          pendingTask = null;
        }
      }
    });
    //  PrinterManager.instance.stateUSB is only supports on Android
    _subscriptionUsbStatus = PrinterManager.instance.stateUSB.listen((status) {
      log(' ----------------- status usb $status ------------------ ');
      _currentUsbStatus = status;
      if (Platform.isAndroid) {
        if (status == USBStatus.connected && pendingTask != null) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            PrinterManager.instance
                .send(type: PrinterType.usb, bytes: pendingTask!);

            pendingTask = null;
          });
        }
      }
    });
  }

  void selectDevice(BluetoothPrinter device) async {
    if (selectedPrinter != null) {
      if ((device.address != selectedPrinter!.address) ||
          (device.typePrinter == PrinterType.usb &&
              selectedPrinter!.vendorId != device.vendorId)) {
        await PrinterManager.instance
            .disconnect(type: selectedPrinter!.typePrinter);
      }
    }

    selectedPrinter = device;
    print("selectedPrinter");
    print(selectedPrinter);
    setState(() {
      FFAppState().printerDevice.clear();
      FFAppState().printerDevice.add({
        "deviceName": device.deviceName,
        "address": device.address,
        "isBle": _isBle,
        "vendorId": device.vendorId,
        "productId": device.productId,
        "typePrinter": defaultPrinterType
      });
    });
  }

  // method to scan devices according PrinterType
  void _scan() {
    devices.clear();
    _subscription = printerManager
        .discovery(type: defaultPrinterType, isBle: _isBle)
        .listen((device) {
      print(device);
      devices.add(BluetoothPrinter(
        deviceName: device.name,
        address: device.address,
        isBle: _isBle,
        vendorId: device.vendorId,
        productId: device.productId,
        typePrinter: defaultPrinterType,
      ));
      print(device);
      setState(() {
        FFAppState().printerDevice = [];
        //  FFAppState().printerDevice?FFAppState().printerDevice.clear():"";
        FFAppState().printerDevice.add({
          "deviceName": device.name,
          "address": device.address,
          "isBle": _isBle,
          "vendorId": device.vendorId,
          "productId": device.productId,
          "typePrinter": defaultPrinterType
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                            _selectedPrinter == null || widget.isConnected
                                ? null
                                : () {
                                    widget.connectDevice();
                                  },
                        child:
                            const Text("Connect", textAlign: TextAlign.center),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                            _selectedPrinter == null || !widget.isConnected
                                ? null
                                : () {
                                    if (_selectedPrinter != null)
                                      printerManager.disconnect(
                                          type: _selectedPrinter!.typePrinter);
                                    setState(() {
                                      _isConnected = false;
                                    });
                                  },
                        child: const Text("Disconnect",
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButtonFormField<PrinterType>(
                value: defaultPrinterType,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.print,
                    size: 24,
                  ),
                  labelText: "Type Printer Device",
                  labelStyle: TextStyle(fontSize: 18.0),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                items: <DropdownMenuItem<PrinterType>>[
                  if (Platform.isAndroid || Platform.isIOS)
                    const DropdownMenuItem(
                      value: PrinterType.bluetooth,
                      child: Text("bluetooth"),
                    ),
                  if (Platform.isAndroid || Platform.isWindows)
                    const DropdownMenuItem(
                      value: PrinterType.usb,
                      child: Text("usb"),
                    ),
                  const DropdownMenuItem(
                    value: PrinterType.network,
                    child: Text("Wifi"),
                  ),
                ],
                onChanged: (PrinterType? value) {
                  setState(() {
                    if (value != null) {
                      setState(() {
                        defaultPrinterType = value;
                        _selectedPrinter = null;
                        _isBle = false;
                        _isConnected = false;
                        _scan();
                      });
                    }
                  });
                },
              ),
              Column(
                  children: devices
                      .map(
                        (device) => ListTile(
                          title: Text('${device.deviceName}',
                              style: TextStyle(fontSize: 12.0)),
                          subtitle: Platform.isAndroid &&
                                  defaultPrinterType == PrinterType.usb
                              ? null
                              : Visibility(
                                  visible: !Platform.isWindows,
                                  child: Text("${device.address}",
                                      style: TextStyle(fontSize: 12.0))),
                          onTap: () {
                            // do something
                            selectDevice(device);
                          },
                          leading: selectedPrinter != null &&
                                  ((device.typePrinter == PrinterType.usb &&
                                              Platform.isWindows
                                          ? device.deviceName ==
                                              selectedPrinter!.deviceName
                                          : device.vendorId != null &&
                                              selectedPrinter!.vendorId ==
                                                  device.vendorId) ||
                                      (device.address != null &&
                                          selectedPrinter!.address ==
                                              device.address))
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : null,
                          trailing: OutlinedButton(
                            onPressed: selectedPrinter == null ||
                                    device.deviceName !=
                                        selectedPrinter?.deviceName
                                ? null
                                : () async {
                                    List<dynamic> list = [];
                                    InvoiceRecord? invoiceDetails;
                                    String status;
                                    if (device.typePrinter == PrinterType.usb) {
                                      status = _currentUsbStatus.toString();
                                    } else {
                                      status = _currentStatus.toString();
                                    }
                                    FFAppState().printerName = status;
                                  },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 20),
                              child: Text("Print test ticket",
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      )
                      .toList()),
              Visibility(
                visible: defaultPrinterType == PrinterType.bluetooth &&
                    Platform.isAndroid,
                child: SwitchListTile.adaptive(
                  contentPadding: const EdgeInsets.only(bottom: 20.0, left: 20),
                  title: const Text(
                    "This device supports ble (low energy)",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 19.0),
                  ),
                  value: _isBle,
                  onChanged: (bool? value) {
                    setState(() {
                      _isBle = value ?? false;
                      _isConnected = false;
                      _selectedPrinter = null;
                      _scan();
                    });
                  },
                ),
              ),
              Visibility(
                visible: defaultPrinterType == PrinterType.bluetooth &&
                    Platform.isAndroid,
                child: SwitchListTile.adaptive(
                  contentPadding: const EdgeInsets.only(bottom: 20.0, left: 20),
                  title: const Text(
                    "reconnect",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 19.0),
                  ),
                  value: _reconnect,
                  onChanged: (bool? value) {
                    setState(() {
                      _reconnect = value ?? false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
