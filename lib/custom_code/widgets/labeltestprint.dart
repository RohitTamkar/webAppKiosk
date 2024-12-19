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

import 'package:flutter_libserialport/flutter_libserialport.dart';

class Labeltestprint extends StatefulWidget {
  const Labeltestprint({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Labeltestprint> createState() => _LabeltestprintState();
}

class _LabeltestprintState extends State<Labeltestprint> {
  late SerialPort port;

  @override
  void initState() {
    super.initState();
    // Initialize the serial port with the correct COM port
    port = SerialPort('COM4'); // Replace with your actual COM port

    if (!port.openReadWrite()) {
      print('Failed to open port.');
      return;
    }

    // Set port parameters
    port.config.baudRate =
        9600; // Set the baud rate according to your printer settings
    port.config.bits = 8;
    port.config.stopBits = 1;
    port.config.parity = SerialPortParity.none;
  }

  void printLabel() {
    final data = [
      'SIZE 25 mm, 15 mm\r\n', // Label size
      'GAP 3 mm, 0 mm\r\n', // Gap between labels
      'DENSITY 15\r\n', // Print density
      'DIRECTION 1\r\n', // Print direction
      'CLS\r\n', // Clear buffer
      'TEXT 10,10,"0",0,1,1,"Hello World"\r\n', // Text for label
      'PRINT 1,1\r\n', // Print command
    ].join('');

    final bytes = Uint8List.fromList(data.codeUnits);
    port.write(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TSC Label Printer Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: printLabel,
          child: const Text('Print Label'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    port.close();
    super.dispose();
  }
}
