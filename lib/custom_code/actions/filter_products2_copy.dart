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

Future<List<SelItemListStruct>> filterProducts2Copy(
  int billno,
  List<dynamic> allBillList,
  List<TaxMasterRecord> taxcollection,
  String inclusiveorexclusive,
) async {
  List<dynamic> itemList = [];
  List<SelItemListStruct> returnList = [];
  SelItemListStruct struct = SelItemListStruct();

  if (allBillList.isNotEmpty) {
    for (int i = 0; i < allBillList.length; i++) {
      print(allBillList[i]["billno"]);
      if (allBillList[i]["billno"] == billno) {
        if (allBillList[i]["details"]["itemList"].length > 0) {
          itemList = (allBillList[i]["details"]["itemList"]);
          for (int j = 0; j < itemList.length; j++) {
            print(itemList[j]);

            // Find the taxPer in taxcollection by taxId
            String taxId = itemList[j]["taxId"];
            TaxMasterRecord taxRecord = taxcollection
                .firstWhere((element) => element.id == taxId, orElse: null);

            if (taxRecord != null) {
              // Calculate taxAmt based on taxPer
              double taxPer = taxRecord.percentage;
              print(itemList[j]["price"]);
              //int pp = itemList[j]["price"];
              double price = itemList[j]["price"];
              //  int qt = itemList[j]["quantity"];
              double quantity = itemList[j]["quantity"];
              double taxAmt = 0.0;

              if (inclusiveorexclusive.toLowerCase() == 'inclusive') {
                // Calculate taxAmt for inclusive tax
                taxAmt = (price * quantity * taxPer) / (100.0 + taxPer);
              } else {
                // Calculate taxAmt for exclusive tax
                taxAmt = (price * quantity * taxPer) / 100.0;
              }

              // Calculate total including/excluding taxAmt
              double total = (inclusiveorexclusive.toLowerCase() == 'inclusive')
                  ? (price * quantity)
                  : (price * quantity) + taxAmt;

              struct = createSelItemListStruct(
                name: itemList[j]["name"],
                price: price,
                quantity: quantity,
                total: total,
                id: itemList[j]["id"],
                catId: itemList[j]["catId"],
                taxId: taxId,
                taxPer: taxPer,
                taxAmt: taxAmt,
                isDeletedItem: false,
              );

              returnList.add(struct);
              print(returnList);
            }
          }
          break;
        }
      }
    }
  }

  return returnList;
}
