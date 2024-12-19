// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShrikantProductStruct extends FFFirebaseStruct {
  ShrikantProductStruct({
    String? productName,
    int? id,
    String? category,
    String? productimage,
    double? price,
    double? qty,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productName = productName,
        _id = id,
        _category = category,
        _productimage = productimage,
        _price = price,
        _qty = qty,
        super(firestoreUtilData);

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;

  bool hasProductName() => _productName != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "productimage" field.
  String? _productimage;
  String get productimage => _productimage ?? '';
  set productimage(String? val) => _productimage = val;

  bool hasProductimage() => _productimage != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "qty" field.
  double? _qty;
  double get qty => _qty ?? 0.0;
  set qty(double? val) => _qty = val;

  void incrementQty(double amount) => qty = qty + amount;

  bool hasQty() => _qty != null;

  static ShrikantProductStruct fromMap(Map<String, dynamic> data) =>
      ShrikantProductStruct(
        productName: data['productName'] as String?,
        id: castToType<int>(data['id']),
        category: data['category'] as String?,
        productimage: data['productimage'] as String?,
        price: castToType<double>(data['price']),
        qty: castToType<double>(data['qty']),
      );

  static ShrikantProductStruct? maybeFromMap(dynamic data) => data is Map
      ? ShrikantProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'productName': _productName,
        'id': _id,
        'category': _category,
        'productimage': _productimage,
        'price': _price,
        'qty': _qty,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'productName': serializeParam(
          _productName,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'productimage': serializeParam(
          _productimage,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'qty': serializeParam(
          _qty,
          ParamType.double,
        ),
      }.withoutNulls;

  static ShrikantProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShrikantProductStruct(
        productName: deserializeParam(
          data['productName'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        productimage: deserializeParam(
          data['productimage'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        qty: deserializeParam(
          data['qty'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ShrikantProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShrikantProductStruct &&
        productName == other.productName &&
        id == other.id &&
        category == other.category &&
        productimage == other.productimage &&
        price == other.price &&
        qty == other.qty;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([productName, id, category, productimage, price, qty]);
}

ShrikantProductStruct createShrikantProductStruct({
  String? productName,
  int? id,
  String? category,
  String? productimage,
  double? price,
  double? qty,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShrikantProductStruct(
      productName: productName,
      id: id,
      category: category,
      productimage: productimage,
      price: price,
      qty: qty,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShrikantProductStruct? updateShrikantProductStruct(
  ShrikantProductStruct? shrikantProduct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shrikantProduct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShrikantProductStructData(
  Map<String, dynamic> firestoreData,
  ShrikantProductStruct? shrikantProduct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shrikantProduct == null) {
    return;
  }
  if (shrikantProduct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shrikantProduct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shrikantProductData =
      getShrikantProductFirestoreData(shrikantProduct, forFieldValue);
  final nestedData =
      shrikantProductData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shrikantProduct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShrikantProductFirestoreData(
  ShrikantProductStruct? shrikantProduct, [
  bool forFieldValue = false,
]) {
  if (shrikantProduct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shrikantProduct.toMap());

  // Add any Firestore field values
  shrikantProduct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShrikantProductListFirestoreData(
  List<ShrikantProductStruct>? shrikantProducts,
) =>
    shrikantProducts
        ?.map((e) => getShrikantProductFirestoreData(e, true))
        .toList() ??
    [];
