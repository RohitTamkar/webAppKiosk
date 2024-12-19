import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusinesssMasterRecord extends FirestoreRecord {
  BusinesssMasterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "businessType" field.
  DocumentReference? _businessType;
  DocumentReference? get businessType => _businessType;
  bool hasBusinessType() => _businessType != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  int? _phone;
  int get phone => _phone ?? 0;
  bool hasPhone() => _phone != null;

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

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

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

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _businessType = snapshotData['businessType'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = castToType<int>(snapshotData['phone']);
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _pincode = castToType<int>(snapshotData['pincode']);
    _active = snapshotData['active'] as bool?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _code = castToType<int>(snapshotData['code']);
    _address = snapshotData['address'] as String?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BUSINESSS_MASTER');

  static Stream<BusinesssMasterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusinesssMasterRecord.fromSnapshot(s));

  static Future<BusinesssMasterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusinesssMasterRecord.fromSnapshot(s));

  static BusinesssMasterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusinesssMasterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusinesssMasterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusinesssMasterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusinesssMasterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusinesssMasterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusinesssMasterRecordData({
  String? id,
  DocumentReference? businessType,
  String? name,
  String? mobile,
  String? email,
  int? phone,
  String? city,
  String? state,
  int? pincode,
  bool? active,
  int? createdDate,
  DocumentReference? createdBy,
  int? code,
  String? address,
  int? updatedDate,
  DocumentReference? updatedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'businessType': businessType,
      'name': name,
      'mobile': mobile,
      'email': email,
      'phone': phone,
      'city': city,
      'state': state,
      'pincode': pincode,
      'active': active,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'code': code,
      'address': address,
      'updatedDate': updatedDate,
      'updatedBy': updatedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusinesssMasterRecordDocumentEquality
    implements Equality<BusinesssMasterRecord> {
  const BusinesssMasterRecordDocumentEquality();

  @override
  bool equals(BusinesssMasterRecord? e1, BusinesssMasterRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.businessType == e2?.businessType &&
        e1?.name == e2?.name &&
        e1?.mobile == e2?.mobile &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.pincode == e2?.pincode &&
        e1?.active == e2?.active &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.code == e2?.code &&
        e1?.address == e2?.address &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.updatedBy == e2?.updatedBy;
  }

  @override
  int hash(BusinesssMasterRecord? e) => const ListEquality().hash([
        e?.id,
        e?.businessType,
        e?.name,
        e?.mobile,
        e?.email,
        e?.phone,
        e?.city,
        e?.state,
        e?.pincode,
        e?.active,
        e?.createdDate,
        e?.createdBy,
        e?.code,
        e?.address,
        e?.updatedDate,
        e?.updatedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is BusinesssMasterRecord;
}
