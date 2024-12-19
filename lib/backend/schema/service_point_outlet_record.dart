import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicePointOutletRecord extends FirestoreRecord {
  ServicePointOutletRecord._(
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

  // "printerPaperSize" field.
  String? _printerPaperSize;
  String get printerPaperSize => _printerPaperSize ?? '';
  bool hasPrinterPaperSize() => _printerPaperSize != null;

  // "printerPortNumber" field.
  int? _printerPortNumber;
  int get printerPortNumber => _printerPortNumber ?? 0;
  bool hasPrinterPortNumber() => _printerPortNumber != null;

  // "servicePointHeader" field.
  String? _servicePointHeader;
  String get servicePointHeader => _servicePointHeader ?? '';
  bool hasServicePointHeader() => _servicePointHeader != null;

  // "servicePointSubHeader" field.
  String? _servicePointSubHeader;
  String get servicePointSubHeader => _servicePointSubHeader ?? '';
  bool hasServicePointSubHeader() => _servicePointSubHeader != null;

  // "servicePointFooter" field.
  String? _servicePointFooter;
  String get servicePointFooter => _servicePointFooter ?? '';
  bool hasServicePointFooter() => _servicePointFooter != null;

  // "service_pointRef" field.
  DocumentReference? _servicePointRef;
  DocumentReference? get servicePointRef => _servicePointRef;
  bool hasServicePointRef() => _servicePointRef != null;

  // "printerType" field.
  String? _printerType;
  String get printerType => _printerType ?? '';
  bool hasPrinterType() => _printerType != null;

  // "printerIpAddress" field.
  String? _printerIpAddress;
  String get printerIpAddress => _printerIpAddress ?? '';
  bool hasPrinterIpAddress() => _printerIpAddress != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _updateDate = castToType<int>(snapshotData['updateDate']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _printerPaperSize = snapshotData['printerPaperSize'] as String?;
    _printerPortNumber = castToType<int>(snapshotData['printerPortNumber']);
    _servicePointHeader = snapshotData['servicePointHeader'] as String?;
    _servicePointSubHeader = snapshotData['servicePointSubHeader'] as String?;
    _servicePointFooter = snapshotData['servicePointFooter'] as String?;
    _servicePointRef = snapshotData['service_pointRef'] as DocumentReference?;
    _printerType = snapshotData['printerType'] as String?;
    _printerIpAddress = snapshotData['printerIpAddress'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SERVICE_POINT_OUTLET')
          : FirebaseFirestore.instance.collectionGroup('SERVICE_POINT_OUTLET');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SERVICE_POINT_OUTLET').doc(id);

  static Stream<ServicePointOutletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicePointOutletRecord.fromSnapshot(s));

  static Future<ServicePointOutletRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ServicePointOutletRecord.fromSnapshot(s));

  static ServicePointOutletRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicePointOutletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicePointOutletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicePointOutletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicePointOutletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicePointOutletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicePointOutletRecordData({
  String? id,
  String? name,
  int? code,
  DocumentReference? createdBy,
  DocumentReference? updatedBy,
  int? updateDate,
  int? createdDate,
  String? printerPaperSize,
  int? printerPortNumber,
  String? servicePointHeader,
  String? servicePointSubHeader,
  String? servicePointFooter,
  DocumentReference? servicePointRef,
  String? printerType,
  String? printerIpAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'createdBy': createdBy,
      'updatedBy': updatedBy,
      'updateDate': updateDate,
      'createdDate': createdDate,
      'printerPaperSize': printerPaperSize,
      'printerPortNumber': printerPortNumber,
      'servicePointHeader': servicePointHeader,
      'servicePointSubHeader': servicePointSubHeader,
      'servicePointFooter': servicePointFooter,
      'service_pointRef': servicePointRef,
      'printerType': printerType,
      'printerIpAddress': printerIpAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicePointOutletRecordDocumentEquality
    implements Equality<ServicePointOutletRecord> {
  const ServicePointOutletRecordDocumentEquality();

  @override
  bool equals(ServicePointOutletRecord? e1, ServicePointOutletRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.code == e2?.code &&
        e1?.createdBy == e2?.createdBy &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.printerPaperSize == e2?.printerPaperSize &&
        e1?.printerPortNumber == e2?.printerPortNumber &&
        e1?.servicePointHeader == e2?.servicePointHeader &&
        e1?.servicePointSubHeader == e2?.servicePointSubHeader &&
        e1?.servicePointFooter == e2?.servicePointFooter &&
        e1?.servicePointRef == e2?.servicePointRef &&
        e1?.printerType == e2?.printerType &&
        e1?.printerIpAddress == e2?.printerIpAddress;
  }

  @override
  int hash(ServicePointOutletRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.code,
        e?.createdBy,
        e?.updatedBy,
        e?.updateDate,
        e?.createdDate,
        e?.printerPaperSize,
        e?.printerPortNumber,
        e?.servicePointHeader,
        e?.servicePointSubHeader,
        e?.servicePointFooter,
        e?.servicePointRef,
        e?.printerType,
        e?.printerIpAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicePointOutletRecord;
}
