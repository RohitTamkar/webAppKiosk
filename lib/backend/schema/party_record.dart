import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PartyRecord extends FirestoreRecord {
  PartyRecord._(
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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "alternateNumber" field.
  String? _alternateNumber;
  String get alternateNumber => _alternateNumber ?? '';
  bool hasAlternateNumber() => _alternateNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "vehicleNo" field.
  String? _vehicleNo;
  String get vehicleNo => _vehicleNo ?? '';
  bool hasVehicleNo() => _vehicleNo != null;

  // "refName" field.
  String? _refName;
  String get refName => _refName ?? '';
  bool hasRefName() => _refName != null;

  // "adharCardNo" field.
  String? _adharCardNo;
  String get adharCardNo => _adharCardNo ?? '';
  bool hasAdharCardNo() => _adharCardNo != null;

  // "panCardNo" field.
  String? _panCardNo;
  String get panCardNo => _panCardNo ?? '';
  bool hasPanCardNo() => _panCardNo != null;

  // "gstNo" field.
  String? _gstNo;
  String get gstNo => _gstNo ?? '';
  bool hasGstNo() => _gstNo != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  bool hasPostalCode() => _postalCode != null;

  // "familySize" field.
  int? _familySize;
  int get familySize => _familySize ?? 0;
  bool hasFamilySize() => _familySize != null;

  // "anniversary" field.
  String? _anniversary;
  String get anniversary => _anniversary ?? '';
  bool hasAnniversary() => _anniversary != null;

  // "birthday" field.
  String? _birthday;
  String get birthday => _birthday ?? '';
  bool hasBirthday() => _birthday != null;

  // "oldBalance" field.
  int? _oldBalance;
  int get oldBalance => _oldBalance ?? 0;
  bool hasOldBalance() => _oldBalance != null;

  // "creditLimit" field.
  int? _creditLimit;
  int get creditLimit => _creditLimit ?? 0;
  bool hasCreditLimit() => _creditLimit != null;

  // "proofOfIdentity" field.
  String? _proofOfIdentity;
  String get proofOfIdentity => _proofOfIdentity ?? '';
  bool hasProofOfIdentity() => _proofOfIdentity != null;

  // "firmName" field.
  String? _firmName;
  String get firmName => _firmName ?? '';
  bool hasFirmName() => _firmName != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "extraDetails" field.
  String? _extraDetails;
  String get extraDetails => _extraDetails ?? '';
  bool hasExtraDetails() => _extraDetails != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "credit" field.
  bool? _credit;
  bool get credit => _credit ?? false;
  bool hasCredit() => _credit != null;

  // "firstVisit" field.
  String? _firstVisit;
  String get firstVisit => _firstVisit ?? '';
  bool hasFirstVisit() => _firstVisit != null;

  // "lastVisit" field.
  String? _lastVisit;
  String get lastVisit => _lastVisit ?? '';
  bool hasLastVisit() => _lastVisit != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "area" field.
  String? _area;
  String get area => _area ?? '';
  bool hasArea() => _area != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  bool hasBalance() => _balance != null;

  // "isDealer" field.
  bool? _isDealer;
  bool get isDealer => _isDealer ?? false;
  bool hasIsDealer() => _isDealer != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _type = snapshotData['type'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _address = snapshotData['address'] as String?;
    _alternateNumber = snapshotData['alternateNumber'] as String?;
    _email = snapshotData['email'] as String?;
    _vehicleNo = snapshotData['vehicleNo'] as String?;
    _refName = snapshotData['refName'] as String?;
    _adharCardNo = snapshotData['adharCardNo'] as String?;
    _panCardNo = snapshotData['panCardNo'] as String?;
    _gstNo = snapshotData['gstNo'] as String?;
    _city = snapshotData['city'] as String?;
    _postalCode = snapshotData['postalCode'] as String?;
    _familySize = castToType<int>(snapshotData['familySize']);
    _anniversary = snapshotData['anniversary'] as String?;
    _birthday = snapshotData['birthday'] as String?;
    _oldBalance = castToType<int>(snapshotData['oldBalance']);
    _creditLimit = castToType<int>(snapshotData['creditLimit']);
    _proofOfIdentity = snapshotData['proofOfIdentity'] as String?;
    _firmName = snapshotData['firmName'] as String?;
    _role = snapshotData['role'] as String?;
    _extraDetails = snapshotData['extraDetails'] as String?;
    _gender = snapshotData['gender'] as String?;
    _credit = snapshotData['credit'] as bool?;
    _firstVisit = snapshotData['firstVisit'] as String?;
    _lastVisit = snapshotData['lastVisit'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _state = snapshotData['state'] as String?;
    _area = snapshotData['area'] as String?;
    _country = snapshotData['country'] as String?;
    _balance = castToType<double>(snapshotData['balance']);
    _isDealer = snapshotData['isDealer'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PARTY')
          : FirebaseFirestore.instance.collectionGroup('PARTY');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PARTY').doc(id);

  static Stream<PartyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartyRecord.fromSnapshot(s));

  static Future<PartyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartyRecord.fromSnapshot(s));

  static PartyRecord fromSnapshot(DocumentSnapshot snapshot) => PartyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartyRecordData({
  String? id,
  String? name,
  String? type,
  String? mobile,
  String? address,
  String? alternateNumber,
  String? email,
  String? vehicleNo,
  String? refName,
  String? adharCardNo,
  String? panCardNo,
  String? gstNo,
  String? city,
  String? postalCode,
  int? familySize,
  String? anniversary,
  String? birthday,
  int? oldBalance,
  int? creditLimit,
  String? proofOfIdentity,
  String? firmName,
  String? role,
  String? extraDetails,
  String? gender,
  bool? credit,
  String? firstVisit,
  String? lastVisit,
  int? code,
  String? state,
  String? area,
  String? country,
  double? balance,
  bool? isDealer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'mobile': mobile,
      'address': address,
      'alternateNumber': alternateNumber,
      'email': email,
      'vehicleNo': vehicleNo,
      'refName': refName,
      'adharCardNo': adharCardNo,
      'panCardNo': panCardNo,
      'gstNo': gstNo,
      'city': city,
      'postalCode': postalCode,
      'familySize': familySize,
      'anniversary': anniversary,
      'birthday': birthday,
      'oldBalance': oldBalance,
      'creditLimit': creditLimit,
      'proofOfIdentity': proofOfIdentity,
      'firmName': firmName,
      'role': role,
      'extraDetails': extraDetails,
      'gender': gender,
      'credit': credit,
      'firstVisit': firstVisit,
      'lastVisit': lastVisit,
      'code': code,
      'state': state,
      'area': area,
      'country': country,
      'balance': balance,
      'isDealer': isDealer,
    }.withoutNulls,
  );

  return firestoreData;
}

class PartyRecordDocumentEquality implements Equality<PartyRecord> {
  const PartyRecordDocumentEquality();

  @override
  bool equals(PartyRecord? e1, PartyRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.type == e2?.type &&
        e1?.mobile == e2?.mobile &&
        e1?.address == e2?.address &&
        e1?.alternateNumber == e2?.alternateNumber &&
        e1?.email == e2?.email &&
        e1?.vehicleNo == e2?.vehicleNo &&
        e1?.refName == e2?.refName &&
        e1?.adharCardNo == e2?.adharCardNo &&
        e1?.panCardNo == e2?.panCardNo &&
        e1?.gstNo == e2?.gstNo &&
        e1?.city == e2?.city &&
        e1?.postalCode == e2?.postalCode &&
        e1?.familySize == e2?.familySize &&
        e1?.anniversary == e2?.anniversary &&
        e1?.birthday == e2?.birthday &&
        e1?.oldBalance == e2?.oldBalance &&
        e1?.creditLimit == e2?.creditLimit &&
        e1?.proofOfIdentity == e2?.proofOfIdentity &&
        e1?.firmName == e2?.firmName &&
        e1?.role == e2?.role &&
        e1?.extraDetails == e2?.extraDetails &&
        e1?.gender == e2?.gender &&
        e1?.credit == e2?.credit &&
        e1?.firstVisit == e2?.firstVisit &&
        e1?.lastVisit == e2?.lastVisit &&
        e1?.code == e2?.code &&
        e1?.state == e2?.state &&
        e1?.area == e2?.area &&
        e1?.country == e2?.country &&
        e1?.balance == e2?.balance &&
        e1?.isDealer == e2?.isDealer;
  }

  @override
  int hash(PartyRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.type,
        e?.mobile,
        e?.address,
        e?.alternateNumber,
        e?.email,
        e?.vehicleNo,
        e?.refName,
        e?.adharCardNo,
        e?.panCardNo,
        e?.gstNo,
        e?.city,
        e?.postalCode,
        e?.familySize,
        e?.anniversary,
        e?.birthday,
        e?.oldBalance,
        e?.creditLimit,
        e?.proofOfIdentity,
        e?.firmName,
        e?.role,
        e?.extraDetails,
        e?.gender,
        e?.credit,
        e?.firstVisit,
        e?.lastVisit,
        e?.code,
        e?.state,
        e?.area,
        e?.country,
        e?.balance,
        e?.isDealer
      ]);

  @override
  bool isValidKey(Object? o) => o is PartyRecord;
}
