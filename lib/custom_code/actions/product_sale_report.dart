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

import 'index.dart'; // Imports other custom actions

Future<List<dynamic>> productSaleReport(
  String dayId,
  String outletId,
) async {
  List<dynamic> docObj = [];
  List<dynamic> prd = [];
  List<dynamic> finalList = [];
  List<dynamic> catIds = [];
  List<dynamic> distinctCatID = [];
  List<dynamic> lastFinalList = [];
  double allProductTotal = 0.0;
  double allCatTotal = 0.0;
  List<dynamic> otherDetails = [];
  double totalSale = 0.0;
  int totalBill = 0;
  double totalDis = 0.0, totalDelChg = 0.0, totalDisPer = 0.0, totalTax = 0.0;

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('INVOICE')
      .where('dayId', isEqualTo: dayId)
      .get();

  if (querySnapshot.size == 0) {
    print('No matching documents.');
    return [];
  }

  for (var invoice in querySnapshot.docs) {
    totalSale += invoice["finalBillAmt"];
    totalDisPer += invoice["discountPer"];
    totalBill += 1;
    totalDelChg += invoice["delliveryChrg"];
    totalDis += invoice["discountAmt"];
    totalTax += invoice["taxAmt"];

    List<dynamic> tempPrd = invoice["productList"];

    for (var product in tempPrd) {
      QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
          .collection('OUTLET')
          .doc(outletId)
          .collection('PRODUCT')
          .where('id', isEqualTo: product["id"])
          .get();

      for (var doc in querySnapshot2.docs) {
        double purPriceTotal = doc["purchasePrice"] * product["quantity"];
        double costTotal =
            product["total"] - purPriceTotal; // Profit/Loss (prls)

        docObj.add({
          "id": product["id"],
          "quantity": product["quantity"],
          "name": product["name"],
          "price": product["price"],
          "purchasePrice": doc["purchasePrice"],
          "costTotal": purPriceTotal,
          "prls": costTotal, // Correct calculation for profit/loss
          "total": product["total"],
          "catId": product["catId"]
        });

        allProductTotal += product["total"]; // Accumulate product total
      }
    }
  }

  // Group products and aggregate quantities and totals
  for (var item in docObj) {
    int index = prd.indexWhere((element) => element["id"] == item["id"]);
    if (index == -1) {
      prd.add(item); // Add new product
    } else {
      // Update existing product quantities and totals
      prd[index]["quantity"] += item["quantity"];
      prd[index]["total"] += item["total"];
    }
  }

  // Collect all unique category IDs
  for (var product in prd) {
    catIds.add(product["catId"]);
  }

  distinctCatID = catIds.toSet().toList(); // Get distinct category IDs
  List<dynamic> categoryList = [];

  for (var catId in distinctCatID) {
    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection('OUTLET')
        .doc(outletId)
        .collection('CATEGORY')
        .where('id', isEqualTo: catId)
        .get();

    if (querySnapshot1.size > 0) {
      var category = querySnapshot1.docs.first;
      categoryList.add({
        "catId": category.id,
        "catName": category["name"],
        "catTotal": 0.0, // Initialize total for this category
        "quantity": "--"
      });
    }
  }

  // Now group products by category and calculate category totals
  for (var category in categoryList) {
    List<dynamic> temp1 = [];
    for (var product in prd) {
      if (category["catId"] == product["catId"]) {
        category["catTotal"] += product["total"];
        temp1.add(product);
      }
    }
    allCatTotal += category["catTotal"];
    finalList.add({"category": category, "products": temp1});
  }

  // Final data
  lastFinalList.add({
    "allProducts": prd,
    "details": finalList,
    "dayId": dayId,
    "allProductTotal": allProductTotal,
    "allCatTotal": allCatTotal,
    "otherDetails": {
      "totalSale": totalSale,
      "totalDisPer": totalDisPer,
      "totalBill": totalBill,
      "totalDelChg": totalDelChg,
      "totalDis": totalDis,
      "totalTax": totalTax
    }
  });

  return lastFinalList;
}
