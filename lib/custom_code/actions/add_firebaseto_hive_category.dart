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

// Assuming you're using the Firebase Web SDK
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> addFirebasetoHiveCategory(List<CategoryRecord> category) async {
  int ind = 0;
  try {
    for (var data in category) {
      int categoryNo = data.categoryNo ?? 00;
      String name = (data.name ?? '');
      String? categoryId = data.categoryRf?.id;
      int code = (data.code ?? 00);
      int type = (data.type ?? 00);
      String id = (data.id ?? '');
      bool isDeleted = (data.isDeleted ?? false);

      CategoryStructStruct? existingItem;
      bool itemExist = false;
      bool synC = false;
      int version = 1;
      int index = 0;

      for (var item in catgoryBox.values) {
        if (item.name == name) {
          existingItem = item;
          itemExist = true;
          break;
        }
        index++;
      }
      ind = index;
      if (itemExist) {
        // Update the existing product
        print('update');
        existingItem!.categoryNo = categoryNo;
        existingItem!.name = name;
        existingItem!.categoryId = categoryId;
        existingItem!.code = code;
        existingItem!.type = type;
        existingItem!.id = id;
        existingItem!.isDeleted = isDeleted;
        existingItem!.synC = synC;
        existingItem!.version = version;

        catgoryBox.putAt(
          index,
          CategoryStructStruct(
              categoryNo: categoryNo,
              name: name,
              categoryId: categoryId,
              code: code,
              type: type,
              id: id,
              isDeleted: isDeleted,
              synC: synC,
              version: version),
        );
      } else {
        // Add the new product
        print('add category');
        catgoryBox.add(CategoryStructStruct(
            categoryNo: categoryNo,
            name: name,
            categoryId: categoryId,
            code: code,
            type: type,
            id: id,
            isDeleted: isDeleted,
            synC: synC,
            version: version));
      }
    }
  } catch (e) {
    print('Error fetching or saving data: $e');
  }
  return ind;
}
