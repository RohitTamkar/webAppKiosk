import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OutletRecord extends FirestoreRecord {
  OutletRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "branch" field.
  String? _branch;
  String get branch => _branch ?? '';
  bool hasBranch() => _branch != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "multiCounter" field.
  bool? _multiCounter;
  bool get multiCounter => _multiCounter ?? false;
  bool hasMultiCounter() => _multiCounter != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "renewalDate" field.
  int? _renewalDate;
  int get renewalDate => _renewalDate ?? 0;
  bool hasRenewalDate() => _renewalDate != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "businessType" field.
  DocumentReference? _businessType;
  DocumentReference? get businessType => _businessType;
  bool hasBusinessType() => _businessType != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "pincode" field.
  int? _pincode;
  int get pincode => _pincode ?? 0;
  bool hasPincode() => _pincode != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "fssaiLicenceNo" field.
  String? _fssaiLicenceNo;
  String get fssaiLicenceNo => _fssaiLicenceNo ?? '';
  bool hasFssaiLicenceNo() => _fssaiLicenceNo != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "businessMaster" field.
  DocumentReference? _businessMaster;
  DocumentReference? get businessMaster => _businessMaster;
  bool hasBusinessMaster() => _businessMaster != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "latLang" field.
  LatLng? _latLang;
  LatLng? get latLang => _latLang;
  bool hasLatLang() => _latLang != null;

  // "merchantId" field.
  String? _merchantId;
  String get merchantId => _merchantId ?? '';
  bool hasMerchantId() => _merchantId != null;

  // "merchantKey" field.
  String? _merchantKey;
  String get merchantKey => _merchantKey ?? '';
  bool hasMerchantKey() => _merchantKey != null;

  // "isProd" field.
  bool? _isProd;
  bool get isProd => _isProd ?? false;
  bool hasIsProd() => _isProd != null;

  // "billingType" field.
  String? _billingType;
  String get billingType => _billingType ?? '';
  bool hasBillingType() => _billingType != null;

  // "isDemo" field.
  bool? _isDemo;
  bool get isDemo => _isDemo ?? false;
  bool hasIsDemo() => _isDemo != null;

  // "dealerCode" field.
  String? _dealerCode;
  String get dealerCode => _dealerCode ?? '';
  bool hasDealerCode() => _dealerCode != null;

  void _initializeFields() {
    _branch = snapshotData['branch'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _multiCounter = snapshotData['multiCounter'] as bool?;
    _name = snapshotData['name'] as String?;
    _userId = snapshotData['userId'] as String?;
    _renewalDate = castToType<int>(snapshotData['renewalDate']);
    _id = snapshotData['id'] as String?;
    _businessType = snapshotData['businessType'] as DocumentReference?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _pincode = castToType<int>(snapshotData['pincode']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _fssaiLicenceNo = snapshotData['fssaiLicenceNo'] as String?;
    _active = snapshotData['active'] as bool?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _businessMaster = snapshotData['businessMaster'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _latLang = snapshotData['latLang'] as LatLng?;
    _merchantId = snapshotData['merchantId'] as String?;
    _merchantKey = snapshotData['merchantKey'] as String?;
    _isProd = snapshotData['isProd'] as bool?;
    _billingType = snapshotData['billingType'] as String?;
    _isDemo = snapshotData['isDemo'] as bool?;
    _dealerCode = snapshotData['dealerCode'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('OUTLET');

  static Stream<OutletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutletRecord.fromSnapshot(s));

  static Future<OutletRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OutletRecord.fromSnapshot(s));

  static OutletRecord fromSnapshot(DocumentSnapshot snapshot) => OutletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutletRecordData({
  String? branch,
  int? createdDate,
  bool? multiCounter,
  String? name,
  String? userId,
  int? renewalDate,
  String? id,
  DocumentReference? businessType,
  String? city,
  String? state,
  int? pincode,
  DocumentReference? userRef,
  String? fssaiLicenceNo,
  bool? active,
  DocumentReference? createdBy,
  DocumentReference? businessMaster,
  String? address,
  int? code,
  LatLng? latLang,
  String? merchantId,
  String? merchantKey,
  bool? isProd,
  String? billingType,
  bool? isDemo,
  String? dealerCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'branch': branch,
      'createdDate': createdDate,
      'multiCounter': multiCounter,
      'name': name,
      'userId': userId,
      'renewalDate': renewalDate,
      'id': id,
      'businessType': businessType,
      'city': city,
      'state': state,
      'pincode': pincode,
      'userRef': userRef,
      'fssaiLicenceNo': fssaiLicenceNo,
      'active': active,
      'createdBy': createdBy,
      'businessMaster': businessMaster,
      'address': address,
      'code': code,
      'latLang': latLang,
      'merchantId': merchantId,
      'merchantKey': merchantKey,
      'isProd': isProd,
      'billingType': billingType,
      'isDemo': isDemo,
      'dealerCode': dealerCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutletRecordDocumentEquality implements Equality<OutletRecord> {
  const OutletRecordDocumentEquality();

  @override
  bool equals(OutletRecord? e1, OutletRecord? e2) {
    return e1?.branch == e2?.branch &&
        e1?.createdDate == e2?.createdDate &&
        e1?.multiCounter == e2?.multiCounter &&
        e1?.name == e2?.name &&
        e1?.userId == e2?.userId &&
        e1?.renewalDate == e2?.renewalDate &&
        e1?.id == e2?.id &&
        e1?.businessType == e2?.businessType &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.pincode == e2?.pincode &&
        e1?.userRef == e2?.userRef &&
        e1?.fssaiLicenceNo == e2?.fssaiLicenceNo &&
        e1?.active == e2?.active &&
        e1?.createdBy == e2?.createdBy &&
        e1?.businessMaster == e2?.businessMaster &&
        e1?.address == e2?.address &&
        e1?.code == e2?.code &&
        e1?.latLang == e2?.latLang &&
        e1?.merchantId == e2?.merchantId &&
        e1?.merchantKey == e2?.merchantKey &&
        e1?.isProd == e2?.isProd &&
        e1?.billingType == e2?.billingType &&
        e1?.isDemo == e2?.isDemo &&
        e1?.dealerCode == e2?.dealerCode;
  }

  @override
  int hash(OutletRecord? e) => const ListEquality().hash([
        e?.branch,
        e?.createdDate,
        e?.multiCounter,
        e?.name,
        e?.userId,
        e?.renewalDate,
        e?.id,
        e?.businessType,
        e?.city,
        e?.state,
        e?.pincode,
        e?.userRef,
        e?.fssaiLicenceNo,
        e?.active,
        e?.createdBy,
        e?.businessMaster,
        e?.address,
        e?.code,
        e?.latLang,
        e?.merchantId,
        e?.merchantKey,
        e?.isProd,
        e?.billingType,
        e?.isDemo,
        e?.dealerCode
      ]);

  @override
  bool isValidKey(Object? o) => o is OutletRecord;
}
