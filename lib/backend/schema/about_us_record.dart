import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AboutUsRecord extends FirestoreRecord {
  AboutUsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "contains" field.
  String? _contains;
  String get contains => _contains ?? '';
  bool hasContains() => _contains != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "userid" field.
  int? _userid;
  int get userid => _userid ?? 0;
  bool hasUserid() => _userid != null;

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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _contains = snapshotData['contains'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _userid = castToType<int>(snapshotData['userid']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _updateDate = castToType<int>(snapshotData['updateDate']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ABOUT_US')
          : FirebaseFirestore.instance.collectionGroup('ABOUT_US');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ABOUT_US').doc(id);

  static Stream<AboutUsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AboutUsRecord.fromSnapshot(s));

  static Future<AboutUsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AboutUsRecord.fromSnapshot(s));

  static AboutUsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AboutUsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AboutUsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AboutUsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AboutUsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AboutUsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAboutUsRecordData({
  String? id,
  String? contains,
  int? createdDate,
  int? userid,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  int? updateDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'contains': contains,
      'createdDate': createdDate,
      'userid': userid,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'updateDate': updateDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class AboutUsRecordDocumentEquality implements Equality<AboutUsRecord> {
  const AboutUsRecordDocumentEquality();

  @override
  bool equals(AboutUsRecord? e1, AboutUsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.contains == e2?.contains &&
        e1?.createdDate == e2?.createdDate &&
        e1?.userid == e2?.userid &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updateDate == e2?.updateDate;
  }

  @override
  int hash(AboutUsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.contains,
        e?.createdDate,
        e?.userid,
        e?.createdBy,
        e?.updatedBy,
        e?.updateDate
      ]);

  @override
  bool isValidKey(Object? o) => o is AboutUsRecord;
}
