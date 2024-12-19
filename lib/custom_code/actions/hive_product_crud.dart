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

Future<ProductStructStruct> hiveProductCrud(
  int? hivekey,
  ProductStructStruct? itemBlob,
  String actionType,
) async {
  productBox = await Hive.openBox<ProductStructStruct>('product');

  hivekey = hivekey ?? 999;

  if (itemBlob == null) {
    itemBlob = createProductStructStruct(
      barcode: '',
      category: '',
      categoryId: '',
      code: 00,
      discountAmt: 00.0,
      discountPer: 00.0,
      hsncode: 00,
      id: '',
      imageUrl: '',
      isDeleted: false,
      mrpPrice: 00.0,
      name: '',
      price: 00.0,
      productMasterId: '',
      recipeId: '',
      recipeRefId: '',
      regionalName: '',
      reorderLevel: 00,
      searchcode: 00,
      sellingPrice: 00.0,
      serviceOutletId: '',
      shortName: '',
      stock: 00,
      stockable: false,
      taxId: '',
      type: 00,
      unitId: '',
      weightable: false,
      purchasePrice: 00.0,
      synC: false,
      version: 1,
    );
  }

  // add the new item into the Hive box
  switch (actionType) {
    case 'update':
      ProductStructStruct returningData = itemBlob;
      print('hi$returningData.productName');
      await productBox.put(
        returningData.hivekey,
        ProductStructStruct(
          barcode: returningData.barcode,
          category: returningData.category,
          categoryId: returningData.categoryId,
          code: returningData.code,
          discountAmt: returningData.discountAmt,
          discountPer: returningData.discountPer,
          hsncode: returningData.hsncode,
          id: returningData.id,
          imageUrl: returningData.imageUrl,
          isDeleted: returningData.isDeleted,
          keywords: returningData.keywords,
          mrpPrice: returningData.mrpPrice,
          name: returningData.name,
          price: returningData.price,
          productMasterId: returningData.productMasterId,
          recipeId: returningData.recipeId,
          recipeRefId: returningData.recipeRefId,
          regionalName: returningData.regionalName,
          reorderLevel: returningData.reorderLevel,
          searchcode: returningData.searchcode,
          sellingPrice: returningData.sellingPrice,
          serviceOutletId: returningData.serviceOutletId,
          shortName: returningData.shortName,
          stock: returningData.stock,
          stockable: returningData.stockable,
          taxId: returningData.taxId,
          type: returningData.type,
          unitId: returningData.unitId,
          weightable: returningData.weightable,
          purchasePrice: returningData.purchasePrice,
          synC: returningData.synC,
          version: returningData.version,
        ),
      );
      return returningData;
      break;
    case 'create':
      ProductStructStruct returningData = itemBlob;
      await productBox.add(
        ProductStructStruct(
          barcode: returningData.barcode,
          category: returningData.category,
          categoryId: returningData.categoryId,
          code: returningData.code,
          discountAmt: returningData.discountAmt,
          discountPer: returningData.discountPer,
          hsncode: returningData.hsncode,
          id: returningData.id,
          imageUrl: returningData.imageUrl,
          isDeleted: returningData.isDeleted,
          keywords: returningData.keywords,
          mrpPrice: returningData.mrpPrice,
          name: returningData.name,
          price: returningData.price,
          productMasterId: returningData.productMasterId,
          recipeId: returningData.recipeId,
          recipeRefId: returningData.recipeRefId,
          regionalName: returningData.regionalName,
          reorderLevel: returningData.reorderLevel,
          searchcode: returningData.searchcode,
          sellingPrice: returningData.sellingPrice,
          serviceOutletId: returningData.serviceOutletId,
          shortName: returningData.shortName,
          stock: returningData.stock,
          stockable: returningData.stockable,
          taxId: returningData.taxId,
          type: returningData.type,
          unitId: returningData.unitId,
          weightable: returningData.weightable,
          purchasePrice: returningData.purchasePrice,
          synC: returningData.synC,
          version: returningData.version,
        ),
      );
      return returningData;
      break;
    case 'delete':
      await productBox.delete(hivekey);
      break;
    case 'get':
      ProductStructStruct? itemBlob = await productBox.get(hivekey);
      if (itemBlob != null) {
        return itemBlob;
      } else {
        return ProductStructStruct(
          hivekey: hivekey,
        );
      }

      break;
    default:
      throw Exception('Unsupported action type: $actionType');
  }
  return itemBlob;
}
