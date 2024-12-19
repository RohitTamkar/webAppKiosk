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
import 'package:intl/intl.dart';
import 'dart:async';

class Datetimecountdown extends StatefulWidget {
  const Datetimecountdown({
    Key? key,
    this.width,
    this.height,
    this.parameter,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int? parameter;

  @override
  _DatetimecountdownState createState() => _DatetimecountdownState();
}

class _DatetimecountdownState extends State<Datetimecountdown> {
  late Timer _timer;
  late String formattedDateTime;

  @override
  void initState() {
    super.initState();
    formattedDateTime = _getFormattedDateTime();
    _startTimer();
  }

  String _getFormattedDateTime() {
    if (widget.parameter == 0) {
      return DateFormat('MMM d, y').format(DateTime.now());
    } else {
      return DateFormat('MMM d, y h:mm:ss a').format(DateTime.now());
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateCountdown();
    });
  }

  void _updateCountdown() {
    // Update the UI with the current date and time
    setState(() {
      formattedDateTime = _getFormattedDateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      // Add your live date/time UI here
      child: Center(
        child: Text(
          '$formattedDateTime',
          style: TextStyle(
            fontSize: 18,
            color: widget.parameter == 1 ? Colors.blueGrey : Colors.white,
          ),
        ),
      ),
    );
  }
}
