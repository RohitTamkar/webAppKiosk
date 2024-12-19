import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitTypeRecord extends FirestoreRecord {
  UnitTypeRecord._(
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

  // "percentage" field.
  double? _percentage;
  double get percentage => _percentage ?? 0.0;
  bool hasPercentage() => _percentage != null;

  // "unitType" field.
  String? _unitType;
  String get unitType => _unitType ?? '';
  bool hasUnitType() => _unitType != null;

  // "factor" field.
  int? _factor;
  int get factor => _factor ?? 0;
  bool hasFactor() => _factor != null;

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

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _percentage = castToType<double>(snapshotData['percentage']);
    _unitType = snapshotData['unitType'] as String?;
    _factor = castToType<int>(snapshotData['factor']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UNIT_TYPE');

  static Stream<UnitTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UnitTypeRecord.fromSnapshot(s));

  static Future<UnitTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UnitTypeRecord.fromSnapshot(s));

  static UnitTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UnitTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UnitTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UnitTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UnitTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UnitTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUnitTypeRecordData({
  String? id,
  String? name,
  int? code,
  double? percentage,
  String? unitType,
  int? factor,
  int? createdDate,
  DocumentReference? createdBy,
  int? updatedDate,
  DocumentReference? updatedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'percentage': percentage,
      'unitType': unitType,
      'factor': factor,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class UnitTypeRecordDocumentEquality implements Equality<UnitTypeRecord> {
  const UnitTypeRecordDocumentEquality();

  @override
  bool equals(UnitTypeRecord? e1, UnitTypeRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.code == e2?.code &&
        e1?.percentage == e2?.percentage &&
        e1?.unitType == e2?.unitType &&
        e1?.factor == e2?.factor &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.updatedBy == e2?.updatedBy;
  }

  @override
  int hash(UnitTypeRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.code,
        e?.percentage,
        e?.unitType,
        e?.factor,
        e?.createdDate,
        e?.createdBy,
        e?.updatedDate,
        e?.updatedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is UnitTypeRecord;
}
