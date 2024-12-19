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
import 'package:step_progress_indicator/step_progress_indicator.dart';

class LinearProgressBar extends StatefulWidget {
  const LinearProgressBar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _LinearProgressBarState createState() => _LinearProgressBarState();
}

class _LinearProgressBarState extends State<LinearProgressBar> {
  int value = 10;
  String time = "";

  @override
  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: 2), (timer) {
      DateTime timenow = DateTime.now(); //get current date and time
      time = timenow.hour.toString() +
          ":" +
          timenow.minute.toString() +
          ":" +
          timenow.second.toString();
      value--;
      print(value);
      if (value == 0) {
        timer.cancel();
      }
      setState(() {});
      //mytimer.cancel() //to terminate this timer
    });
    super.initState();
  }
  // int determinateIndicator() {
  //   Timer.periodic(Duration(minutes: 1), (timer) {
  //     setState(() {
  //       value++;
  //       print(value);
  //
  //     });
  //   });
  //   return value;
  // }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          StepProgressIndicator(
            totalSteps: 10,
            currentStep: value,
            size: 14,
            padding: 0,
            roundedEdges: Radius.circular(10),
            selectedColor: Color.fromRGBO(162, 219, 61, 1),
            unselectedColor: Color.fromRGBO(216, 213, 229, 1),
          )
        ],
      ),
    );
  }
}
