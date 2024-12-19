// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAccessStruct extends FFFirebaseStruct {
  UserAccessStruct({
    String? title,
    bool? value,
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
  bool? _value;
  bool get value => _value ?? false;
  set value(bool? val) => _value = val;

  bool hasValue() => _value != null;

  static UserAccessStruct fromMap(Map<String, dynamic> data) =>
      UserAccessStruct(
        title: data['title'] as String?,
        value: data['value'] as bool?,
      );

  static UserAccessStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAccessStruct.fromMap(data.cast<String, dynamic>())
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
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserAccessStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserAccessStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserAccessStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAccessStruct &&
        title == other.title &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([title, value]);
}

UserAccessStruct createUserAccessStruct({
  String? title,
  bool? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAccessStruct(
      title: title,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAccessStruct? updateUserAccessStruct(
  UserAccessStruct? userAccess, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAccess
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAccessStructData(
  Map<String, dynamic> firestoreData,
  UserAccessStruct? userAccess,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAccess == null) {
    return;
  }
  if (userAccess.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAccess.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAccessData = getUserAccessFirestoreData(userAccess, forFieldValue);
  final nestedData = userAccessData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userAccess.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAccessFirestoreData(
  UserAccessStruct? userAccess, [
  bool forFieldValue = false,
]) {
  if (userAccess == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAccess.toMap());

  // Add any Firestore field values
  userAccess.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAccessListFirestoreData(
  List<UserAccessStruct>? userAccesss,
) =>
    userAccesss?.map((e) => getUserAccessFirestoreData(e, true)).toList() ?? [];
