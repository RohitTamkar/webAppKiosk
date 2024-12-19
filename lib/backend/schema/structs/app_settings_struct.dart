// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSettingsStruct extends FFFirebaseStruct {
  AppSettingsStruct({
    String? title,
    bool? value,
    String? display,
    bool? isDeleted,
    String? name,
    String? settingType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _value = value,
        _display = display,
        _isDeleted = isDeleted,
        _name = name,
        _settingType = settingType,
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

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  set display(String? val) => _display = val;

  bool hasDisplay() => _display != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "settingType" field.
  String? _settingType;
  String get settingType => _settingType ?? '';
  set settingType(String? val) => _settingType = val;

  bool hasSettingType() => _settingType != null;

  static AppSettingsStruct fromMap(Map<String, dynamic> data) =>
      AppSettingsStruct(
        title: data['title'] as String?,
        value: data['value'] as bool?,
        display: data['display'] as String?,
        isDeleted: data['isDeleted'] as bool?,
        name: data['name'] as String?,
        settingType: data['settingType'] as String?,
      );

  static AppSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? AppSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'value': _value,
        'display': _display,
        'isDeleted': _isDeleted,
        'name': _name,
        'settingType': _settingType,
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
        'display': serializeParam(
          _display,
          ParamType.String,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'settingType': serializeParam(
          _settingType,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppSettingsStruct(
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
        display: deserializeParam(
          data['display'],
          ParamType.String,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        settingType: deserializeParam(
          data['settingType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppSettingsStruct &&
        title == other.title &&
        value == other.value &&
        display == other.display &&
        isDeleted == other.isDeleted &&
        name == other.name &&
        settingType == other.settingType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, value, display, isDeleted, name, settingType]);
}

AppSettingsStruct createAppSettingsStruct({
  String? title,
  bool? value,
  String? display,
  bool? isDeleted,
  String? name,
  String? settingType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppSettingsStruct(
      title: title,
      value: value,
      display: display,
      isDeleted: isDeleted,
      name: name,
      settingType: settingType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppSettingsStruct? updateAppSettingsStruct(
  AppSettingsStruct? appSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppSettingsStructData(
  Map<String, dynamic> firestoreData,
  AppSettingsStruct? appSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appSettings == null) {
    return;
  }
  if (appSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appSettingsData =
      getAppSettingsFirestoreData(appSettings, forFieldValue);
  final nestedData =
      appSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = appSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppSettingsFirestoreData(
  AppSettingsStruct? appSettings, [
  bool forFieldValue = false,
]) {
  if (appSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appSettings.toMap());

  // Add any Firestore field values
  appSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppSettingsListFirestoreData(
  List<AppSettingsStruct>? appSettingss,
) =>
    appSettingss?.map((e) => getAppSettingsFirestoreData(e, true)).toList() ??
    [];
