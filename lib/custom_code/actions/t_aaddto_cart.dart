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

Future<dynamic> tAaddtoCart(
  ProductRecord prdDoc,
  int incQuant,
  int decQuant,
  bool existOrNot,
  dynamic prdJsonDocActn,
) async {
  // Add your function code here!
  Map<String, dynamic> prdShow = {};
  //int n;
  // Add product details to the map
  //n = prdShow["totalQuant"];
  if (existOrNot == false) {
    prdShow["prd"] = prdDoc;
    prdShow["id"] = prdDoc.id;
    prdShow["incQuantity"] = incQuant; //prdShow["incQuantity"] +
    prdShow["decQuantity"] = decQuant; // prdShow["decQuantity"] -

    // Check conditions for incQuant and decQuant
    if (incQuant == 1) {
      prdShow["totalQuant"] = incQuant;
    } else if (decQuant == 1) {
      prdShow["totalQuant"] = decQuant;
    }

    // Calculate totalAmt based on totalQuant
    prdShow["totalAmt"] = prdDoc.sellingPrice * prdShow["totalQuant"];
  } else {
    prdShow["prd"] = prdDoc;
    prdShow["id"] = prdDoc.id;
    prdShow["incQuantity"] = incQuant; //prdShow["incQuantity"] +
    prdShow["decQuantity"] = decQuant; // prdShow["decQuantity"] -

    // Check conditions for incQuant and decQuant
    if (incQuant == 1) {
      prdShow["totalQuant"] = prdJsonDocActn["totalQuant"] + 1; //= incQuant;
    } else if (decQuant == 1) {
      prdShow["totalQuant"] = prdJsonDocActn["totalQuant"] - 1; //= decQuant;
    }

    // Calculate totalAmt based on totalQuant
    prdShow["totalAmt"] = prdDoc.sellingPrice * prdShow["totalQuant"];
  }

  // Print the result
  print(prdShow);

  // Return the map
  return prdShow;
}
