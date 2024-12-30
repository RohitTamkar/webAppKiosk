import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoiceRecord extends FirestoreRecord {
  InvoiceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "invoice" field.
  String? _invoice;
  String get invoice => _invoice ?? '';
  bool hasInvoice() => _invoice != null;

  // "party" field.
  String? _party;
  String get party => _party ?? '';
  bool hasParty() => _party != null;

  // "products" field.
  String? _products;
  String get products => _products ?? '';
  bool hasProducts() => _products != null;

  // "invoiceDate" field.
  int? _invoiceDate;
  int get invoiceDate => _invoiceDate ?? 0;
  bool hasInvoiceDate() => _invoiceDate != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  bool hasDiscountAmt() => _discountAmt != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  bool hasDiscountPer() => _discountPer != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  bool hasTaxAmt() => _taxAmt != null;

  // "billAmt" field.
  double? _billAmt;
  double get billAmt => _billAmt ?? 0.0;
  bool hasBillAmt() => _billAmt != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "productList" field.
  List<SelItemListStruct>? _productList;
  List<SelItemListStruct> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  // "shiftId" field.
  String? _shiftId;
  String get shiftId => _shiftId ?? '';
  bool hasShiftId() => _shiftId != null;

  // "partyMobNo" field.
  String? _partyMobNo;
  String get partyMobNo => _partyMobNo ?? '';
  bool hasPartyMobNo() => _partyMobNo != null;

  // "taxPer" field.
  double? _taxPer;
  double get taxPer => _taxPer ?? 0.0;
  bool hasTaxPer() => _taxPer != null;

  // "vechicleNo" field.
  String? _vechicleNo;
  String get vechicleNo => _vechicleNo ?? '';
  bool hasVechicleNo() => _vechicleNo != null;

  // "checkInTime" field.
  int? _checkInTime;
  int get checkInTime => _checkInTime ?? 0;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOutTime" field.
  int? _checkOutTime;
  int get checkOutTime => _checkOutTime ?? 0;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "advancePaid" field.
  double? _advancePaid;
  double get advancePaid => _advancePaid ?? 0.0;
  bool hasAdvancePaid() => _advancePaid != null;

  // "vechicleType" field.
  String? _vechicleType;
  String get vechicleType => _vechicleType ?? '';
  bool hasVechicleType() => _vechicleType != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  bool hasCount() => _count != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "orderType" field.
  String? _orderType;
  String get orderType => _orderType ?? '';
  bool hasOrderType() => _orderType != null;

  // "kotStatus" field.
  String? _kotStatus;
  String get kotStatus => _kotStatus ?? '';
  bool hasKotStatus() => _kotStatus != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _invoice = snapshotData['invoice'] as String?;
    _party = snapshotData['party'] as String?;
    _products = snapshotData['products'] as String?;
    _invoiceDate = castToType<int>(snapshotData['invoiceDate']);
    _paymentMode = snapshotData['paymentMode'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _discountAmt = castToType<double>(snapshotData['discountAmt']);
    _discountPer = castToType<double>(snapshotData['discountPer']);
    _delliveryChrg = castToType<double>(snapshotData['delliveryChrg']);
    _taxAmt = castToType<double>(snapshotData['taxAmt']);
    _billAmt = castToType<double>(snapshotData['billAmt']);
    _finalBillAmt = castToType<double>(snapshotData['finalBillAmt']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _code = castToType<int>(snapshotData['code']);
    _productList = getStructList(
      snapshotData['productList'],
      SelItemListStruct.fromMap,
    );
    _shiftId = snapshotData['shiftId'] as String?;
    _partyMobNo = snapshotData['partyMobNo'] as String?;
    _taxPer = castToType<double>(snapshotData['taxPer']);
    _vechicleNo = snapshotData['vechicleNo'] as String?;
    _checkInTime = castToType<int>(snapshotData['checkInTime']);
    _checkOutTime = castToType<int>(snapshotData['checkOutTime']);
    _advancePaid = castToType<double>(snapshotData['advancePaid']);
    _vechicleType = snapshotData['vechicleType'] as String?;
    _count = castToType<int>(snapshotData['count']);
    _duration = castToType<double>(snapshotData['duration']);
    _orderType = snapshotData['orderType'] as String?;
    _kotStatus = snapshotData['kotStatus'] as String?;
    _weight = snapshotData['weight'] as String?;
    _source = snapshotData['source'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('INVOICE')
          : FirebaseFirestore.instance.collectionGroup('INVOICE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('INVOICE').doc(id);

  static Stream<InvoiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoiceRecord.fromSnapshot(s));

  static Future<InvoiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoiceRecord.fromSnapshot(s));

  static InvoiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoiceRecordData({
  String? id,
  String? invoice,
  String? party,
  String? products,
  int? invoiceDate,
  String? paymentMode,
  String? dayId,
  double? discountAmt,
  double? discountPer,
  double? delliveryChrg,
  double? taxAmt,
  double? billAmt,
  double? finalBillAmt,
  DocumentReference? createdBy,
  int? createdDate,
  int? updatedDate,
  double? roundOff,
  DocumentReference? updatedBy,
  int? code,
  String? shiftId,
  String? partyMobNo,
  double? taxPer,
  String? vechicleNo,
  int? checkInTime,
  int? checkOutTime,
  double? advancePaid,
  String? vechicleType,
  int? count,
  double? duration,
  String? orderType,
  String? kotStatus,
  String? weight,
  String? source,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'invoice': invoice,
      'party': party,
      'products': products,
      'invoiceDate': invoiceDate,
      'paymentMode': paymentMode,
      'dayId': dayId,
      'discountAmt': discountAmt,
      'discountPer': discountPer,
      'delliveryChrg': delliveryChrg,
      'taxAmt': taxAmt,
      'billAmt': billAmt,
      'finalBillAmt': finalBillAmt,
      'createdBy': createdBy,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'roundOff': roundOff,
      'updatedBy': updatedBy,
      'code': code,
      'shiftId': shiftId,
      'partyMobNo': partyMobNo,
      'taxPer': taxPer,
      'vechicleNo': vechicleNo,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'advancePaid': advancePaid,
      'vechicleType': vechicleType,
      'count': count,
      'duration': duration,
      'orderType': orderType,
      'kotStatus': kotStatus,
      'weight': weight,
      'source': source,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoiceRecordDocumentEquality implements Equality<InvoiceRecord> {
  const InvoiceRecordDocumentEquality();

  @override
  bool equals(InvoiceRecord? e1, InvoiceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.invoice == e2?.invoice &&
        e1?.party == e2?.party &&
        e1?.products == e2?.products &&
        e1?.invoiceDate == e2?.invoiceDate &&
        e1?.paymentMode == e2?.paymentMode &&
        e1?.dayId == e2?.dayId &&
        e1?.discountAmt == e2?.discountAmt &&
        e1?.discountPer == e2?.discountPer &&
        e1?.delliveryChrg == e2?.delliveryChrg &&
        e1?.taxAmt == e2?.taxAmt &&
        e1?.billAmt == e2?.billAmt &&
        e1?.finalBillAmt == e2?.finalBillAmt &&
        e1?.createdBy == e2?.createdBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.roundOff == e2?.roundOff &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.code == e2?.code &&
        listEquality.equals(e1?.productList, e2?.productList) &&
        e1?.shiftId == e2?.shiftId &&
        e1?.partyMobNo == e2?.partyMobNo &&
        e1?.taxPer == e2?.taxPer &&
        e1?.vechicleNo == e2?.vechicleNo &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOutTime == e2?.checkOutTime &&
        e1?.advancePaid == e2?.advancePaid &&
        e1?.vechicleType == e2?.vechicleType &&
        e1?.count == e2?.count &&
        e1?.duration == e2?.duration &&
        e1?.orderType == e2?.orderType &&
        e1?.kotStatus == e2?.kotStatus &&
        e1?.weight == e2?.weight &&
        e1?.source == e2?.source;
  }

  @override
  int hash(InvoiceRecord? e) => const ListEquality().hash([
        e?.id,
        e?.invoice,
        e?.party,
        e?.products,
        e?.invoiceDate,
        e?.paymentMode,
        e?.dayId,
        e?.discountAmt,
        e?.discountPer,
        e?.delliveryChrg,
        e?.taxAmt,
        e?.billAmt,
        e?.finalBillAmt,
        e?.createdBy,
        e?.createdDate,
        e?.updatedDate,
        e?.roundOff,
        e?.updatedBy,
        e?.code,
        e?.productList,
        e?.shiftId,
        e?.partyMobNo,
        e?.taxPer,
        e?.vechicleNo,
        e?.checkInTime,
        e?.checkOutTime,
        e?.advancePaid,
        e?.vechicleType,
        e?.count,
        e?.duration,
        e?.orderType,
        e?.kotStatus,
        e?.weight,
        e?.source
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoiceRecord;
}
