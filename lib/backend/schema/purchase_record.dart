import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchaseRecord extends FirestoreRecord {
  PurchaseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  bool hasDiscountAmt() => _discountAmt != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  bool hasDiscountPer() => _discountPer != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "orderDate" field.
  int? _orderDate;
  int get orderDate => _orderDate ?? 0;
  bool hasOrderDate() => _orderDate != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "party" field.
  String? _party;
  String get party => _party ?? '';
  bool hasParty() => _party != null;

  // "order" field.
  String? _order;
  String get order => _order ?? '';
  bool hasOrder() => _order != null;

  // "gstNo" field.
  String? _gstNo;
  String get gstNo => _gstNo ?? '';
  bool hasGstNo() => _gstNo != null;

  // "receivedAmt" field.
  double? _receivedAmt;
  double get receivedAmt => _receivedAmt ?? 0.0;
  bool hasReceivedAmt() => _receivedAmt != null;

  // "balanceDue" field.
  double? _balanceDue;
  double get balanceDue => _balanceDue ?? 0.0;
  bool hasBalanceDue() => _balanceDue != null;

  // "paidAmt" field.
  double? _paidAmt;
  double get paidAmt => _paidAmt ?? 0.0;
  bool hasPaidAmt() => _paidAmt != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "paymentStatus" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "authorizedBy" field.
  String? _authorizedBy;
  String get authorizedBy => _authorizedBy ?? '';
  bool hasAuthorizedBy() => _authorizedBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "productList" field.
  List<PurchaseSaleItemListStruct>? _productList;
  List<PurchaseSaleItemListStruct> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "grosssTotal" field.
  double? _grosssTotal;
  double get grosssTotal => _grosssTotal ?? 0.0;
  bool hasGrosssTotal() => _grosssTotal != null;

  // "modifiedBy" field.
  DocumentReference? _modifiedBy;
  DocumentReference? get modifiedBy => _modifiedBy;
  bool hasModifiedBy() => _modifiedBy != null;

  // "modifiedDate" field.
  int? _modifiedDate;
  int get modifiedDate => _modifiedDate ?? 0;
  bool hasModifiedDate() => _modifiedDate != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "invoiceNo" field.
  String? _invoiceNo;
  String get invoiceNo => _invoiceNo ?? '';
  bool hasInvoiceNo() => _invoiceNo != null;

  // "serialNo" field.
  String? _serialNo;
  String get serialNo => _serialNo ?? '';
  bool hasSerialNo() => _serialNo != null;

  // "orderTime" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "poDueDate" field.
  String? _poDueDate;
  String get poDueDate => _poDueDate ?? '';
  bool hasPoDueDate() => _poDueDate != null;

  // "taxRef" field.
  DocumentReference? _taxRef;
  DocumentReference? get taxRef => _taxRef;
  bool hasTaxRef() => _taxRef != null;

  // "invoiceDate" field.
  int? _invoiceDate;
  int get invoiceDate => _invoiceDate ?? 0;
  bool hasInvoiceDate() => _invoiceDate != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "supplierBillNo" field.
  String? _supplierBillNo;
  String get supplierBillNo => _supplierBillNo ?? '';
  bool hasSupplierBillNo() => _supplierBillNo != null;

  // "supplierBillDate" field.
  String? _supplierBillDate;
  String get supplierBillDate => _supplierBillDate ?? '';
  bool hasSupplierBillDate() => _supplierBillDate != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _delliveryChrg = castToType<double>(snapshotData['delliveryChrg']);
    _taxAmt = castToType<double>(snapshotData['taxAmt']);
    _billAmt = castToType<double>(snapshotData['billAmt']);
    _discountAmt = castToType<double>(snapshotData['discountAmt']);
    _dayId = snapshotData['dayId'] as String?;
    _discountPer = castToType<double>(snapshotData['discountPer']);
    _finalBillAmt = castToType<double>(snapshotData['finalBillAmt']);
    _id = snapshotData['id'] as String?;
    _orderDate = castToType<int>(snapshotData['orderDate']);
    _paymentMode = snapshotData['paymentMode'] as String?;
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _party = snapshotData['party'] as String?;
    _order = snapshotData['order'] as String?;
    _gstNo = snapshotData['gstNo'] as String?;
    _receivedAmt = castToType<double>(snapshotData['receivedAmt']);
    _balanceDue = castToType<double>(snapshotData['balanceDue']);
    _paidAmt = castToType<double>(snapshotData['paidAmt']);
    _type = castToType<int>(snapshotData['type']);
    _paymentStatus = snapshotData['paymentStatus'] as String?;
    _authorizedBy = snapshotData['authorizedBy'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _productList = getStructList(
      snapshotData['productList'],
      PurchaseSaleItemListStruct.fromMap,
    );
    _mobile = snapshotData['mobile'] as String?;
    _grosssTotal = castToType<double>(snapshotData['grosssTotal']);
    _modifiedBy = snapshotData['modifiedBy'] as DocumentReference?;
    _modifiedDate = castToType<int>(snapshotData['modifiedDate']);
    _comment = snapshotData['comment'] as String?;
    _invoiceNo = snapshotData['invoiceNo'] as String?;
    _serialNo = snapshotData['serialNo'] as String?;
    _orderTime = snapshotData['orderTime'] as DateTime?;
    _poDueDate = snapshotData['poDueDate'] as String?;
    _taxRef = snapshotData['taxRef'] as DocumentReference?;
    _invoiceDate = castToType<int>(snapshotData['invoiceDate']);
    _createdBy = snapshotData['createdBy'] as String?;
    _supplierBillNo = snapshotData['supplierBillNo'] as String?;
    _supplierBillDate = snapshotData['supplierBillDate'] as String?;
    _note = snapshotData['note'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PURCHASE')
          : FirebaseFirestore.instance.collectionGroup('PURCHASE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PURCHASE').doc(id);

  static Stream<PurchaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PurchaseRecord.fromSnapshot(s));

  static Future<PurchaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PurchaseRecord.fromSnapshot(s));

  static PurchaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PurchaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PurchaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PurchaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PurchaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PurchaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPurchaseRecordData({
  double? delliveryChrg,
  double? taxAmt,
  double? billAmt,
  double? discountAmt,
  String? dayId,
  double? discountPer,
  double? finalBillAmt,
  String? id,
  int? orderDate,
  String? paymentMode,
  double? roundOff,
  String? party,
  String? order,
  String? gstNo,
  double? receivedAmt,
  double? balanceDue,
  double? paidAmt,
  int? type,
  String? paymentStatus,
  String? authorizedBy,
  int? status,
  String? mobile,
  double? grosssTotal,
  DocumentReference? modifiedBy,
  int? modifiedDate,
  String? comment,
  String? invoiceNo,
  String? serialNo,
  DateTime? orderTime,
  String? poDueDate,
  DocumentReference? taxRef,
  int? invoiceDate,
  String? createdBy,
  String? supplierBillNo,
  String? supplierBillDate,
  String? note,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'delliveryChrg': delliveryChrg,
      'taxAmt': taxAmt,
      'billAmt': billAmt,
      'discountAmt': discountAmt,
      'dayId': dayId,
      'discountPer': discountPer,
      'finalBillAmt': finalBillAmt,
      'id': id,
      'orderDate': orderDate,
      'paymentMode': paymentMode,
      'roundOff': roundOff,
      'party': party,
      'order': order,
      'gstNo': gstNo,
      'receivedAmt': receivedAmt,
      'balanceDue': balanceDue,
      'paidAmt': paidAmt,
      'type': type,
      'paymentStatus': paymentStatus,
      'authorizedBy': authorizedBy,
      'status': status,
      'mobile': mobile,
      'grosssTotal': grosssTotal,
      'modifiedBy': modifiedBy,
      'modifiedDate': modifiedDate,
      'comment': comment,
      'invoiceNo': invoiceNo,
      'serialNo': serialNo,
      'orderTime': orderTime,
      'poDueDate': poDueDate,
      'taxRef': taxRef,
      'invoiceDate': invoiceDate,
      'createdBy': createdBy,
      'supplierBillNo': supplierBillNo,
      'supplierBillDate': supplierBillDate,
      'note': note,
    }.withoutNulls,
  );

  return firestoreData;
}

