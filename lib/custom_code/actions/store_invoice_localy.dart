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

import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';

Future storeInvoiceLocaly(List<dynamic> invoiceDetails) async {
  final HiveMethods hiveMethods = HiveMethods();
  List<InvoiceModel> invoice = [];
  bool isLoading = true;

  //fetch user
  // await hiveMethods.deleteAllUsers();
  await Hive.initFlutter();
  await Hive.openBox('hive_local_invoice');

  hiveMethods.addUser(InvoiceModel(
      id: 0,
      items: invoiceDetails,
      total: 0,
      quantity: 0,
      billNo: FFAppState().selBill));

  print(invoiceDetails);
  // Add your function code here!
}

class InvoiceModel {
  InvoiceModel({this.id, this.items, this.total, this.quantity, this.billNo});

  List<dynamic>? items;

  double? total;

  double? quantity;

  int? billNo;
  int? id;

  factory InvoiceModel.fromMap(Map<String, dynamic> json) => InvoiceModel(
      id: json['id'],
      items: json['items'],
      total: json['total'],
      quantity: json['quantity'],
      billNo: json['billNo']);

  Map<String, dynamic> toMap(InvoiceModel invoiceModel) {
    Map<String, dynamic> invoiceModelMap = Map();
    invoiceModelMap["id"] = invoiceModel.id;
    invoiceModelMap["items"] = invoiceModel.items;
    invoiceModelMap["total"] = invoiceModel.total;
    invoiceModelMap["quantity"] = invoiceModel.quantity;
    invoiceModelMap["billNo"] = invoiceModel.billNo;
    return invoiceModelMap;
  }
}

class HiveMethods {
  String hiveBox = 'hive_local_invoice';

  //Adding user model to hive db
  addUser(InvoiceModel invoiceModel) async {
    var box = await Hive.openBox(hiveBox); //open the hive box before writing
    var mapData = invoiceModel.toMap(invoiceModel);
    await box.add(mapData);
    Hive.close(); //closing the hive box
  }

  //Reading all the users data
  Future<List<InvoiceModel>> getLists() async {
    var box = await Hive.openBox(hiveBox);
    List<InvoiceModel> invoice = [];

    for (int i = box.length - 1; i >= 0; i--) {
      var invoiceModel = box.getAt(i);
      invoice.add(InvoiceModel.fromMap(Map.from(invoiceModel)));
    }
    return invoice;
  }

  //Deleting one data from hive DB
  delete(int id) async {
    var box = await Hive.openBox(hiveBox);
    await box.deleteAt(id);
  }

  //Deleting whole data from Hive
  deleteAll() async {
    var box = await Hive.openBox(hiveBox);
    await box.clear();
  }
}
