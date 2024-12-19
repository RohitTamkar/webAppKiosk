// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductListStockStruct extends FFFirebaseStruct {
  ProductListStockStruct({
    String? name,
    double? currentStock,
    int? code,
    double? reqStock,
    DocumentReference? ref,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _currentStock = currentStock,
        _code = code,
        _reqStock = reqStock,
        _ref = ref,
        _id = id,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "currentStock" field.
  double? _currentStock;
  double get currentStock => _currentStock ?? 0.0;
  set currentStock(double? val) => _currentStock = val;

  void incrementCurrentStock(double amount) =>
      currentStock = currentStock + amount;

  bool hasCurrentStock() => _currentStock != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "reqStock" field.
  double? _reqStock;
  double get reqStock => _reqStock ?? 0.0;
  set reqStock(double? val) => _reqStock = val;

  void incrementReqStock(double amount) => reqStock = reqStock + amount;

  bool hasReqStock() => _reqStock != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;

  bool hasRef() => _ref != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static ProductListStockStruct fromMap(Map<String, dynamic> data) =>
      ProductListStockStruct(
        name: data['name'] as String?,
        currentStock: castToType<double>(data['currentStock']),
        code: castToType<int>(data['code']),
        reqStock: castToType<double>(data['reqStock']),
        ref: data['ref'] as DocumentReference?,
        id: data['id'] as String?,
      );

  static ProductListStockStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductListStockStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'currentStock': _currentStock,
        'code': _code,
        'reqStock': _reqStock,
        'ref': _ref,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'currentStock': serializeParam(
          _currentStock,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'reqStock': serializeParam(
          _reqStock,
          ParamType.double,
        ),
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductListStockStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductListStockStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        currentStock: deserializeParam(
          data['currentStock'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        reqStock: deserializeParam(
          data['reqStock'],
          ParamType.double,
          false,
        ),
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['OUTLET', 'PRODUCT'],
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductListStockStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductListStockStruct &&
        name == other.name &&
        currentStock == other.currentStock &&
        code == other.code &&
        reqStock == other.reqStock &&
        ref == other.ref &&
        id == other.id;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, currentStock, code, reqStock, ref, id]);
}

ProductListStockStruct createProductListStockStruct({
  String? name,
  double? currentStock,
  int? code,
  double? reqStock,
  DocumentReference? ref,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductListStockStruct(
      name: name,
      currentStock: currentStock,
      code: code,
      reqStock: reqStock,
      ref: ref,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductListStockStruct? updateProductListStockStruct(
  ProductListStockStruct? productListStock, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productListStock
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductListStockStructData(
  Map<String, dynamic> firestoreData,
  ProductListStockStruct? productListStock,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productListStock == null) {
    return;
  }
  if (productListStock.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productListStock.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productListStockData =
      getProductListStockFirestoreData(productListStock, forFieldValue);
  final nestedData =
      productListStockData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productListStock.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductListStockFirestoreData(
  ProductListStockStruct? productListStock, [
  bool forFieldValue = false,
]) {
  if (productListStock == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productListStock.toMap());

  // Add any Firestore field values
  productListStock.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListStockListFirestoreData(
  List<ProductListStockStruct>? productListStocks,
) =>
    productListStocks
        ?.map((e) => getProductListStockFirestoreData(e, true))
        .toList() ??
    [];
