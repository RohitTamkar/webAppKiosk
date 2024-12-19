// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentModeStruct extends FFFirebaseStruct {
  PaymentModeStruct({
    String? name,
    double? amount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _amount = amount,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static PaymentModeStruct fromMap(Map<String, dynamic> data) =>
      PaymentModeStruct(
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
      );

  static PaymentModeStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentModeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'amount': _amount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static PaymentModeStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentModeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PaymentModeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentModeStruct &&
        name == other.name &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([name, amount]);
}

PaymentModeStruct createPaymentModeStruct({
  String? name,
  double? amount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentModeStruct(
      name: name,
      amount: amount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentModeStruct? updatePaymentModeStruct(
  PaymentModeStruct? paymentMode, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentMode
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentModeStructData(
  Map<String, dynamic> firestoreData,
  PaymentModeStruct? paymentMode,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentMode == null) {
    return;
  }
  if (paymentMode.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentMode.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentModeData =
      getPaymentModeFirestoreData(paymentMode, forFieldValue);
  final nestedData =
      paymentModeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentMode.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentModeFirestoreData(
  PaymentModeStruct? paymentMode, [
  bool forFieldValue = false,
]) {
  if (paymentMode == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentMode.toMap());

  // Add any Firestore field values
  paymentMode.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentModeListFirestoreData(
  List<PaymentModeStruct>? paymentModes,
) =>
    paymentModes?.map((e) => getPaymentModeFirestoreData(e, true)).toList() ??
    [];
