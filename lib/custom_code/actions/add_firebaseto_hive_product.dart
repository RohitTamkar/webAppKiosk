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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
// Begin custom widget code

import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'setup_item_hive.dart';

import 'dart:async';

import 'dart:isolate';

// Assuming you're using the Firebase Web SDK
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> addFirebasetoHiveProduct(List<ProductRecord> product) async {
  int ind = 0;
  try {
    for (var data in product) {
      String barcode = data.barcode ?? '';
      String category = data.category ?? '';
      String? categoryId = data.categoryRef?.id;
      int code = data.code ?? 00;
      double discountAmt = data.discountAmt ?? 00.0;
      double discountPer = data.discountPer ?? 00.0;
      int hsncode = data.hsncode ?? 00;
      String id = data.id ?? '';
      String imageUrl = data.imageUrl ?? '';
      bool isDeleted = data.isDeleted ?? false;
      Object keywords = data.keywords ?? '';
      double mrpPrice = data.mrpPrice ?? 00.0;
      String name = data.name ?? '';
      double price = data.price ?? 00.0;
      String? productMasterId = data.productMasterRef?.id;
      String? recipeId = data.recipeId ?? '';
      String? recipeRefId = data.recipeRef?.id;
      String regionalName = data.regionalName ?? '';
      int reorderLevel = data.reorderLevel ?? 00;
      int searchcode = data.searchcode ?? 00;
      double sellingPrice = data.sellingPrice ?? 00.0;
      String? serviceOutletId = data.serviceRefId ?? '';
      String shortName = data.shortName ?? '';
      int stock = data.currentStock ?? 00;
      bool stockable = data.stockable ?? false;
      String? taxId = data.taxRef?.id;
      int type = data.type ?? 00;
      String? unitId = data.unitRef?.id;
      bool weightable = data.weightable ?? false;
      double purchasePrice = data.purchasePrice ?? 00.0;

      ProductStructStruct? existingItem;
      bool itemExist = false;
      bool synC = false;
      int version = 1;
      int index = 0;

      for (var item in productBox.values) {
        if (item.id == id) {
          existingItem = item;
          itemExist = true;
          break;
        }
        index++;
      }

      FFAppState().startLoop = ind++;
      print('FFAppState().startLoop');
      print(FFAppState().startLoop);

      if (itemExist) {
        // Update the existing product
        print('update');
        existingItem?.barcode = barcode;
        existingItem?.category = category;
        existingItem?.categoryId = categoryId;
        existingItem?.code = code;
        existingItem?.discountAmt = discountAmt;
        existingItem?.discountPer = discountPer;
        existingItem?.hsncode = hsncode;
        existingItem?.id = id;
        existingItem?.imageUrl = imageUrl;
        existingItem?.isDeleted = isDeleted;
        existingItem?.keywords = (keywords as List<String>);
        existingItem?.mrpPrice = mrpPrice;
        existingItem?.name = name;
        existingItem?.price = price;
        existingItem?.productMasterId = productMasterId;
        existingItem?.purchasePrice = purchasePrice;
        existingItem?.recipeId = recipeId;
        existingItem?.recipeRefId = recipeRefId;
        existingItem?.regionalName = regionalName;
        existingItem?.reorderLevel = reorderLevel;
        existingItem?.searchcode = searchcode;
        existingItem?.sellingPrice = sellingPrice;
        existingItem?.serviceOutletId = serviceOutletId;
        existingItem?.shortName = shortName;
        existingItem?.stock = stock;
        existingItem?.stockable = stockable;
        existingItem?.taxId = taxId;
        existingItem?.type = type;
        existingItem?.unitId = unitId;
        existingItem?.weightable = weightable;
        existingItem?.version = version;

        productBox.putAt(
          index,
          ProductStructStruct(
              barcode: barcode,
              category: category,
              categoryId: categoryId,
              code: code,
              discountAmt: discountAmt,
              discountPer: discountPer,
              hsncode: hsncode,
              id: id,
              imageUrl: imageUrl,
              isDeleted: isDeleted,
              keywords: (keywords as List<String>?)!,
              mrpPrice: mrpPrice,
              name: name,
              price: price,
              productMasterId: productMasterId,
              purchasePrice: purchasePrice,
              recipeId: recipeId,
              recipeRefId: recipeRefId,
              regionalName: regionalName,
              reorderLevel: reorderLevel,
              searchcode: searchcode,
              sellingPrice: sellingPrice,
              serviceOutletId: serviceOutletId,
              shortName: shortName,
              stock: stock,
              stockable: stockable,
              taxId: taxId,
              type: type,
              unitId: unitId,
              weightable: weightable,
              synC: synC),
        );
      } else {
        // Add the new product
        print('add prd');
        productBox.add(ProductStructStruct(
            barcode: barcode,
            category: category,
            categoryId: categoryId,
            code: code,
            discountAmt: discountAmt,
            discountPer: discountPer,
            hsncode: hsncode,
            id: id,
            imageUrl: imageUrl,
            isDeleted: isDeleted,
            keywords: (keywords as List<String>?)!,
            mrpPrice: mrpPrice,
            name: name,
            price: price,
            productMasterId: productMasterId,
            purchasePrice: purchasePrice,
            recipeId: recipeId,
            recipeRefId: recipeRefId,
            regionalName: regionalName,
            reorderLevel: reorderLevel,
            searchcode: searchcode,
            sellingPrice: sellingPrice,
            serviceOutletId: serviceOutletId,
            shortName: shortName,
            stock: stock,
            stockable: stockable,
            taxId: taxId,
            type: type,
            unitId: unitId,
            weightable: weightable,
            synC: synC,
            version: version));
      }
    }
  } catch (e) {
    print('Error fetching or saving data: $e');
  }
  return ind;
}
