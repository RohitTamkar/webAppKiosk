// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguageDataStruct extends FFFirebaseStruct {
  LanguageDataStruct({
    String? name,
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _title = title,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static LanguageDataStruct fromMap(Map<String, dynamic> data) =>
      LanguageDataStruct(
        name: data['name'] as String?,
        title: data['title'] as String?,
      );

  static LanguageDataStruct? maybeFromMap(dynamic data) => data is Map
      ? LanguageDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanguageDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanguageDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanguageDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanguageDataStruct &&
        name == other.name &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([name, title]);
}

LanguageDataStruct createLanguageDataStruct({
  String? name,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LanguageDataStruct(
      name: name,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LanguageDataStruct? updateLanguageDataStruct(
  LanguageDataStruct? languageData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    languageData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLanguageDataStructData(
  Map<String, dynamic> firestoreData,
  LanguageDataStruct? languageData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (languageData == null) {
    return;
  }
  if (languageData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && languageData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final languageDataData =
      getLanguageDataFirestoreData(languageData, forFieldValue);
  final nestedData =
      languageDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = languageData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLanguageDataFirestoreData(
  LanguageDataStruct? languageData, [
  bool forFieldValue = false,
]) {
  if (languageData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(languageData.toMap());

  // Add any Firestore field values
  languageData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLanguageDataListFirestoreData(
  List<LanguageDataStruct>? languageDatas,
) =>
    languageDatas?.map((e) => getLanguageDataFirestoreData(e, true)).toList() ??
    [];
