import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftRecord extends FirestoreRecord {
  ShiftRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "billCount" field.
  int? _billCount;
  int get billCount => _billCount ?? 0;
  bool hasBillCount() => _billCount != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "lastBillNo" field.
  String? _lastBillNo;
  String get lastBillNo => _lastBillNo ?? '';
  bool hasLastBillNo() => _lastBillNo != null;

  // "lastBillTime" field.
  int? _lastBillTime;
  int get lastBillTime => _lastBillTime ?? 0;
  bool hasLastBillTime() => _lastBillTime != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "deliveryCharges" field.
  double? _deliveryCharges;
  double get deliveryCharges => _deliveryCharges ?? 0.0;
  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "shiftId" field.
  String? _shiftId;
  String get shiftId => _shiftId ?? '';
  bool hasShiftId() => _shiftId != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "endTime" field.
  int? _endTime;
  int get endTime => _endTime ?? 0;
  bool hasEndTime() => _endTime != null;

  // "advanceAmtTotal" field.
  double? _advanceAmtTotal;
  double get advanceAmtTotal => _advanceAmtTotal ?? 0.0;
  bool hasAdvanceAmtTotal() => _advanceAmtTotal != null;

  // "customerReciveAmtTotal" field.
  double? _customerReciveAmtTotal;
  double get customerReciveAmtTotal => _customerReciveAmtTotal ?? 0.0;
  bool hasCustomerReciveAmtTotal() => _customerReciveAmtTotal != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "expensesAmtTotal" field.
  double? _expensesAmtTotal;
  double get expensesAmtTotal => _expensesAmtTotal ?? 0.0;
  bool hasExpensesAmtTotal() => _expensesAmtTotal != null;

  // "openingAmt" field.
  double? _openingAmt;
  double get openingAmt => _openingAmt ?? 0.0;
  bool hasOpeningAmt() => _openingAmt != null;

  // "receiveAmtTotal" field.
  double? _receiveAmtTotal;
  double get receiveAmtTotal => _receiveAmtTotal ?? 0.0;
  bool hasReceiveAmtTotal() => _receiveAmtTotal != null;

  // "refoundAmount" field.
  double? _refoundAmount;
  double get refoundAmount => _refoundAmount ?? 0.0;
  bool hasRefoundAmount() => _refoundAmount != null;

  // "totalSale" field.
  double? _totalSale;
  double get totalSale => _totalSale ?? 0.0;
  bool hasTotalSale() => _totalSale != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "cashInHand" field.
  double? _cashInHand;
  double get cashInHand => _cashInHand ?? 0.0;
  bool hasCashInHand() => _cashInHand != null;

  // "cashSale" field.
  double? _cashSale;
  double get cashSale => _cashSale ?? 0.0;
  bool hasCashSale() => _cashSale != null;

  // "startTime" field.
  int? _startTime;
  int get startTime => _startTime ?? 0;
  bool hasStartTime() => _startTime != null;

  // "inActive" field.
  bool? _inActive;
  bool get inActive => _inActive ?? false;
  bool hasInActive() => _inActive != null;

  // "shiftNo" field.
  int? _shiftNo;
  int get shiftNo => _shiftNo ?? 0;
  bool hasShiftNo() => _shiftNo != null;

  // "subTotalBill" field.
  double? _subTotalBill;
  double get subTotalBill => _subTotalBill ?? 0.0;
  bool hasSubTotalBill() => _subTotalBill != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "paymentJson" field.
  String? _paymentJson;
  String get paymentJson => _paymentJson ?? '';
  bool hasPaymentJson() => _paymentJson != null;

  // "productSaleList" field.
  List<SelItemListStruct>? _productSaleList;
  List<SelItemListStruct> get productSaleList => _productSaleList ?? const [];
  bool hasProductSaleList() => _productSaleList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _billCount = castToType<int>(snapshotData['billCount']);
    _dayId = snapshotData['dayId'] as String?;
    _lastBillNo = snapshotData['lastBillNo'] as String?;
    _lastBillTime = castToType<int>(snapshotData['lastBillTime']);
    _tax = castToType<double>(snapshotData['tax']);
    _deliveryCharges = castToType<double>(snapshotData['deliveryCharges']);
    _shiftId = snapshotData['shiftId'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _endTime = castToType<int>(snapshotData['endTime']);
    _advanceAmtTotal = castToType<double>(snapshotData['advanceAmtTotal']);
    _customerReciveAmtTotal =
        castToType<double>(snapshotData['customerReciveAmtTotal']);
    _discount = castToType<double>(snapshotData['discount']);
    _expensesAmtTotal = castToType<double>(snapshotData['expensesAmtTotal']);
    _openingAmt = castToType<double>(snapshotData['openingAmt']);
    _receiveAmtTotal = castToType<double>(snapshotData['receiveAmtTotal']);
    _refoundAmount = castToType<double>(snapshotData['refoundAmount']);
    _totalSale = castToType<double>(snapshotData['totalSale']);
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _cashInHand = castToType<double>(snapshotData['cashInHand']);
    _cashSale = castToType<double>(snapshotData['cashSale']);
    _startTime = castToType<int>(snapshotData['startTime']);
    _inActive = snapshotData['inActive'] as bool?;
    _shiftNo = castToType<int>(snapshotData['shiftNo']);
    _subTotalBill = castToType<double>(snapshotData['subTotalBill']);
    _userId = snapshotData['userId'] as String?;
    _deviceId = snapshotData['deviceId'] as String?;
    _paymentJson = snapshotData['paymentJson'] as String?;
    _productSaleList = getStructList(
      snapshotData['productSaleList'],
      SelItemListStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SHIFT')
          : FirebaseFirestore.instance.collectionGroup('SHIFT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SHIFT').doc(id);

  static Stream<ShiftRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShiftRecord.fromSnapshot(s));

  static Future<ShiftRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShiftRecord.fromSnapshot(s));

  static ShiftRecord fromSnapshot(DocumentSnapshot snapshot) => ShiftRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShiftRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShiftRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShiftRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShiftRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShiftRecordData({
  String? id,
  int? billCount,
  String? dayId,
  String? lastBillNo,
  int? lastBillTime,
  double? tax,
  double? deliveryCharges,
  String? shiftId,
  int? code,
  int? endTime,
  double? advanceAmtTotal,
  double? customerReciveAmtTotal,
  double? discount,
  double? expensesAmtTotal,
  double? openingAmt,
  double? receiveAmtTotal,
  double? refoundAmount,
  double? totalSale,
  double? roundOff,
  double? cashInHand,
  double? cashSale,
  int? startTime,
  bool? inActive,
  int? shiftNo,
  double? subTotalBill,
  String? userId,
  String? deviceId,
  String? paymentJson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'billCount': billCount,
      'dayId': dayId,
      'lastBillNo': lastBillNo,
      'lastBillTime': lastBillTime,
      'tax': tax,
      'deliveryCharges': deliveryCharges,
      'shiftId': shiftId,
      'code': code,
      'endTime': endTime,
      'advanceAmtTotal': advanceAmtTotal,
      'customerReciveAmtTotal': customerReciveAmtTotal,
      'discount': discount,
      'expensesAmtTotal': expensesAmtTotal,
      'openingAmt': openingAmt,
      'receiveAmtTotal': receiveAmtTotal,
      'refoundAmount': refoundAmount,
      'totalSale': totalSale,
      'roundOff': roundOff,
      'cashInHand': cashInHand,
      'cashSale': cashSale,
      'startTime': startTime,
      'inActive': inActive,
      'shiftNo': shiftNo,
      'subTotalBill': subTotalBill,
      'userId': userId,
      'deviceId': deviceId,
      'paymentJson': paymentJson,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShiftRecordDocumentEquality implements Equality<ShiftRecord> {
  const ShiftRecordDocumentEquality();

  @override
  bool equals(ShiftRecord? e1, ShiftRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.billCount == e2?.billCount &&
        e1?.dayId == e2?.dayId &&
        e1?.lastBillNo == e2?.lastBillNo &&
        e1?.lastBillTime == e2?.lastBillTime &&
        e1?.tax == e2?.tax &&
        e1?.deliveryCharges == e2?.deliveryCharges &&
        e1?.shiftId == e2?.shiftId &&
        e1?.code == e2?.code &&
        e1?.endTime == e2?.endTime &&
        e1?.advanceAmtTotal == e2?.advanceAmtTotal &&
        e1?.customerReciveAmtTotal == e2?.customerReciveAmtTotal &&
        e1?.discount == e2?.discount &&
        e1?.expensesAmtTotal == e2?.expensesAmtTotal &&
        e1?.openingAmt == e2?.openingAmt &&
        e1?.receiveAmtTotal == e2?.receiveAmtTotal &&
        e1?.refoundAmount == e2?.refoundAmount &&
        e1?.totalSale == e2?.totalSale &&
        e1?.roundOff == e2?.roundOff &&
        e1?.cashInHand == e2?.cashInHand &&
        e1?.cashSale == e2?.cashSale &&
        e1?.startTime == e2?.startTime &&
        e1?.inActive == e2?.inActive &&
        e1?.shiftNo == e2?.shiftNo &&
        e1?.subTotalBill == e2?.subTotalBill &&
        e1?.userId == e2?.userId &&
        e1?.deviceId == e2?.deviceId &&
        e1?.paymentJson == e2?.paymentJson &&
        listEquality.equals(e1?.productSaleList, e2?.productSaleList);
  }

  @override
  int hash(ShiftRecord? e) => const ListEquality().hash([
        e?.id,
        e?.billCount,
        e?.dayId,
        e?.lastBillNo,
        e?.lastBillTime,
        e?.tax,
        e?.deliveryCharges,
        e?.shiftId,
        e?.code,
        e?.endTime,
        e?.advanceAmtTotal,
        e?.customerReciveAmtTotal,
        e?.discount,
        e?.expensesAmtTotal,
        e?.openingAmt,
        e?.receiveAmtTotal,
        e?.refoundAmount,
        e?.totalSale,
        e?.roundOff,
        e?.cashInHand,
        e?.cashSale,
        e?.startTime,
        e?.inActive,
        e?.shiftNo,
        e?.subTotalBill,
        e?.userId,
        e?.deviceId,
        e?.paymentJson,
        e?.productSaleList
      ]);

  @override
  bool isValidKey(Object? o) => o is ShiftRecord;
}
