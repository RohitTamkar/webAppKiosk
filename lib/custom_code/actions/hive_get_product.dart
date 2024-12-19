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

import 'package:hive_flutter/hive_flutter.dart';
import 'setup_item_hive.dart';

Future<ProductStructStruct> hiveGetProduct(int hivekey) async {
  // Add your function code here!
  await productBox;
  var daitem = productBox;

  // print('here is the item detail');
  // print(daitem.get(key));

  final item = productBox.get(hivekey);

  var capturedhivekey = hivekey;
  var capturedname = item.name;
  var capturedid = item.id;

  var capturedbarcode = item.barcode;
  var capturedcategory = item.category;
  var capturedcategoryId = item.categoryId;
  var capturedcode = item.code;
  var captureddiscountAmt = item.discountAmt;
  var captureddiscountPer = item.discountPer;
  var capturedhsncode = item.hsncode;
  var capturedimageUrl = item.imageUrl;
  var capturedisDeleted = item.isDeleted;
  var capturedkeywords = item.keywords;
  var capturedmrpPrice = item.mrpPrice;

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

  ProductStructStruct product = ProductStructStruct(
    hivekey: capturedhivekey ?? 9999,
    id: capturedid,
    barcode: capturedbarcode,
    category: capturedcategory,
    categoryId: capturedcategoryId,
    code: capturedcode,
    discountAmt: captureddiscountAmt,
    discountPer: captureddiscountPer,
    hsncode: capturedhsncode,
    imageUrl: capturedimageUrl,
    isDeleted: capturedisDeleted,
    keywords: capturedkeywords,
    mrpPrice: capturedmrpPrice,
    name: capturedname,
    price: capturedprice,
    productMasterId: capturedproductMasterId,
    recipeId: capturedrecipeId,
    recipeRefId: capturedrecipeRefId,
    regionalName: capturedregionalName,
    reorderLevel: capturedreorderLevel,
    searchcode: capturedsearchcode,
    sellingPrice: capturedsellingPrice,
    serviceOutletId: capturedserviceOutletId,
    shortName: capturedshortName,
    stock: capturedstock,
    stockable: capturedstockable,
    taxId: capturedtaxId,
    type: capturedtype,
    unitId: capturedunitId,
    weightable: capturedweightable,
    purchasePrice: capturedpurchasePrice,
    synC: capturedsynC,
    version: capturedversion,
  ); // if key is somehow null, it gets the id number 9999
  //print(product);
  return product;
}
