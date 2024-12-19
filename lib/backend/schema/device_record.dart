import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceRecord extends FirestoreRecord {
  DeviceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "board" field.
  String? _board;
  String get board => _board ?? '';
  bool hasBoard() => _board != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "connectedToNetwork" field.
  bool? _connectedToNetwork;
  bool get connectedToNetwork => _connectedToNetwork ?? false;
  bool hasConnectedToNetwork() => _connectedToNetwork != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "manufacture" field.
  String? _manufacture;
  String get manufacture => _manufacture ?? '';
  bool hasManufacture() => _manufacture != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "serial" field.
  String? _serial;
  String get serial => _serial ?? '';
  bool hasSerial() => _serial != null;

  // "posModel" field.
  String? _posModel;
  String get posModel => _posModel ?? '';
  bool hasPosModel() => _posModel != null;

  // "posSerial" field.
  String? _posSerial;
  String get posSerial => _posSerial ?? '';
  bool hasPosSerial() => _posSerial != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "outletRef" field.
  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  bool hasOutletRef() => _outletRef != null;

  // "versionCode" field.
  String? _versionCode;
  String get versionCode => _versionCode ?? '';
  bool hasVersionCode() => _versionCode != null;

  // "versionName" field.
  String? _versionName;
  String get versionName => _versionName ?? '';
  bool hasVersionName() => _versionName != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "outletName" field.
  String? _outletName;
  String get outletName => _outletName ?? '';
  bool hasOutletName() => _outletName != null;

  // "outletNumber" field.
  String? _outletNumber;
  String get outletNumber => _outletNumber ?? '';
  bool hasOutletNumber() => _outletNumber != null;

  // "branch" field.
  String? _branch;
  String get branch => _branch ?? '';
  bool hasBranch() => _branch != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  bool hasOutletId() => _outletId != null;

  // "loggedIn" field.
  bool? _loggedIn;
  bool get loggedIn => _loggedIn ?? false;
  bool hasLoggedIn() => _loggedIn != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  bool hasLongitude() => _longitude != null;

  // "latLong" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  bool hasLatLong() => _latLong != null;

  // "billingType" field.
  String? _billingType;
  String get billingType => _billingType ?? '';
  bool hasBillingType() => _billingType != null;

  void _initializeFields() {
    _active = snapshotData['active'] as bool?;
    _board = snapshotData['board'] as String?;
    _id = snapshotData['id'] as String?;
    _deviceId = snapshotData['deviceId'] as String?;
    _brand = snapshotData['brand'] as String?;
    _connectedToNetwork = snapshotData['connectedToNetwork'] as bool?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _manufacture = snapshotData['manufacture'] as String?;
    _model = snapshotData['model'] as String?;
    _serial = snapshotData['serial'] as String?;
    _posModel = snapshotData['posModel'] as String?;
    _posSerial = snapshotData['posSerial'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _outletRef = snapshotData['outletRef'] as DocumentReference?;
    _versionCode = snapshotData['versionCode'] as String?;
    _versionName = snapshotData['versionName'] as String?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _code = castToType<int>(snapshotData['code']);
    _outletName = snapshotData['outletName'] as String?;
    _outletNumber = snapshotData['outletNumber'] as String?;
    _branch = snapshotData['branch'] as String?;
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _outletId = snapshotData['outletId'] as String?;
    _loggedIn = snapshotData['loggedIn'] as bool?;
    _userId = snapshotData['userId'] as String?;
    _latitude = castToType<double>(snapshotData['latitude']);
    _longitude = castToType<double>(snapshotData['longitude']);
    _latLong = snapshotData['latLong'] as LatLng?;
    _billingType = snapshotData['billingType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DEVICE');

  static Stream<DeviceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeviceRecord.fromSnapshot(s));

  static Future<DeviceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeviceRecord.fromSnapshot(s));

  static DeviceRecord fromSnapshot(DocumentSnapshot snapshot) => DeviceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeviceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeviceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeviceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeviceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeviceRecordData({
  bool? active,
  String? board,
  String? id,
  String? deviceId,
  String? brand,
  bool? connectedToNetwork,
  int? createdDate,
  String? manufacture,
  String? model,
  String? serial,
  String? posModel,
  String? posSerial,
  DocumentReference? userRef,
  DocumentReference? outletRef,
  String? versionCode,
  String? versionName,
  DocumentReference? createdBy,
  String? address,
  int? updatedDate,
  DocumentReference? updatedBy,
  int? code,
  String? outletName,
  String? outletNumber,
  String? branch,
  double? roundOff,
  String? outletId,
  bool? loggedIn,
  String? userId,
  double? latitude,
  double? longitude,
  LatLng? latLong,
  String? billingType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'active': active,
      'board': board,
      'id': id,
      'deviceId': deviceId,
      'brand': brand,
      'connectedToNetwork': connectedToNetwork,
      'createdDate': createdDate,
      'manufacture': manufacture,
      'model': model,
      'serial': serial,
      'posModel': posModel,
      'posSerial': posSerial,
      'userRef': userRef,
      'outletRef': outletRef,
      'versionCode': versionCode,
      'versionName': versionName,
      'createdBy': createdBy,
      'address': address,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
      'code': code,
      'outletName': outletName,
      'outletNumber': outletNumber,
      'branch': branch,
      'roundOff': roundOff,
      'outletId': outletId,
      'loggedIn': loggedIn,
      'userId': userId,
      'latitude': latitude,
      'longitude': longitude,
      'latLong': latLong,
      'billingType': billingType,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeviceRecordDocumentEquality implements Equality<DeviceRecord> {
  const DeviceRecordDocumentEquality();

  @override
  bool equals(DeviceRecord? e1, DeviceRecord? e2) {
    return e1?.active == e2?.active &&
        e1?.board == e2?.board &&
        e1?.id == e2?.id &&
        e1?.deviceId == e2?.deviceId &&
        e1?.brand == e2?.brand &&
        e1?.connectedToNetwork == e2?.connectedToNetwork &&
        e1?.createdDate == e2?.createdDate &&
        e1?.manufacture == e2?.manufacture &&
        e1?.model == e2?.model &&
        e1?.serial == e2?.serial &&
        e1?.posModel == e2?.posModel &&
        e1?.posSerial == e2?.posSerial &&
        e1?.userRef == e2?.userRef &&
        e1?.outletRef == e2?.outletRef &&
        e1?.versionCode == e2?.versionCode &&
        e1?.versionName == e2?.versionName &&
        e1?.createdBy == e2?.createdBy &&
        e1?.address == e2?.address &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.code == e2?.code &&
        e1?.outletName == e2?.outletName &&
        e1?.outletNumber == e2?.outletNumber &&
        e1?.branch == e2?.branch &&
        e1?.roundOff == e2?.roundOff &&
        e1?.outletId == e2?.outletId &&
        e1?.loggedIn == e2?.loggedIn &&
        e1?.userId == e2?.userId &&
        e1?.latitude == e2?.latitude &&
        e1?.longitude == e2?.longitude &&
        e1?.latLong == e2?.latLong &&
        e1?.billingType == e2?.billingType;
  }

  @override
  int hash(DeviceRecord? e) => const ListEquality().hash([
        e?.active,
        e?.board,
        e?.id,
        e?.deviceId,
        e?.brand,
        e?.connectedToNetwork,
        e?.createdDate,
        e?.manufacture,
        e?.model,
        e?.serial,
        e?.posModel,
        e?.posSerial,
        e?.userRef,
        e?.outletRef,
        e?.versionCode,
        e?.versionName,
        e?.createdBy,
        e?.address,
        e?.updatedDate,
        e?.updatedBy,
        e?.code,
        e?.outletName,
        e?.outletNumber,
        e?.branch,
        e?.roundOff,
        e?.outletId,
        e?.loggedIn,
        e?.userId,
        e?.latitude,
        e?.longitude,
        e?.latLong,
        e?.billingType
      ]);

  @override
  bool isValidKey(Object? o) => o is DeviceRecord;
}
