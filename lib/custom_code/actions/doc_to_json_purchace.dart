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

Future<dynamic> docToJsonPurchace(
    PurchaseRecord? data, DocumentReference docRef) async {
  // Add your function code here!
  List<dynamic> objList = [];
  if (data != null) {
    List<dynamic> temp = [];
    data.productList!.forEach((item) {
      temp.add({
        "name": item.name,
        "price": item.price,
        "quantity": item.quantity,
        "total": item.total,
        "id": item.id,
        "catId": item.catId,
        "acceptedQty": item.acceptedQty,
        "rejectedQty": item.rejectedQty,
        "discoumtAmt": item.discount,
        "delivery": item.delliveryChrg
      });
    });
    objList.add({
      "docRef": docRef,
      "billAmt": data.billAmt,
      "dayId": data.dayId,
      "finalAmt": data.finalBillAmt,
      "delliveryChrg": data.delliveryChrg,
      "discountAmt": data.discountAmt,
      "id": data.id,
      "order": data.order,
      "gstNo": data.gstNo,
      "receivedAmt": data.receivedAmt,
      "balanceDue": data.balanceDue,
      "paidAmt": data.paidAmt,
      "type": data.type,
      "paymentStatus": data.paymentStatus,
      "disPer": data.discountPer,
      "orderDate": data.orderDate,
      "authorizedBy": data.authorizedBy,
      "status": data.status,
      "mobile": data.mobile,
      "grossTotal": data.grosssTotal,

      //"invoice": data.invoice,
      // "invoiceDate": data.invoiceDate,
      "party": data.party,
      "paymentMode": data.paymentMode,
      // "products": data.products,
      // "reference": data.reference,
      "taxAmt": data.taxAmt,
      "roundOff": data.roundOff,
      "productList": temp,
      "comment": data.comment,
      "modifiedDate": data.modifiedDate,
      "modifiedBy": data.modifiedBy,
    });
    print("result Item");
    print(objList[0]);
  }
  return objList[0];
}
