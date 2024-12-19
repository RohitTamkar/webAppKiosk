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

late Box productBox; //this is the tricky from video itemBox
late Box catgoryBox;
late Box invoiceBox;
late Box shiftDetailBox;
// In Flutter apps, this portion is generated using Build Runner and Hive Generator
// to make a file named item.g.dart which is included in the above class.  I had to hand code this.

class CategoryAdapter extends TypeAdapter<CategoryStructStruct> {
  @override
  final typeId = 0;

  @override
  CategoryStructStruct read(BinaryReader reader) {
    return CategoryStructStruct(
      categoryNo: reader.read(),
      id: reader.read(),
      name: reader.read(),
      code: reader.read(),
      categoryId: reader.read(),
      type: reader.read(),
      isDeleted: reader.read(),
      synC: reader.read(),
      version: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryStructStruct obj) {
    writer.write(obj.categoryNo);
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.code);
    writer.write(obj.categoryId);
    writer.write(obj.type);
    writer.write(obj.isDeleted);
    writer.write(obj.synC);
    writer.write(obj.version);
  }
}

class ProductAdapter extends TypeAdapter<ProductStructStruct> {
  @override
  final typeId = 1;

  @override
  ProductStructStruct read(BinaryReader reader) {
    return ProductStructStruct(
      barcode: reader.read(),
      category: reader.read(),
      categoryId: reader.read(),
      code: reader.read(),
      discountAmt: reader.read(),
      discountPer: reader.read(),
      hsncode: reader.read(),
      id: reader.read(),
      imageUrl: reader.read(),
      isDeleted: reader.read(),
      keywords: reader.read(),
      mrpPrice: reader.read(),
      name: reader.read(),
      price: reader.read(),
      productMasterId: reader.read(),
      purchasePrice: reader.read(),
      recipeId: reader.read(),
      recipeRefId: reader.read(),
      regionalName: reader.read(),
      reorderLevel: reader.read(),
      searchcode: reader.read(),
      sellingPrice: reader.read(),
      serviceOutletId: reader.read(),
      shortName: reader.read(),
      stock: reader.read(),
      stockable: reader.read(),
      taxId: reader.read(),
      type: reader.read(),
      unitId: reader.read(),
      weightable: reader.read(),
      synC: reader.read(),
      version: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductStructStruct obj) {
    writer.write(obj.barcode);
    writer.write(obj.category);
    writer.write(obj.categoryId);
    writer.write(obj.code);
    writer.write(obj.discountAmt);
    writer.write(obj.discountPer);
    writer.write(obj.hsncode);
    writer.write(obj.id);
    writer.write(obj.imageUrl);
    writer.write(obj.isDeleted);
    writer.write(obj.keywords);
    writer.write(obj.mrpPrice);
    writer.write(obj.name);
    writer.write(obj.price);
    writer.write(obj.productMasterId);
    writer.write(obj.purchasePrice);
    writer.write(obj.recipeId);
    writer.write(obj.recipeRefId);
    writer.write(obj.regionalName);
    writer.write(obj.reorderLevel);
    writer.write(obj.searchcode);
    writer.write(obj.sellingPrice);
    writer.write(obj.serviceOutletId);
    writer.write(obj.shortName);
    writer.write(obj.stock);
    writer.write(obj.stockable);
    writer.write(obj.taxId);
    writer.write(obj.type);
    writer.write(obj.unitId);
    writer.write(obj.weightable);
    writer.write(obj.synC);
    writer.write(obj.version);
  }
}

class SelItemListAdapter extends TypeAdapter<SelItemListStruct> {
  @override
  final typeId = 2; // Use a different typeId for Items2Struct

  @override
  SelItemListStruct read(BinaryReader reader) {
    return SelItemListStruct(
      id: reader.read(),
      name: reader.read(),
      catId: reader.read(),
      isDeletedItem: reader.read(),
      price: reader.read(),
      quantity: reader.read(),
      total: reader.read(),
      taxId: reader.read(),
      taxAmt: reader.read(),
      taxPer: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, SelItemListStruct obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.catId);
    writer.write(obj.isDeletedItem);
    writer.write(obj.price);
    writer.write(obj.quantity);
    writer.write(obj.total);
    writer.write(obj.taxId);
    writer.write(obj.taxAmt);
    writer.write(obj.taxPer);
  }
}

class InvoiceAdapter extends TypeAdapter<InvoiceStructStruct> {
  @override
  final typeId = 3;

