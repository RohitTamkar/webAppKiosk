// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentQrStruct extends FFFirebaseStruct {
  PaymentQrStruct({
    double? amount,
    bool? captured,
    String? status,
    String? payerAccountType,
    String? vpa,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _amount = amount,
        _captured = captured,
        _status = status,
        _payerAccountType = payerAccountType,
        _vpa = vpa,
        super(firestoreUtilData);

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "captured" field.
  bool? _captured;
  bool get captured => _captured ?? false;
  set captured(bool? val) => _captured = val;

  bool hasCaptured() => _captured != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "payer_account_type" field.
  String? _payerAccountType;
  String get payerAccountType => _payerAccountType ?? '';
  set payerAccountType(String? val) => _payerAccountType = val;

  bool hasPayerAccountType() => _payerAccountType != null;

  // "vpa" field.
  String? _vpa;
  String get vpa => _vpa ?? '';
  set vpa(String? val) => _vpa = val;

  bool hasVpa() => _vpa != null;

  static PaymentQrStruct fromMap(Map<String, dynamic> data) => PaymentQrStruct(
        amount: castToType<double>(data['amount']),
        captured: data['captured'] as bool?,
        status: data['status'] as String?,
        payerAccountType: data['payer_account_type'] as String?,
        vpa: data['vpa'] as String?,
      );

  static PaymentQrStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentQrStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'amount': _amount,
        'captured': _captured,
        'status': _status,
        'payer_account_type': _payerAccountType,
        'vpa': _vpa,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'captured': serializeParam(
          _captured,
          ParamType.bool,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'payer_account_type': serializeParam(
          _payerAccountType,
          ParamType.String,
        ),
        'vpa': serializeParam(
          _vpa,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentQrStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentQrStruct(
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        captured: deserializeParam(
          data['captured'],
          ParamType.bool,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        payerAccountType: deserializeParam(
          data['payer_account_type'],
          ParamType.String,
          false,
        ),
        vpa: deserializeParam(
          data['vpa'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentQrStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentQrStruct &&
        amount == other.amount &&
        captured == other.captured &&
        status == other.status &&
        payerAccountType == other.payerAccountType &&
        vpa == other.vpa;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([amount, captured, status, payerAccountType, vpa]);
}

PaymentQrStruct createPaymentQrStruct({
  double? amount,
  bool? captured,
  String? status,
  String? payerAccountType,
  String? vpa,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentQrStruct(
      amount: amount,
      captured: captured,
      status: status,
      payerAccountType: payerAccountType,
      vpa: vpa,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentQrStruct? updatePaymentQrStruct(
  PaymentQrStruct? paymentQr, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentQr
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentQrStructData(
  Map<String, dynamic> firestoreData,
  PaymentQrStruct? paymentQr,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentQr == null) {
    return;
  }
  if (paymentQr.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentQr.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentQrData = getPaymentQrFirestoreData(paymentQr, forFieldValue);
  final nestedData = paymentQrData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentQr.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentQrFirestoreData(
  PaymentQrStruct? paymentQr, [
  bool forFieldValue = false,
]) {
  if (paymentQr == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentQr.toMap());

  // Add any Firestore field values
  paymentQr.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentQrListFirestoreData(
  List<PaymentQrStruct>? paymentQrs,
) =>
    paymentQrs?.map((e) => getPaymentQrFirestoreData(e, true)).toList() ?? [];
