import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PremisesRecord extends FirestoreRecord {
  PremisesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "tables" field.
  int? _tables;
  int get tables => _tables ?? 0;
  bool hasTables() => _tables != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "range" field.
  int? _range;
  int get range => _range ?? 0;
  bool hasRange() => _range != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "radioButtonType" field.
  bool? _radioButtonType;
  bool get radioButtonType => _radioButtonType ?? false;
  bool hasRadioButtonType() => _radioButtonType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _tables = castToType<int>(snapshotData['tables']);
    _type = snapshotData['type'] as String?;
    _range = castToType<int>(snapshotData['range']);
    _code = castToType<int>(snapshotData['code']);
    _radioButtonType = snapshotData['radioButtonType'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PREMISES')
          : FirebaseFirestore.instance.collectionGroup('PREMISES');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PREMISES').doc(id);

  static Stream<PremisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PremisesRecord.fromSnapshot(s));

  static Future<PremisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PremisesRecord.fromSnapshot(s));

  static PremisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PremisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PremisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PremisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PremisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PremisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPremisesRecordData({
  DateTime? createdTime,
  String? id,
  String? name,
  int? tables,
  String? type,
  int? range,
  int? code,
  bool? radioButtonType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdTime': createdTime,
      'id': id,
      'name': name,
      'tables': tables,
      'type': type,
      'range': range,
      'code': code,
      'radioButtonType': radioButtonType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PremisesRecordDocumentEquality implements Equality<PremisesRecord> {
  const PremisesRecordDocumentEquality();

  @override
  bool equals(PremisesRecord? e1, PremisesRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.tables == e2?.tables &&
        e1?.type == e2?.type &&
        e1?.range == e2?.range &&
        e1?.code == e2?.code &&
        e1?.radioButtonType == e2?.radioButtonType;
  }

  @override
  int hash(PremisesRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.id,
        e?.name,
        e?.tables,
        e?.type,
        e?.range,
        e?.code,
        e?.radioButtonType
      ]);

  @override
  bool isValidKey(Object? o) => o is PremisesRecord;
}
