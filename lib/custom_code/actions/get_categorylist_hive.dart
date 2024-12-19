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

Future<List<CategoryStructStruct>?> getCategorylistHive() async {
  // Add your function code here!
  await catgoryBox;

  //how many items are in the hive box?
  final int boxcount = catgoryBox.length;

  List<CategoryStructStruct> itemFlowConverted = [];

  // for loop through the box and convert each item to <Item> datatype then into a list of <Item> datatypes
  for (int i = 0; i < boxcount; i++) {
    final dynamic key = catgoryBox.keyAt(i); // Use dynamic type for key
    final item = catgoryBox.getAt(i);
    var capturedname = item.name;
    var capturedcategoryNo = item.categoryNo;
    var capturedcategoryId = item.categoryId;
    var capturedcode = item.code;
    var capturedtype = item.type;
    var capturedid = item.id;
    var capturedisDeleted = item.isDeleted;
    var capturedsynC = item.synC;
    var capturedversion = item.version;

    // Check if key is a valid int
    int parsedKey = key is int ? key : 9999;

    CategoryStructStruct itemPreConvert = CategoryStructStruct(
      id: capturedid ?? '',
      name: capturedname ?? '',
      categoryNo: capturedcategoryNo ?? 00, //Assuming price is a double
      categoryId: capturedcategoryId ?? '',
      code: capturedcode ?? 00,
      type: capturedtype ?? 00,
      isDeleted: capturedisDeleted,
      synC: capturedsynC,
      version: capturedversion,
    );
    // **If the item is not deleted, add it to the list**

    if (!itemPreConvert.isDeleted) {
      itemFlowConverted.add(itemPreConvert);
    }

    // itemFlowConverted.add(itemPreConvert);
  }

  // this MAKES the most recent ITEM on top OF THE LIST PAGE...using 'reversed'
  itemFlowConverted = itemFlowConverted.reversed.toList();
  print(itemFlowConverted);
  return itemFlowConverted;
}
