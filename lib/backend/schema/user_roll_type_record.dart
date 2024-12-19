import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRollTypeRecord extends FirestoreRecord {
  UserRollTypeRecord._(
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

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "image_Path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "fileNameE" field.
  String? _fileNameE;
  String get fileNameE => _fileNameE ?? '';
  bool hasFileNameE() => _fileNameE != null;

  // "totalPrice" field.
  int? _totalPrice;
  int get totalPrice => _totalPrice ?? 0;
  bool hasTotalPrice() => _totalPrice != null;

  // "waranty" field.
  int? _waranty;
  int get waranty => _waranty ?? 0;
  bool hasWaranty() => _waranty != null;

  // "devices" field.
  String? _devices;
  String get devices => _devices ?? '';
  bool hasDevices() => _devices != null;

  // "count" field.
  double? _count;
  double get count => _count ?? 0.0;
  bool hasCount() => _count != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _imagePath = snapshotData['image_Path'] as String?;
    _fileNameE = snapshotData['fileNameE'] as String?;
    _totalPrice = castToType<int>(snapshotData['totalPrice']);
    _waranty = castToType<int>(snapshotData['waranty']);
    _devices = snapshotData['devices'] as String?;
    _count = castToType<double>(snapshotData['count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('USER_ROLL_TYPE');

  static Stream<UserRollTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRollTypeRecord.fromSnapshot(s));

  static Future<UserRollTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRollTypeRecord.fromSnapshot(s));

  static UserRollTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRollTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRollTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRollTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRollTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRollTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRollTypeRecordData({
  String? id,
  String? name,
  int? code,
  int? createdDate,
  DocumentReference? createdBy,
  int? updatedDate,
  DocumentReference? updatedBy,
  String? imagePath,
  String? fileNameE,
  int? totalPrice,
  int? waranty,
  String? devices,
  double? count,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
      'image_Path': imagePath,
      'fileNameE': fileNameE,
      'totalPrice': totalPrice,
      'waranty': waranty,
      'devices': devices,
      'count': count,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRollTypeRecordDocumentEquality
    implements Equality<UserRollTypeRecord> {
  const UserRollTypeRecordDocumentEquality();

  @override
  bool equals(UserRollTypeRecord? e1, UserRollTypeRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.code == e2?.code &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.imagePath == e2?.imagePath &&
        e1?.fileNameE == e2?.fileNameE &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.waranty == e2?.waranty &&
        e1?.devices == e2?.devices &&
        e1?.count == e2?.count;
  }

  @override
  int hash(UserRollTypeRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.code,
        e?.createdDate,
        e?.createdBy,
        e?.updatedDate,
        e?.updatedBy,
        e?.imagePath,
        e?.fileNameE,
        e?.totalPrice,
        e?.waranty,
        e?.devices,
        e?.count
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRollTypeRecord;
}
