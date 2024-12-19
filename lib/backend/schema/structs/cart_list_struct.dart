// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartListStruct extends FFFirebaseStruct {
  CartListStruct({
    String? name,
    double? currentStock,
    DateTime? date,
    String? note,
    double? addedStock,
    int? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _currentStock = currentStock,
        _date = date,
        _note = note,
        _addedStock = addedStock,
        _code = code,
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

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "addedStock" field.
  double? _addedStock;
  double get addedStock => _addedStock ?? 0.0;
  set addedStock(double? val) => _addedStock = val;

  void incrementAddedStock(double amount) => addedStock = addedStock + amount;

  bool hasAddedStock() => _addedStock != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  static CartListStruct fromMap(Map<String, dynamic> data) => CartListStruct(
        name: data['name'] as String?,
        currentStock: castToType<double>(data['currentStock']),
        date: data['date'] as DateTime?,
        note: data['note'] as String?,
        addedStock: castToType<double>(data['addedStock']),
        code: castToType<int>(data['code']),
      );

  static CartListStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'currentStock': _currentStock,
        'date': _date,
        'note': _note,
        'addedStock': _addedStock,
        'code': _code,
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
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'addedStock': serializeParam(
          _addedStock,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartListStruct(
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
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        addedStock: deserializeParam(
          data['addedStock'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CartListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartListStruct &&
        name == other.name &&
        currentStock == other.currentStock &&
        date == other.date &&
        note == other.note &&
        addedStock == other.addedStock &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, currentStock, date, note, addedStock, code]);
}

CartListStruct createCartListStruct({
  String? name,
  double? currentStock,
  DateTime? date,
  String? note,
  double? addedStock,
  int? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartListStruct(
      name: name,
      currentStock: currentStock,
      date: date,
      note: note,
      addedStock: addedStock,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartListStruct? updateCartListStruct(
  CartListStruct? cartList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartListStructData(
  Map<String, dynamic> firestoreData,
  CartListStruct? cartList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartList == null) {
    return;
  }
  if (cartList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartListData = getCartListFirestoreData(cartList, forFieldValue);
  final nestedData = cartListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartListFirestoreData(
  CartListStruct? cartList, [
  bool forFieldValue = false,
]) {
  if (cartList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartList.toMap());

  // Add any Firestore field values
  cartList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartListListFirestoreData(
  List<CartListStruct>? cartLists,
) =>
    cartLists?.map((e) => getCartListFirestoreData(e, true)).toList() ?? [];
