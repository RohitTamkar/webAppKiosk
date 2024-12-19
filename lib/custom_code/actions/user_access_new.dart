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

Future<List<UserAccessCStruct>?> userAccessNew(
  bool? para1,
  bool? para2,
  bool? para3,
  bool? para4,
  bool? para5,
  bool? para6,
  bool? para7,
  bool? para8,
  int? para9,
  int? para10,
  int? para11,
  int? para12,
  int? para13,
  int? para14,
  int? para15,
) async {
  // Add your function code here!
  int p1 = 0;
  int p2 = 0;
  int p3 = 0;
  int p4 = 0;
  int p5 = 0;
  int p6 = 0;
  int p7 = 0;
  int p8 = 0;
  if (para1 == true) {
    p1 = 1;
  } else {
    p1 = 0;
  }
  if (para2 == true) {
    p2 = 1;
  } else {
    p2 = 0;
  }
  if (para3 == true) {
    p3 = 1;
  } else {
    p3 = 0;
  }
  if (para4 == true) {
    p4 = 1;
  } else {
    p4 = 0;
  }
  if (para5 == true) {
    p5 = 1;
  } else {
    p5 = 0;
  }
  if (para6 == true) {
    p6 = 1;
  } else {
    p6 = 0;
  }
  if (para7 == true) {
    p7 = 1;
  } else {
    p7 = 0;
  }
  if (para8 == true) {
    p8 = 1;
  } else {
    p8 = 0;
  }

  List<dynamic> accessString = [];
  accessString.add({"title": "Edit Bill", "value": p1});
  accessString.add({"title": "Goods Received", "value": p2});
  accessString.add({"title": "Reports", "value": p3});
  accessString.add({"title": "Settings", "value": p4});
  accessString.add({"title": "Shift Report", "value": p5});
  accessString.add({"title": "Stock Out", "value": p6});
  accessString.add({"title": "payment", "value": p7});
  accessString.add({"title": "Barcode", "value": p8});
  accessString.add({"title": "Sales Order", "value": para9});
  accessString.add({"title": "Purchase Order", "value": para10});
  accessString.add({"title": "Leads", "value": para11});
  accessString.add({"title": "Service Call", "value": para12});
  accessString.add({"title": "Expense ", "value": para13});
  accessString.add({"title": "Production Batch", "value": para14});
  accessString.add({"title": "Attendance", "value": para15});

  print(accessString);

  List<UserAccessCStruct> returnList = [];
  UserAccessCStruct struct = UserAccessCStruct();

  for (int j = 0; j < accessString.length; j++) {
    struct = createUserAccessCStruct(
        title: accessString[j]["title"], value: accessString[j]["value"]);
    returnList.add(struct);
  }

  print(returnList);

  return returnList;
}
