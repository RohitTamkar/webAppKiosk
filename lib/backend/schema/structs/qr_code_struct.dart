// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrCodeStruct extends FFFirebaseStruct {
  QrCodeStruct({
    String? closeReason,
    String? id,
    String? imageUrl,
    double? paymentsAmountReceived,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _closeReason = closeReason,
        _id = id,
        _imageUrl = imageUrl,
        _paymentsAmountReceived = paymentsAmountReceived,
        super(firestoreUtilData);

  // "close_reason" field.
  String? _closeReason;
  String get closeReason => _closeReason ?? '';
  set closeReason(String? val) => _closeReason = val;

  bool hasCloseReason() => _closeReason != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "payments_amount_received" field.
  double? _paymentsAmountReceived;
  double get paymentsAmountReceived => _paymentsAmountReceived ?? 0.0;
  set paymentsAmountReceived(double? val) => _paymentsAmountReceived = val;

  void incrementPaymentsAmountReceived(double amount) =>
      paymentsAmountReceived = paymentsAmountReceived + amount;

  bool hasPaymentsAmountReceived() => _paymentsAmountReceived != null;

  static QrCodeStruct fromMap(Map<String, dynamic> data) => QrCodeStruct(
        closeReason: data['close_reason'] as String?,
        id: data['id'] as String?,
        imageUrl: data['image_url'] as String?,
        paymentsAmountReceived:
            castToType<double>(data['payments_amount_received']),
      );

  static QrCodeStruct? maybeFromMap(dynamic data) =>
      data is Map ? QrCodeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'close_reason': _closeReason,
        'id': _id,
        'image_url': _imageUrl,
        'payments_amount_received': _paymentsAmountReceived,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'close_reason': serializeParam(
          _closeReason,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'payments_amount_received': serializeParam(
          _paymentsAmountReceived,
          ParamType.double,
        ),
      }.withoutNulls;

  static QrCodeStruct fromSerializableMap(Map<String, dynamic> data) =>
      QrCodeStruct(
        closeReason: deserializeParam(
          data['close_reason'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
        paymentsAmountReceived: deserializeParam(
          data['payments_amount_received'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'QrCodeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QrCodeStruct &&
        closeReason == other.closeReason &&
        id == other.id &&
        imageUrl == other.imageUrl &&
        paymentsAmountReceived == other.paymentsAmountReceived;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([closeReason, id, imageUrl, paymentsAmountReceived]);
}

QrCodeStruct createQrCodeStruct({
  String? closeReason,
  String? id,
  String? imageUrl,
  double? paymentsAmountReceived,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QrCodeStruct(
      closeReason: closeReason,
      id: id,
      imageUrl: imageUrl,
      paymentsAmountReceived: paymentsAmountReceived,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QrCodeStruct? updateQrCodeStruct(
  QrCodeStruct? qrCode, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    qrCode
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQrCodeStructData(
  Map<String, dynamic> firestoreData,
  QrCodeStruct? qrCode,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (qrCode == null) {
    return;
  }
  if (qrCode.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && qrCode.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final qrCodeData = getQrCodeFirestoreData(qrCode, forFieldValue);
  final nestedData = qrCodeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = qrCode.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQrCodeFirestoreData(
  QrCodeStruct? qrCode, [
  bool forFieldValue = false,
]) {
  if (qrCode == null) {
    return {};
  }
  final firestoreData = mapToFirestore(qrCode.toMap());

  // Add any Firestore field values
  qrCode.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQrCodeListFirestoreData(
  List<QrCodeStruct>? qrCodes,
) =>
    qrCodes?.map((e) => getQrCodeFirestoreData(e, true)).toList() ?? [];
