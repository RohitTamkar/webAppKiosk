import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionRecord extends FirestoreRecord {
  SubscriptionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "jsonString" field.
  String? _jsonString;
  String get jsonString => _jsonString ?? '';
  bool hasJsonString() => _jsonString != null;

  // "planName" field.
  String? _planName;
  String get planName => _planName ?? '';
  bool hasPlanName() => _planName != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "validity" field.
  int? _validity;
  int get validity => _validity ?? 0;
  bool hasValidity() => _validity != null;

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

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _jsonString = snapshotData['jsonString'] as String?;
    _planName = snapshotData['planName'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _description = snapshotData['description'] as String?;
    _status = snapshotData['status'] as bool?;
    _link = snapshotData['link'] as String?;
    _validity = castToType<int>(snapshotData['validity']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _updateDate = castToType<int>(snapshotData['updateDate']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _amount = castToType<double>(snapshotData['amount']);
    _id = snapshotData['id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SUBSCRIPTION');

  static Stream<SubscriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionRecord.fromSnapshot(s));

  static Future<SubscriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionRecord.fromSnapshot(s));

  static SubscriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionRecordData({
  String? uid,
  String? jsonString,
  String? planName,
  int? code,
  String? description,
  bool? status,
  String? link,
  int? validity,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  int? updateDate,
  int? createdDate,
  double? amount,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'jsonString': jsonString,
      'planName': planName,
      'code': code,
      'description': description,
      'status': status,
      'link': link,
      'validity': validity,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'updateDate': updateDate,
      'createdDate': createdDate,
      'amount': amount,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionRecordDocumentEquality
    implements Equality<SubscriptionRecord> {
  const SubscriptionRecordDocumentEquality();

  @override
  bool equals(SubscriptionRecord? e1, SubscriptionRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.jsonString == e2?.jsonString &&
        e1?.planName == e2?.planName &&
        e1?.code == e2?.code &&
        e1?.description == e2?.description &&
        e1?.status == e2?.status &&
        e1?.link == e2?.link &&
        e1?.validity == e2?.validity &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.amount == e2?.amount &&
        e1?.id == e2?.id;
  }

  @override
  int hash(SubscriptionRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.jsonString,
        e?.planName,
        e?.code,
        e?.description,
        e?.status,
        e?.link,
        e?.validity,
        e?.createdBy,
        e?.updatedBy,
        e?.updateDate,
        e?.createdDate,
        e?.amount,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionRecord;
}
