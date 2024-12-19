import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthlyPassRecord extends FirestoreRecord {
  MonthlyPassRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  bool hasPlanName() => _planName != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  bool hasRemark() => _remark != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "validityDays" field.
  int? _validityDays;
  int get validityDays => _validityDays ?? 0;
  bool hasValidityDays() => _validityDays != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "custRef" field.
  DocumentReference? _custRef;
  DocumentReference? get custRef => _custRef;
  bool hasCustRef() => _custRef != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "paymentType" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  // "passStartDate" field.
  int? _passStartDate;
  int get passStartDate => _passStartDate ?? 0;
  bool hasPassStartDate() => _passStartDate != null;

  // "passEndDate" field.
  int? _passEndDate;
  int get passEndDate => _passEndDate ?? 0;
  bool hasPassEndDate() => _passEndDate != null;

  // "passStartDayld" field.
  String? _passStartDayld;
  String get passStartDayld => _passStartDayld ?? '';
  bool hasPassStartDayld() => _passStartDayld != null;

  // "passEndDayld" field.
  String? _passEndDayld;
  String get passEndDayld => _passEndDayld ?? '';
  bool hasPassEndDayld() => _passEndDayld != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _planName = snapshotData['planName'] as String?;
    _remark = snapshotData['remark'] as String?;
    _status = snapshotData['status'] as bool?;
    _validityDays = castToType<int>(snapshotData['validityDays']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _custRef = snapshotData['custRef'] as DocumentReference?;
    _amount = castToType<double>(snapshotData['amount']);
    _paymentType = snapshotData['paymentType'] as String?;
    _passStartDate = castToType<int>(snapshotData['passStartDate']);
    _passEndDate = castToType<int>(snapshotData['passEndDate']);
    _passStartDayld = snapshotData['passStartDayld'] as String?;
    _passEndDayld = snapshotData['passEndDayld'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('MONTHLY_PASS')
          : FirebaseFirestore.instance.collectionGroup('MONTHLY_PASS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('MONTHLY_PASS').doc(id);

  static Stream<MonthlyPassRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MonthlyPassRecord.fromSnapshot(s));

  static Future<MonthlyPassRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MonthlyPassRecord.fromSnapshot(s));

  static MonthlyPassRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MonthlyPassRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MonthlyPassRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MonthlyPassRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MonthlyPassRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MonthlyPassRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMonthlyPassRecordData({
  String? id,
  String? planName,
  String? remark,
  bool? status,
  int? validityDays,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  DocumentReference? custRef,
  double? amount,
  String? paymentType,
  int? passStartDate,
  int? passEndDate,
  String? passStartDayld,
  String? passEndDayld,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'planName': planName,
      'remark': remark,
      'status': status,
      'validityDays': validityDays,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'custRef': custRef,
      'amount': amount,
      'paymentType': paymentType,
      'passStartDate': passStartDate,
      'passEndDate': passEndDate,
      'passStartDayld': passStartDayld,
      'passEndDayld': passEndDayld,
    }.withoutNulls,
  );

  return firestoreData;
}

class MonthlyPassRecordDocumentEquality implements Equality<MonthlyPassRecord> {
  const MonthlyPassRecordDocumentEquality();

  @override
  bool equals(MonthlyPassRecord? e1, MonthlyPassRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.planName == e2?.planName &&
        e1?.remark == e2?.remark &&
        e1?.status == e2?.status &&
        e1?.validityDays == e2?.validityDays &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.custRef == e2?.custRef &&
        e1?.amount == e2?.amount &&
        e1?.paymentType == e2?.paymentType &&
        e1?.passStartDate == e2?.passStartDate &&
        e1?.passEndDate == e2?.passEndDate &&
        e1?.passStartDayld == e2?.passStartDayld &&
        e1?.passEndDayld == e2?.passEndDayld;
  }

  @override
  int hash(MonthlyPassRecord? e) => const ListEquality().hash([
        e?.id,
        e?.planName,
        e?.remark,
        e?.status,
        e?.validityDays,
        e?.createdBy,
        e?.updatedBy,
        e?.custRef,
        e?.amount,
        e?.paymentType,
        e?.passStartDate,
        e?.passEndDate,
        e?.passStartDayld,
        e?.passEndDayld
      ]);

  @override
  bool isValidKey(Object? o) => o is MonthlyPassRecord;
}
