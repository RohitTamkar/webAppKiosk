import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactUsRecord extends FirestoreRecord {
  ContactUsRecord._(
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
          ? parent.collection('CONTACT_US')
          : FirebaseFirestore.instance.collectionGroup('CONTACT_US');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CONTACT_US').doc(id);

  static Stream<ContactUsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactUsRecord.fromSnapshot(s));

  static Future<ContactUsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactUsRecord.fromSnapshot(s));

  static ContactUsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactUsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactUsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactUsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactUsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactUsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactUsRecordData({
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

class ContactUsRecordDocumentEquality implements Equality<ContactUsRecord> {
  const ContactUsRecordDocumentEquality();

  @override
  bool equals(ContactUsRecord? e1, ContactUsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.contains == e2?.contains;
  }

  @override
  int hash(ContactUsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdBy,
        e?.updatedBy,
        e?.updateDate,
        e?.createdDate,
        e?.contains
      ]);

  @override
  bool isValidKey(Object? o) => o is ContactUsRecord;
}
