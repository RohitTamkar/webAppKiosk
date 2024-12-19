// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HoldListStruct extends FFFirebaseStruct {
  HoldListStruct({
    List<SelItemListStruct>? items,
    double? discountAmt,
    double? discountPer,
    double? delCharges,
    double? taxAmount,
    double? billAmount,
    double? subTotal,
    double? finalAmount,
    String? paymentMode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _items = items,
        _discountAmt = discountAmt,
        _discountPer = discountPer,
        _delCharges = delCharges,
        _taxAmount = taxAmount,
        _billAmount = billAmount,
        _subTotal = subTotal,
        _finalAmount = finalAmount,
        _paymentMode = paymentMode,
        super(firestoreUtilData);

  // "items" field.
  List<SelItemListStruct>? _items;
  List<SelItemListStruct> get items => _items ?? const [];
  set items(List<SelItemListStruct>? val) => _items = val;

  void updateItems(Function(List<SelItemListStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  set discountAmt(double? val) => _discountAmt = val;

  void incrementDiscountAmt(double amount) =>
      discountAmt = discountAmt + amount;

  bool hasDiscountAmt() => _discountAmt != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  set discountPer(double? val) => _discountPer = val;

  void incrementDiscountPer(double amount) =>
      discountPer = discountPer + amount;

  bool hasDiscountPer() => _discountPer != null;

  // "delCharges" field.
  double? _delCharges;
  double get delCharges => _delCharges ?? 0.0;
  set delCharges(double? val) => _delCharges = val;

  void incrementDelCharges(double amount) => delCharges = delCharges + amount;

  bool hasDelCharges() => _delCharges != null;

  // "taxAmount" field.
  double? _taxAmount;
  double get taxAmount => _taxAmount ?? 0.0;
  set taxAmount(double? val) => _taxAmount = val;

  void incrementTaxAmount(double amount) => taxAmount = taxAmount + amount;

  bool hasTaxAmount() => _taxAmount != null;

  // "billAmount" field.
  double? _billAmount;
  double get billAmount => _billAmount ?? 0.0;
  set billAmount(double? val) => _billAmount = val;

  void incrementBillAmount(double amount) => billAmount = billAmount + amount;

  bool hasBillAmount() => _billAmount != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  set subTotal(double? val) => _subTotal = val;

  void incrementSubTotal(double amount) => subTotal = subTotal + amount;

  bool hasSubTotal() => _subTotal != null;

  // "finalAmount" field.
  double? _finalAmount;
  double get finalAmount => _finalAmount ?? 0.0;
  set finalAmount(double? val) => _finalAmount = val;

  void incrementFinalAmount(double amount) =>
      finalAmount = finalAmount + amount;

  bool hasFinalAmount() => _finalAmount != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  set paymentMode(String? val) => _paymentMode = val;

  bool hasPaymentMode() => _paymentMode != null;

  static HoldListStruct fromMap(Map<String, dynamic> data) => HoldListStruct(
        items: getStructList(
          data['items'],
          SelItemListStruct.fromMap,
        ),
        discountAmt: castToType<double>(data['discountAmt']),
        discountPer: castToType<double>(data['discountPer']),
        delCharges: castToType<double>(data['delCharges']),
        taxAmount: castToType<double>(data['taxAmount']),
        billAmount: castToType<double>(data['billAmount']),
        subTotal: castToType<double>(data['subTotal']),
        finalAmount: castToType<double>(data['finalAmount']),
        paymentMode: data['paymentMode'] as String?,
      );

  static HoldListStruct? maybeFromMap(dynamic data) =>
      data is Map ? HoldListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'items': _items?.map((e) => e.toMap()).toList(),
        'discountAmt': _discountAmt,
        'discountPer': _discountPer,
        'delCharges': _delCharges,
        'taxAmount': _taxAmount,
        'billAmount': _billAmount,
        'subTotal': _subTotal,
        'finalAmount': _finalAmount,
        'paymentMode': _paymentMode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
        'discountAmt': serializeParam(
          _discountAmt,
          ParamType.double,
        ),
        'discountPer': serializeParam(
          _discountPer,
          ParamType.double,
        ),
        'delCharges': serializeParam(
          _delCharges,
          ParamType.double,
        ),
        'taxAmount': serializeParam(
          _taxAmount,
          ParamType.double,
        ),
        'billAmount': serializeParam(
          _billAmount,
          ParamType.double,
        ),
        'subTotal': serializeParam(
          _subTotal,
          ParamType.double,
        ),
        'finalAmount': serializeParam(
          _finalAmount,
          ParamType.double,
        ),
        'paymentMode': serializeParam(
          _paymentMode,
          ParamType.String,
        ),
      }.withoutNulls;

  static HoldListStruct fromSerializableMap(Map<String, dynamic> data) =>
      HoldListStruct(
        items: deserializeStructParam<SelItemListStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: SelItemListStruct.fromSerializableMap,
        ),
        discountAmt: deserializeParam(
          data['discountAmt'],
          ParamType.double,
          false,
        ),
        discountPer: deserializeParam(
          data['discountPer'],
          ParamType.double,
          false,
        ),
        delCharges: deserializeParam(
          data['delCharges'],
          ParamType.double,
          false,
        ),
        taxAmount: deserializeParam(
          data['taxAmount'],
          ParamType.double,
          false,
        ),
        billAmount: deserializeParam(
          data['billAmount'],
          ParamType.double,
          false,
        ),
        subTotal: deserializeParam(
          data['subTotal'],
          ParamType.double,
          false,
        ),
        finalAmount: deserializeParam(
          data['finalAmount'],
          ParamType.double,
          false,
        ),
        paymentMode: deserializeParam(
          data['paymentMode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HoldListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HoldListStruct &&
        listEquality.equals(items, other.items) &&
        discountAmt == other.discountAmt &&
        discountPer == other.discountPer &&
        delCharges == other.delCharges &&
        taxAmount == other.taxAmount &&
        billAmount == other.billAmount &&
        subTotal == other.subTotal &&
        finalAmount == other.finalAmount &&
        paymentMode == other.paymentMode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        items,
        discountAmt,
        discountPer,
        delCharges,
        taxAmount,
        billAmount,
        subTotal,
        finalAmount,
        paymentMode
      ]);
}

HoldListStruct createHoldListStruct({
  double? discountAmt,
  double? discountPer,
  double? delCharges,
  double? taxAmount,
  double? billAmount,
  double? subTotal,
  double? finalAmount,
  String? paymentMode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HoldListStruct(
      discountAmt: discountAmt,
      discountPer: discountPer,
      delCharges: delCharges,
      taxAmount: taxAmount,
      billAmount: billAmount,
      subTotal: subTotal,
      finalAmount: finalAmount,
      paymentMode: paymentMode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HoldListStruct? updateHoldListStruct(
  HoldListStruct? holdList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    holdList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHoldListStructData(
  Map<String, dynamic> firestoreData,
  HoldListStruct? holdList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (holdList == null) {
    return;
  }
  if (holdList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && holdList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final holdListData = getHoldListFirestoreData(holdList, forFieldValue);
  final nestedData = holdListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = holdList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHoldListFirestoreData(
  HoldListStruct? holdList, [
  bool forFieldValue = false,
]) {
  if (holdList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(holdList.toMap());

  // Add any Firestore field values
  holdList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHoldListListFirestoreData(
  List<HoldListStruct>? holdLists,
) =>
    holdLists?.map((e) => getHoldListFirestoreData(e, true)).toList() ?? [];
