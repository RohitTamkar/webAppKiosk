// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryStructStruct extends FFFirebaseStruct {
  CategoryStructStruct({
    int? categoryNo,
    String? id,
    String? name,
    int? code,
    String? categoryId,
    int? type,
    bool? isDeleted,
    bool? synC,
    int? version,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryNo = categoryNo,
        _id = id,
        _name = name,
        _code = code,
        _categoryId = categoryId,
        _type = type,
        _isDeleted = isDeleted,
        _synC = synC,
        _version = version,
        super(firestoreUtilData);

  // "categoryNo" field.
  int? _categoryNo;
  int get categoryNo => _categoryNo ?? 0;
  set categoryNo(int? val) => _categoryNo = val;

  void incrementCategoryNo(int amount) => categoryNo = categoryNo + amount;

  bool hasCategoryNo() => _categoryNo != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  set categoryId(String? val) => _categoryId = val;

  bool hasCategoryId() => _categoryId != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "synC" field.
  bool? _synC;
  bool get synC => _synC ?? false;
  set synC(bool? val) => _synC = val;

  bool hasSynC() => _synC != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  set version(int? val) => _version = val;

  void incrementVersion(int amount) => version = version + amount;

  bool hasVersion() => _version != null;

  static CategoryStructStruct fromMap(Map<String, dynamic> data) =>
      CategoryStructStruct(
        categoryNo: castToType<int>(data['categoryNo']),
        id: data['id'] as String?,
        name: data['name'] as String?,
        code: castToType<int>(data['code']),
        categoryId: data['categoryId'] as String?,
        type: castToType<int>(data['type']),
        isDeleted: data['isDeleted'] as bool?,
        synC: data['synC'] as bool?,
        version: castToType<int>(data['version']),
      );

  static CategoryStructStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoryStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoryNo': _categoryNo,
        'id': _id,
        'name': _name,
        'code': _code,
        'categoryId': _categoryId,
        'type': _type,
        'isDeleted': _isDeleted,
        'synC': _synC,
        'version': _version,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoryNo': serializeParam(
          _categoryNo,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'categoryId': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'synC': serializeParam(
          _synC,
          ParamType.bool,
        ),
        'version': serializeParam(
          _version,
          ParamType.int,
        ),
      }.withoutNulls;

  static CategoryStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoryStructStruct(
        categoryNo: deserializeParam(
          data['categoryNo'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        categoryId: deserializeParam(
          data['categoryId'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        synC: deserializeParam(
          data['synC'],
          ParamType.bool,
          false,
        ),
        version: deserializeParam(
          data['version'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CategoryStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryStructStruct &&
        categoryNo == other.categoryNo &&
        id == other.id &&
        name == other.name &&
        code == other.code &&
        categoryId == other.categoryId &&
        type == other.type &&
        isDeleted == other.isDeleted &&
        synC == other.synC &&
        version == other.version;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [categoryNo, id, name, code, categoryId, type, isDeleted, synC, version]);
}

CategoryStructStruct createCategoryStructStruct({
  int? categoryNo,
  String? id,
  String? name,
  int? code,
  String? categoryId,
  int? type,
  bool? isDeleted,
  bool? synC,
  int? version,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryStructStruct(
      categoryNo: categoryNo,
      id: id,
      name: name,
      code: code,
      categoryId: categoryId,
      type: type,
      isDeleted: isDeleted,
      synC: synC,
      version: version,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoryStructStruct? updateCategoryStructStruct(
  CategoryStructStruct? categoryStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categoryStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryStructStructData(
  Map<String, dynamic> firestoreData,
  CategoryStructStruct? categoryStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categoryStruct == null) {
    return;
  }
  if (categoryStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categoryStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryStructData =
      getCategoryStructFirestoreData(categoryStruct, forFieldValue);
  final nestedData =
      categoryStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categoryStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryStructFirestoreData(
  CategoryStructStruct? categoryStruct, [
  bool forFieldValue = false,
]) {
  if (categoryStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categoryStruct.toMap());

  // Add any Firestore field values
  categoryStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryStructListFirestoreData(
  List<CategoryStructStruct>? categoryStructs,
) =>
    categoryStructs
        ?.map((e) => getCategoryStructFirestoreData(e, true))
        .toList() ??
    [];
