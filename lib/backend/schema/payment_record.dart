import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentRecord extends FirestoreRecord {
  PaymentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "expenceType" field.
  String? _expenceType;
  String get expenceType => _expenceType ?? '';
  bool hasExpenceType() => _expenceType != null;

  // "paymentType" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "updateDate" field.
  int? _updateDate;
  int get updateDate => _updateDate ?? 0;
  bool hasUpdateDate() => _updateDate != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "party" field.
  DocumentReference? _party;
  DocumentReference? get party => _party;
  bool hasParty() => _party != null;

  // "oldBalance" field.
  int? _oldBalance;
  int get oldBalance => _oldBalance ?? 0;
  bool hasOldBalance() => _oldBalance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _note = snapshotData['note'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _expenceType = snapshotData['expenceType'] as String?;
    _paymentType = snapshotData['paymentType'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _updateDate = castToType<int>(snapshotData['updateDate']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _code = castToType<int>(snapshotData['code']);
    _party = snapshotData['party'] as DocumentReference?;
    _oldBalance = castToType<int>(snapshotData['oldBalance']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PAYMENT')
          : FirebaseFirestore.instance.collectionGroup('PAYMENT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PAYMENT').doc(id);

  static Stream<PaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentRecord.fromSnapshot(s));

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentRecord.fromSnapshot(s));

  static PaymentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentRecordData({
  String? id,
  String? note,
  double? amount,
  String? expenceType,
  String? paymentType,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  int? updateDate,
  int? createdDate,
  int? code,
  DocumentReference? party,
  int? oldBalance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'note': note,
      'amount': amount,
      'expenceType': expenceType,
      'paymentType': paymentType,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'updateDate': updateDate,
      'createdDate': createdDate,
      'code': code,
      'party': party,
      'oldBalance': oldBalance,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentRecordDocumentEquality implements Equality<PaymentRecord> {
  const PaymentRecordDocumentEquality();

  @override
  bool equals(PaymentRecord? e1, PaymentRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.note == e2?.note &&
        e1?.amount == e2?.amount &&
        e1?.expenceType == e2?.expenceType &&
        e1?.paymentType == e2?.paymentType &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.code == e2?.code &&
        e1?.party == e2?.party &&
        e1?.oldBalance == e2?.oldBalance;
  }

  @override
  int hash(PaymentRecord? e) => const ListEquality().hash([
        e?.id,
        e?.note,
        e?.amount,
        e?.expenceType,
        e?.paymentType,
        e?.createdBy,
        e?.updatedBy,
        e?.updateDate,
        e?.createdDate,
        e?.code,
        e?.party,
        e?.oldBalance
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentRecord;
}