  @override
  InvoiceStructStruct read(BinaryReader reader) {
    return InvoiceStructStruct(
      id: reader.read(),
      invoice: reader.read(),
      party: reader.read(),
      products: reader.read(),
      invoiceDate: reader.read(),
      paymentMode: reader.read(),
      dayId: reader.read(),
      discountAmt: reader.read(),
      discountPer: reader.read(),
      delliveryChrg: reader.read(),
      taxAmt: reader.read(),
      billAmt: reader.read(),
      finalBillAmt: reader.read(),
      createdDate: reader.read(),
      updatedDate: reader.read(),
      roundOff: reader.read(),
      updatedBy: reader.read(),
      code: reader.read(),
      shiftId: reader.read(),
      partyMobNo: reader.read(),
      productList: convertDynamicToSelItemListStruct(reader.read()),
      createdBy: reader.read(),
      synC: reader.read(),
      version: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, InvoiceStructStruct obj) {
    writer.write(obj.id);
    writer.write(obj.invoice);
    writer.write(obj.party);
    writer.write(obj.products);
    writer.write(obj.invoiceDate);
    writer.write(obj.paymentMode);
    writer.write(obj.dayId);
    writer.write(obj.discountAmt);
    writer.write(obj.discountPer);
    writer.write(obj.delliveryChrg);

    writer.write(obj.taxAmt);

    writer.write(obj.billAmt);
    writer.write(obj.finalBillAmt);
    writer.write(obj.createdDate);
    writer.write(obj.updatedDate);
    writer.write(obj.roundOff);
    writer.write(obj.updatedBy);
    writer.write(obj.code);
    writer.write(obj.shiftId);
    writer.write(obj.partyMobNo);

    writer.write(obj.productList);
    writer.write(obj.createdBy);
    writer.write(obj.synC);
    writer.write(obj.version);
  }
}

List<SelItemListStruct> convertDynamicToSelItemListStruct(
    List<dynamic> dynamicList) {
  List<SelItemListStruct> items2StructList = [];
  for (var dynamicObject in dynamicList) {
    items2StructList.add(SelItemListStruct(
      id: dynamicObject.id,
      name: dynamicObject.name,
      catId: dynamicObject.catId,
      isDeletedItem: dynamicObject.isDeletedItem,
      price: dynamicObject.price,
      quantity: dynamicObject.quantity,
      total: dynamicObject.total,
      taxId: dynamicObject.taxId,
      taxAmt: dynamicObject.taxAmt,
      taxPer: dynamicObject.taxPer,
    ));
  }
  return items2StructList;
}

class ShiftAdapter extends TypeAdapter<ShiftDetailsStruct> {
  @override
  final typeId = 4;

  @override
  ShiftDetailsStruct read(BinaryReader reader) {
    return ShiftDetailsStruct(
      id: reader.read(),
      billCount: reader.read(),
      dayId: reader.read(),
      lastBillNo: reader.read(),
      lastBillTime: reader.read(),
      tax: reader.read(),
      deliveryCharges: reader.read(),
      code: reader.read(),
      endTime: reader.read(),
      advanceAmtTotal: reader.read(),
      customerReciveAmtTotal: reader.read(),
      discount: reader.read(),
      expensesAmtTotal: reader.read(),
      openingAmt: reader.read(),
      receiveAmtTotal: reader.read(),
      refoundAmount: reader.read(),
      totalSale: reader.read(),
      roundOff: reader.read(),
      cashInHand: reader.read(),
      cashSale: reader.read(),
      startTime: reader.read(),
      inActive: reader.read(),
      shiftNo: reader.read(),
      subTotalBill: reader.read(),
      userId: reader.read(),
      deviceId: reader.read(),
      paymentJson: reader.read(),
      productSaleList: convertDynamicToSelItemListStruct(reader.read()),
      shiftId: reader.read(),
      newIDShift: reader.read(),
      synC: reader.read(),
      version: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ShiftDetailsStruct obj) {
    writer.write(obj.id);
    writer.write(obj.billCount);
    writer.write(obj.dayId);
    writer.write(obj.lastBillNo);
    writer.write(obj.lastBillTime);
    writer.write(obj.tax);
    writer.write(obj.deliveryCharges);
    writer.write(obj.code);
    writer.write(obj.endTime);
    writer.write(obj.advanceAmtTotal);
    writer.write(obj.customerReciveAmtTotal);
    writer.write(obj.discount);
    writer.write(obj.expensesAmtTotal);
    writer.write(obj.openingAmt);
    writer.write(obj.receiveAmtTotal);
    writer.write(obj.refoundAmount);
    writer.write(obj.totalSale);
    writer.write(obj.roundOff);
    writer.write(obj.cashInHand);
    writer.write(obj.cashSale);
    writer.write(obj.startTime);
    writer.write(obj.inActive);
    writer.write(obj.shiftNo);
    writer.write(obj.subTotalBill);
    writer.write(obj.userId);
    writer.write(obj.deviceId);
    writer.write(obj.paymentJson);
    writer.write(obj.productSaleList);
    writer.write(obj.shiftId);
    writer.write(obj.newIDShift);
    writer.write(obj.synC);
    writer.write(obj.version);
  }
}

Future setupItemHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductAdapter());
  productBox = await Hive.openBox<ProductStructStruct>('product');

  Hive.registerAdapter(CategoryAdapter());
  catgoryBox = await Hive.openBox<CategoryStructStruct>('catagory');

  Hive.registerAdapter(SelItemListAdapter());
  Hive.registerAdapter(InvoiceAdapter());
  invoiceBox = await Hive.openBox<InvoiceStructStruct>('invoice');

  Hive.registerAdapter(ShiftAdapter());
  shiftDetailBox = await Hive.openBox<ShiftDetailsStruct>('shiftDetails');
}
