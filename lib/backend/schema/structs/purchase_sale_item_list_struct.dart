// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchaseSaleItemListStruct extends FFFirebaseStruct {
  PurchaseSaleItemListStruct({
    String? name,
    double? quantity,
    double? price,
    String? id,
    String? catId,
    double? discount,
    double? delliveryChrg,
    int? total,
    int? acceptedQty,
    int? rejectedQty,
    String? note,
    String? mfgDate,
    String? expDate,
    String? barcode,
    double? mrpPrice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _quantity = quantity,
        _price = price,
        _id = id,
        _catId = catId,
        _discount = discount,
        _delliveryChrg = delliveryChrg,
        _total = total,
        _acceptedQty = acceptedQty,
        _rejectedQty = rejectedQty,
        _note = note,
        _mfgDate = mfgDate,
        _expDate = expDate,
        _barcode = barcode,
        _mrpPrice = mrpPrice,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "catId" field.
  String? _catId;
  String get catId => _catId ?? '';
  set catId(String? val) => _catId = val;

  bool hasCatId() => _catId != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  set discount(double? val) => _discount = val;

  void incrementDiscount(double amount) => discount = discount + amount;

  bool hasDiscount() => _discount != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  set delliveryChrg(double? val) => _delliveryChrg = val;

  void incrementDelliveryChrg(double amount) =>
      delliveryChrg = delliveryChrg + amount;

  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "acceptedQty" field.
  int? _acceptedQty;
  int get acceptedQty => _acceptedQty ?? 0;
  set acceptedQty(int? val) => _acceptedQty = val;

  void incrementAcceptedQty(int amount) => acceptedQty = acceptedQty + amount;

  bool hasAcceptedQty() => _acceptedQty != null;

  // "rejectedQty" field.
  int? _rejectedQty;
  int get rejectedQty => _rejectedQty ?? 0;
  set rejectedQty(int? val) => _rejectedQty = val;

  void incrementRejectedQty(int amount) => rejectedQty = rejectedQty + amount;

  bool hasRejectedQty() => _rejectedQty != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "mfgDate" field.
  String? _mfgDate;
  String get mfgDate => _mfgDate ?? '';
  set mfgDate(String? val) => _mfgDate = val;

  bool hasMfgDate() => _mfgDate != null;

  // "expDate" field.
  String? _expDate;
  String get expDate => _expDate ?? '';
  set expDate(String? val) => _expDate = val;

  bool hasExpDate() => _expDate != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;

  bool hasBarcode() => _barcode != null;

  // "mrpPrice" field.
  double? _mrpPrice;
  double get mrpPrice => _mrpPrice ?? 0.0;
  set mrpPrice(double? val) => _mrpPrice = val;

  void incrementMrpPrice(double amount) => mrpPrice = mrpPrice + amount;

  bool hasMrpPrice() => _mrpPrice != null;

  static PurchaseSaleItemListStruct fromMap(Map<String, dynamic> data) =>
      PurchaseSaleItemListStruct(
        name: data['name'] as String?,
        quantity: castToType<double>(data['quantity']),
        price: castToType<double>(data['price']),
        id: data['id'] as String?,
        catId: data['catId'] as String?,
        discount: castToType<double>(data['discount']),
        delliveryChrg: castToType<double>(data['delliveryChrg']),
        total: castToType<int>(data['total']),
        acceptedQty: castToType<int>(data['acceptedQty']),
        rejectedQty: castToType<int>(data['rejectedQty']),
        note: data['note'] as String?,
        mfgDate: data['mfgDate'] as String?,
        expDate: data['expDate'] as String?,
        barcode: data['barcode'] as String?,
        mrpPrice: castToType<double>(data['mrpPrice']),
      );

  static PurchaseSaleItemListStruct? maybeFromMap(dynamic data) => data is Map
      ? PurchaseSaleItemListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'quantity': _quantity,
        'price': _price,
        'id': _id,
        'catId': _catId,
        'discount': _discount,
        'delliveryChrg': _delliveryChrg,
        'total': _total,
        'acceptedQty': _acceptedQty,
        'rejectedQty': _rejectedQty,
        'note': _note,
        'mfgDate': _mfgDate,
        'expDate': _expDate,
        'barcode': _barcode,
        'mrpPrice': _mrpPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'catId': serializeParam(
          _catId,
          ParamType.String,
        ),
        'discount': serializeParam(
          _discount,
          ParamType.double,
        ),
        'delliveryChrg': serializeParam(
          _delliveryChrg,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'acceptedQty': serializeParam(
          _acceptedQty,
          ParamType.int,
        ),
        'rejectedQty': serializeParam(
          _rejectedQty,
          ParamType.int,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'mfgDate': serializeParam(
          _mfgDate,
          ParamType.String,
        ),
        'expDate': serializeParam(
          _expDate,
          ParamType.String,
        ),
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'mrpPrice': serializeParam(
          _mrpPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static PurchaseSaleItemListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PurchaseSaleItemListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['catId'],
          ParamType.String,
          false,
        ),
        discount: deserializeParam(
          data['discount'],
          ParamType.double,
          false,
        ),
        delliveryChrg: deserializeParam(
          data['delliveryChrg'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        acceptedQty: deserializeParam(
          data['acceptedQty'],
          ParamType.int,
          false,
        ),
        rejectedQty: deserializeParam(
          data['rejectedQty'],
          ParamType.int,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        mfgDate: deserializeParam(
          data['mfgDate'],
          ParamType.String,
          false,
        ),
        expDate: deserializeParam(
          data['expDate'],
          ParamType.String,
          false,
        ),
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        mrpPrice: deserializeParam(
          data['mrpPrice'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PurchaseSaleItemListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchaseSaleItemListStruct &&
        name == other.name &&
        quantity == other.quantity &&
        price == other.price &&
        id == other.id &&
        catId == other.catId &&
        discount == other.discount &&
        delliveryChrg == other.delliveryChrg &&
        total == other.total &&
        acceptedQty == other.acceptedQty &&
        rejectedQty == other.rejectedQty &&
        note == other.note &&
        mfgDate == other.mfgDate &&
        expDate == other.expDate &&
        barcode == other.barcode &&
        mrpPrice == other.mrpPrice;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        quantity,
        price,
        id,
        catId,
        discount,
        delliveryChrg,
        total,
        acceptedQty,
        rejectedQty,
        note,
        mfgDate,
        expDate,
        barcode,
        mrpPrice
      ]);
}

PurchaseSaleItemListStruct createPurchaseSaleItemListStruct({
  String? name,
  double? quantity,
  double? price,
  String? id,
  String? catId,
  double? discount,
  double? delliveryChrg,
  int? total,
  int? acceptedQty,
  int? rejectedQty,
  String? note,
  String? mfgDate,
  String? expDate,
  String? barcode,
  double? mrpPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurchaseSaleItemListStruct(
      name: name,
      quantity: quantity,
      price: price,
      id: id,
      catId: catId,
      discount: discount,
      delliveryChrg: delliveryChrg,
      total: total,
      acceptedQty: acceptedQty,
      rejectedQty: rejectedQty,
      note: note,
      mfgDate: mfgDate,
      expDate: expDate,
      barcode: barcode,
      mrpPrice: mrpPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurchaseSaleItemListStruct? updatePurchaseSaleItemListStruct(
  PurchaseSaleItemListStruct? purchaseSaleItemList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchaseSaleItemList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchaseSaleItemListStructData(
  Map<String, dynamic> firestoreData,
  PurchaseSaleItemListStruct? purchaseSaleItemList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchaseSaleItemList == null) {
    return;
  }
  if (purchaseSaleItemList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purchaseSaleItemList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchaseSaleItemListData =
      getPurchaseSaleItemListFirestoreData(purchaseSaleItemList, forFieldValue);
  final nestedData =
      purchaseSaleItemListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      purchaseSaleItemList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchaseSaleItemListFirestoreData(
  PurchaseSaleItemListStruct? purchaseSaleItemList, [
  bool forFieldValue = false,
]) {
  if (purchaseSaleItemList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchaseSaleItemList.toMap());

  // Add any Firestore field values
  purchaseSaleItemList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchaseSaleItemListListFirestoreData(
  List<PurchaseSaleItemListStruct>? purchaseSaleItemLists,
) =>
    purchaseSaleItemLists
        ?.map((e) => getPurchaseSaleItemListFirestoreData(e, true))
        .toList() ??
    [];