class PurchaseRecordDocumentEquality implements Equality<PurchaseRecord> {
  const PurchaseRecordDocumentEquality();

  @override
  bool equals(PurchaseRecord? e1, PurchaseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.delliveryChrg == e2?.delliveryChrg &&
        e1?.taxAmt == e2?.taxAmt &&
        e1?.billAmt == e2?.billAmt &&
        e1?.discountAmt == e2?.discountAmt &&
        e1?.dayId == e2?.dayId &&
        e1?.discountPer == e2?.discountPer &&
        e1?.finalBillAmt == e2?.finalBillAmt &&
        e1?.id == e2?.id &&
        e1?.orderDate == e2?.orderDate &&
        e1?.paymentMode == e2?.paymentMode &&
        e1?.roundOff == e2?.roundOff &&
        e1?.party == e2?.party &&
        e1?.order == e2?.order &&
        e1?.gstNo == e2?.gstNo &&
        e1?.receivedAmt == e2?.receivedAmt &&
        e1?.balanceDue == e2?.balanceDue &&
        e1?.paidAmt == e2?.paidAmt &&
        e1?.type == e2?.type &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.authorizedBy == e2?.authorizedBy &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.productList, e2?.productList) &&
        e1?.mobile == e2?.mobile &&
        e1?.grosssTotal == e2?.grosssTotal &&
        e1?.modifiedBy == e2?.modifiedBy &&
        e1?.modifiedDate == e2?.modifiedDate &&
        e1?.comment == e2?.comment &&
        e1?.invoiceNo == e2?.invoiceNo &&
        e1?.serialNo == e2?.serialNo &&
        e1?.orderTime == e2?.orderTime &&
        e1?.poDueDate == e2?.poDueDate &&
        e1?.taxRef == e2?.taxRef &&
        e1?.invoiceDate == e2?.invoiceDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.supplierBillNo == e2?.supplierBillNo &&
        e1?.supplierBillDate == e2?.supplierBillDate &&
        e1?.note == e2?.note;
  }

  @override
  int hash(PurchaseRecord? e) => const ListEquality().hash([
        e?.delliveryChrg,
        e?.taxAmt,
        e?.billAmt,
        e?.discountAmt,
        e?.dayId,
        e?.discountPer,
        e?.finalBillAmt,
        e?.id,
        e?.orderDate,
        e?.paymentMode,
        e?.roundOff,
        e?.party,
        e?.order,
        e?.gstNo,
        e?.receivedAmt,
        e?.balanceDue,
        e?.paidAmt,
        e?.type,
        e?.paymentStatus,
        e?.authorizedBy,
        e?.status,
        e?.productList,
        e?.mobile,
        e?.grosssTotal,
        e?.modifiedBy,
        e?.modifiedDate,
        e?.comment,
        e?.invoiceNo,
        e?.serialNo,
        e?.orderTime,
        e?.poDueDate,
        e?.taxRef,
        e?.invoiceDate,
        e?.createdBy,
        e?.supplierBillNo,
        e?.supplierBillDate,
        e?.note
      ]);

  @override
  bool isValidKey(Object? o) => o is PurchaseRecord;
}
