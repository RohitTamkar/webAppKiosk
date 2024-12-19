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

import 'package:serial_port_win32/serial_port_win32.dart';

import 'dart:typed_data';

class PdLedCustomerdisplay extends StatefulWidget {
  const PdLedCustomerdisplay({
    super.key,
    this.width,
    this.height,
    required this.amount,
    required this.displayString,
    required this.port,
  });

  final double? width;
  final double? height;
  final String amount;
  final String displayString;
  final String port;

  @override
  State<PdLedCustomerdisplay> createState() => _PdLedCustomerdisplayState();
}

class _PdLedCustomerdisplayState extends State<PdLedCustomerdisplay> {
  late SerialPort serialPort;

  @override
  void initState() {
    super.initState();
    _initializeSerialPort();
    _updateDisplay(); // Show the initial value
  }

  @override
  void dispose() {
    if (serialPort.isOpened) {
      serialPort.close();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(PdLedCustomerdisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.amount != widget.amount) {
      _updateDisplay(); // Update the LED display when the amount changes
    }
  }

  void _initializeSerialPort() {
    serialPort = SerialPort(
      widget.port,
      BaudRate: 2400, // Set the baud rate of your device
      StopBits: 1,
      ByteSize: 8,
      Parity: 0,
      ReadIntervalTimeout: 1,
    );
    serialPort.open();
    if (!serialPort.isOpened) {
      debugPrint("Failed to open port ${widget.port}");
    } else {
      debugPrint("Port ${widget.port} opened successfully");
    }
  }

  void _clearDisplay() {
    if (!serialPort.isOpened) {
      debugPrint("Serial port is not opened. Cannot clear display.");
      return;
    }

    // Send the clear command to the display (example: 0x0C for clear)
    List<int> clearCommand = [
      0x0C
    ]; // Replace with your display's clear command
    serialPort.writeBytesFromUint8List(Uint8List.fromList(clearCommand));
    debugPrint("Display cleared.");
  }

  void _updateDisplay() {
    if (!serialPort.isOpened) {
      debugPrint("Serial port is not opened. Cannot update display.");
      return;
    }

    // Clear the display first
    _clearDisplay();

    // Construct the data string to send
    String dataToSend = widget.amount;

    // Send the updated data
    List<int> data = dataToSend.codeUnits;
    serialPort.writeBytesFromUint8List(Uint8List.fromList(data));
    debugPrint("Data sent to display: $dataToSend");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 50.0,
      color: Colors.black,
      child: Center(
        child: Text(
          "Displaying: ${widget.displayString} ${widget.amount}",
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
