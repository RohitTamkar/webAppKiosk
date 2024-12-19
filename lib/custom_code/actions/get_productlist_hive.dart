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

import 'package:hive_flutter/hive_flutter.dart';
import 'setup_item_hive.dart';

Future<List<ProductStructStruct>?> getProductlistHive() async {
  // Add your function code here!
  await productBox;

  //how many items are in the hive box?
  final int boxcount = productBox.length;

  List<ProductStructStruct> itemFlowConverted = [];

  // for loop through the box and convert each item to <Item> datatype then into a list of <Item> datatypes
  for (int i = 0; i < boxcount; i++) {
    final dynamic key = productBox.keyAt(i); // Use dynamic type for key
    final item = productBox.getAt(i);
    var capturedbarcode = item.barcode;
    var capturedcategory = item.category;
    var capturedcategoryId = item.categoryId;
    var capturedcode = item.code;
    var captureddiscountAmt = item.discountAmt;
    var captureddiscountPer = item.discountPer;
    var capturedhsncode = item.hsncode;

    var capturedid = item.id;
    var capturedimageUrl = item.imageUrl;
    var capturedisDeleted = item.isDeleted;
    var capturedkeywords = item.keywords;
    var capturedmrpPrice = item.mrpPrice;
    var capturedname = item.name;
    var capturedprice = item.price;

    var capturedproductMasterId = item.productMasterId;
    var capturedpurchasePrice = item.purchasePrice;
    var capturedrecipeId = item.recipeId;
    var capturedrecipeRefId = item.recipeRefId;
    var capturedregionalName = item.regionalName;
    var capturedreorderLevel = item.reorderLevel;
    var capturedsearchcode = item.searchcode;

    var capturedsellingPrice = item.sellingPrice;
    var capturedserviceOutletId = item.serviceOutletId;
    var capturedshortName = item.shortName;
    var capturedstock = item.stock;
    var capturedstockable = item.stockable;
    var capturedtaxId = item.taxId;
    var capturedtype = item.type;
    var capturedunitId = item.unitId;
    var capturedweightable = item.weightable;
    var capturedsynC = item.synC;
    var capturedversion = item.version;

    // Check if key is a valid int
    int parsedKey = key is int ? key : 9999;

    ProductStructStruct itemPreConvert = ProductStructStruct(
      hivekey: parsedKey,
      barcode: capturedbarcode ?? '',
      category: capturedcategory ?? '',
      categoryId: capturedcategoryId ?? '',
      code: capturedcode ?? 00,
      discountAmt: captureddiscountAmt ?? 00,
      discountPer: captureddiscountPer ?? 00,
      hsncode: capturedhsncode ?? 00,
      id: capturedid ?? '',
      imageUrl: capturedimageUrl ?? '',
      isDeleted: capturedisDeleted,
      keywords: capturedkeywords ?? '',
      mrpPrice: capturedmrpPrice ?? 00,
      name: capturedname ?? '',
      price: capturedprice ?? 00,
      productMasterId: capturedproductMasterId ?? '',
      recipeId: capturedrecipeId ?? '',
      recipeRefId: capturedrecipeRefId ?? '',
      regionalName: capturedregionalName ?? '',
      reorderLevel: capturedreorderLevel ?? 00,
      searchcode: capturedsearchcode ?? 00,
      sellingPrice: capturedsellingPrice ?? 00,
      serviceOutletId: capturedserviceOutletId ?? '',
      shortName: capturedshortName ?? '',
      stock: capturedstock ?? 00,
      stockable: capturedstockable,
      taxId: capturedtaxId ?? '',
      type: capturedtype ?? 00,
      unitId: capturedunitId ?? '',
      weightable: capturedweightable ?? '',
      purchasePrice: capturedpurchasePrice ?? 00,
      synC: capturedsynC ?? '',
      version: capturedversion ?? 0,
    );
    // **If the item is not deleted, add it to the list**

    if (!itemPreConvert.isDeleted) {
      itemFlowConverted.add(itemPreConvert);
    }

    // itemFlowConverted.add(itemPreConvert);
  }

  // this MAKES the most recent ITEM on top OF THE LIST PAGE...using 'reversed'
  itemFlowConverted = itemFlowConverted.reversed.toList();
  print('sk$itemFlowConverted');
  return itemFlowConverted;
}
