import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CancellationRefundPolicyRecord extends FirestoreRecord {
  CancellationRefundPolicyRecord._(
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
          ? parent.collection('Cancellation_Refund_Policy')
          : FirebaseFirestore.instance
              .collectionGroup('Cancellation_Refund_Policy');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Cancellation_Refund_Policy').doc(id);

  static Stream<CancellationRefundPolicyRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => CancellationRefundPolicyRecord.fromSnapshot(s));

  static Future<CancellationRefundPolicyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CancellationRefundPolicyRecord.fromSnapshot(s));

  static CancellationRefundPolicyRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      CancellationRefundPolicyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CancellationRefundPolicyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CancellationRefundPolicyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CancellationRefundPolicyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CancellationRefundPolicyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCancellationRefundPolicyRecordData({
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

class CancellationRefundPolicyRecordDocumentEquality
    implements Equality<CancellationRefundPolicyRecord> {
  const CancellationRefundPolicyRecordDocumentEquality();

  @override
  bool equals(
      CancellationRefundPolicyRecord? e1, CancellationRefundPolicyRecord? e2) {
    return e1?.id == e2?.id && e1?.contains == e2?.contains;
  }

  @override
  int hash(CancellationRefundPolicyRecord? e) =>
      const ListEquality().hash([e?.id, e?.contains]);

  @override
  bool isValidKey(Object? o) => o is CancellationRefundPolicyRecord;
}
