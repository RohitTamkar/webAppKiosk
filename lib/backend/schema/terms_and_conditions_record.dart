import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TermsAndConditionsRecord extends FirestoreRecord {
  TermsAndConditionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

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

  // "contains" field.
  String? _contains;
  String get contains => _contains ?? '';
  bool hasContains() => _contains != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _updateDate = castToType<int>(snapshotData['updateDate']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _contains = snapshotData['contains'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('TERMS_AND_CONDITIONS')
          : FirebaseFirestore.instance.collectionGroup('TERMS_AND_CONDITIONS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('TERMS_AND_CONDITIONS').doc(id);

  static Stream<TermsAndConditionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TermsAndConditionsRecord.fromSnapshot(s));

  static Future<TermsAndConditionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TermsAndConditionsRecord.fromSnapshot(s));

  static TermsAndConditionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TermsAndConditionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TermsAndConditionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TermsAndConditionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TermsAndConditionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TermsAndConditionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTermsAndConditionsRecordData({
  String? id,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  int? updateDate,
  int? createdDate,
  String? contains,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'updateDate': updateDate,
      'createdDate': createdDate,
      'contains': contains,
    }.withoutNulls,
  );

  return firestoreData;
}

class TermsAndConditionsRecordDocumentEquality
    implements Equality<TermsAndConditionsRecord> {
  const TermsAndConditionsRecordDocumentEquality();

  @override
  bool equals(TermsAndConditionsRecord? e1, TermsAndConditionsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.contains == e2?.contains;
  }

  @override
  int hash(TermsAndConditionsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdBy,
        e?.updatedBy,
        e?.updateDate,
        e?.createdDate,
        e?.contains
      ]);

  @override
  bool isValidKey(Object? o) => o is TermsAndConditionsRecord;
}
