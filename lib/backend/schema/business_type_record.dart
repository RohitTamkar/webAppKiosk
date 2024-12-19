import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinessTypeRecord extends FirestoreRecord {
  BusinessTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image_Url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "subscriptionRef" field.
  DocumentReference? _subscriptionRef;
  DocumentReference? get subscriptionRef => _subscriptionRef;
  bool hasSubscriptionRef() => _subscriptionRef != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _imageUrl = snapshotData['image_Url'] as String?;
    _active = snapshotData['active'] as bool?;
    _code = castToType<int>(snapshotData['code']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _subscriptionRef = snapshotData['subscriptionRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BUSINESS_TYPE');

  static Stream<BusinessTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinessTypeRecord.fromSnapshot(s));

  static Future<BusinessTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinessTypeRecord.fromSnapshot(s));

  static BusinessTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinessTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinessTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinessTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinessTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinessTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinessTypeRecordData({
  String? id,
  String? name,
  String? imageUrl,
  bool? active,
  int? code,
  int? createdDate,
  DocumentReference? createdBy,
  int? updatedDate,
  DocumentReference? updatedBy,
  DocumentReference? subscriptionRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'image_Url': imageUrl,
      'active': active,
      'code': code,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
      'subscriptionRef': subscriptionRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinessTypeRecordDocumentEquality
    implements Equality<BusinessTypeRecord> {
  const BusinessTypeRecordDocumentEquality();

  @override
  bool equals(BusinessTypeRecord? e1, BusinessTypeRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.active == e2?.active &&
        e1?.code == e2?.code &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.subscriptionRef == e2?.subscriptionRef;
  }

  @override
  int hash(BusinessTypeRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.imageUrl,
        e?.active,
        e?.code,
        e?.createdDate,
        e?.createdBy,
        e?.updatedDate,
        e?.updatedBy,
        e?.subscriptionRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinessTypeRecord;
}
