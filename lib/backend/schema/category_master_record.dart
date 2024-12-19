import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryMasterRecord extends FirestoreRecord {
  CategoryMasterRecord._(
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

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "regionalName" field.
  String? _regionalName;
  String get regionalName => _regionalName ?? '';
  bool hasRegionalName() => _regionalName != null;

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

  // "rname" field.
  List<LanguageDataStruct>? _rname;
  List<LanguageDataStruct> get rname => _rname ?? const [];
  bool hasRname() => _rname != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _active = snapshotData['active'] as bool?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _regionalName = snapshotData['regionalName'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _rname = getStructList(
      snapshotData['rname'],
      LanguageDataStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CATEGORY_MASTER');

  static Stream<CategoryMasterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryMasterRecord.fromSnapshot(s));

  static Future<CategoryMasterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryMasterRecord.fromSnapshot(s));

  static CategoryMasterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryMasterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryMasterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryMasterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryMasterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryMasterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryMasterRecordData({
  String? id,
  String? name,
  bool? active,
  String? imageUrl,
  String? regionalName,
  int? code,
  int? createdDate,
  DocumentReference? createdBy,
  int? updatedDate,
  DocumentReference? updatedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'active': active,
      'imageUrl': imageUrl,
      'regionalName': regionalName,
      'code': code,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryMasterRecordDocumentEquality
    implements Equality<CategoryMasterRecord> {
  const CategoryMasterRecordDocumentEquality();

  @override
  bool equals(CategoryMasterRecord? e1, CategoryMasterRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.active == e2?.active &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.regionalName == e2?.regionalName &&
        e1?.code == e2?.code &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.updatedBy == e2?.updatedBy &&
        listEquality.equals(e1?.rname, e2?.rname);
  }

  @override
  int hash(CategoryMasterRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.active,
        e?.imageUrl,
        e?.regionalName,
        e?.code,
        e?.createdDate,
        e?.createdBy,
        e?.updatedDate,
        e?.updatedBy,
        e?.rname
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoryMasterRecord;
}
