import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrivacyPolicyRecord extends FirestoreRecord {
  PrivacyPolicyRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _contains = snapshotData['contains'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Privacy_Policy')
          : FirebaseFirestore.instance.collectionGroup('Privacy_Policy');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Privacy_Policy').doc(id);

  static Stream<PrivacyPolicyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrivacyPolicyRecord.fromSnapshot(s));

  static Future<PrivacyPolicyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrivacyPolicyRecord.fromSnapshot(s));

  static PrivacyPolicyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrivacyPolicyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrivacyPolicyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrivacyPolicyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrivacyPolicyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrivacyPolicyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrivacyPolicyRecordData({
  String? id,
  String? contains,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'contains': contains,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrivacyPolicyRecordDocumentEquality
    implements Equality<PrivacyPolicyRecord> {
  const PrivacyPolicyRecordDocumentEquality();

  @override
  bool equals(PrivacyPolicyRecord? e1, PrivacyPolicyRecord? e2) {
    return e1?.id == e2?.id && e1?.contains == e2?.contains;
  }

  @override
  int hash(PrivacyPolicyRecord? e) =>
      const ListEquality().hash([e?.id, e?.contains]);

  @override
  bool isValidKey(Object? o) => o is PrivacyPolicyRecord;
}
