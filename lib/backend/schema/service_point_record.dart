import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicePointRecord extends FirestoreRecord {
  ServicePointRecord._(
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

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SERVICE_POINT');

  static Stream<ServicePointRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicePointRecord.fromSnapshot(s));

  static Future<ServicePointRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicePointRecord.fromSnapshot(s));

  static ServicePointRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicePointRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicePointRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicePointRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicePointRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicePointRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicePointRecordData({
  String? id,
  String? name,
  int? code,
  int? createdDate,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  int? updatedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'updatedDate': updatedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicePointRecordDocumentEquality
    implements Equality<ServicePointRecord> {
  const ServicePointRecordDocumentEquality();

  @override
  bool equals(ServicePointRecord? e1, ServicePointRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.code == e2?.code &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updatedDate == e2?.updatedDate;
  }

  @override
  int hash(ServicePointRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.code,
        e?.createdDate,
        e?.createdBy,
        e?.updatedBy,
        e?.updatedDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicePointRecord;
}
