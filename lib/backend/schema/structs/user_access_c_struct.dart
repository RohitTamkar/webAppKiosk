// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAccessCStruct extends FFFirebaseStruct {
  UserAccessCStruct({
    String? title,
    int? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _value = value,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;

  void incrementValue(int amount) => value = value + amount;

  bool hasValue() => _value != null;

  static UserAccessCStruct fromMap(Map<String, dynamic> data) =>
      UserAccessCStruct(
        title: data['title'] as String?,
        value: castToType<int>(data['value']),
      );

  static UserAccessCStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAccessCStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserAccessCStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserAccessCStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserAccessCStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAccessCStruct &&
        title == other.title &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([title, value]);
}

UserAccessCStruct createUserAccessCStruct({
  String? title,
  int? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAccessCStruct(
      title: title,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAccessCStruct? updateUserAccessCStruct(
  UserAccessCStruct? userAccessC, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAccessC
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAccessCStructData(
  Map<String, dynamic> firestoreData,
  UserAccessCStruct? userAccessC,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAccessC == null) {
    return;
  }
  if (userAccessC.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAccessC.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAccessCData =
      getUserAccessCFirestoreData(userAccessC, forFieldValue);
  final nestedData =
      userAccessCData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userAccessC.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAccessCFirestoreData(
  UserAccessCStruct? userAccessC, [
  bool forFieldValue = false,
]) {
  if (userAccessC == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAccessC.toMap());

  // Add any Firestore field values
  userAccessC.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAccessCListFirestoreData(
  List<UserAccessCStruct>? userAccessCs,
) =>
    userAccessCs?.map((e) => getUserAccessCFirestoreData(e, true)).toList() ??
    [];
