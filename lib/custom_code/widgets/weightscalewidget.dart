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

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_libserialport/flutter_libserialport.dart';

class Weightscalewidget extends StatefulWidget {
  const Weightscalewidget({
    super.key,
    this.width,
    this.height,
    this.port,
  });

  final double? width;
  final double? height;
  final String? port;

  @override
  State<Weightscalewidget> createState() => _WeightscalewidgetState();
}

class _WeightscalewidgetState extends State<Weightscalewidget> {
  SerialPort? _port;
  String _weightData = "No data";
  String _buffer = ""; // Buffer to accumulate incoming data

  @override
  void initState() {
    super.initState();
    _openSerialPort();
  }

  void _openSerialPort() {
    try {
      _port = SerialPort(widget.port!);
      if (_port!.openReadWrite()) {
        SerialPortReader reader = SerialPortReader(_port!);
        reader.stream.listen((data) {
          _buffer += _processData(data); // Append incoming data to the buffer

          // Try to extract weight from the buffer
          String? weight = _extractWeightFromBuffer(_buffer);
          if (weight != null) {
            setState(() {
              _weightData = weight;
              FFAppState().weight = _weightData; // Update the displayed weight
            });
            _buffer = ""; // Clear buffer after processing
          }
        });
      }
    } catch (e) {
      setState(() {
        _weightData = "Error: $e";
      });
    }
  }

  // Convert raw data to readable format and filter non-printable characters
  String _processData(List<int> data) {
    // Convert raw data to a readable string
    return String.fromCharCodes(data.where((byte) =>
        byte >= 32 && byte <= 126)); // Filter non-printable characters
  }

  // Extract weight value from the buffer
  String? _extractWeightFromBuffer(String buffer) {
    final RegExp regex = RegExp(r'([-+]?\d*\.\d+)');
    final match = regex.allMatches(buffer).map((m) => m.group(0)).toList();

    // Process matches to find a reasonable weight value
    for (String? value in match) {
      if (value != null) {
        double weight = double.tryParse(value) ?? 0.0;
        // Apply a threshold: treat values below 0.01 as zero
        if (weight.abs() < 0.01) {
          return "0.000 "; // Show zero weight if below threshold
        }
        return '${weight.toStringAsFixed(3)}'; // Return the weight with 3 decimal places
      }
    }
    return null; // No valid weight found
  }

  @override
  void dispose() {
    _port?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _weightData,
          style: const TextStyle(
              fontSize: 48,
              fontWeight:
                  FontWeight.bold), // Increase font size for better visibility
        ),
      ),
    );
  }
}
