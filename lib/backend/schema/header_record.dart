import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeaderRecord extends FirestoreRecord {
  HeaderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "gstNo" field.
  String? _gstNo;
  String get gstNo => _gstNo ?? '';
  bool hasGstNo() => _gstNo != null;

  // "contactNo" field.
  String? _contactNo;
  String get contactNo => _contactNo ?? '';
  bool hasContactNo() => _contactNo != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "serialNo" field.
  String? _serialNo;
  String get serialNo => _serialNo ?? '';
  bool hasSerialNo() => _serialNo != null;

  // "taxInvoice" field.
  String? _taxInvoice;
  String get taxInvoice => _taxInvoice ?? '';
  bool hasTaxInvoice() => _taxInvoice != null;

  // "bankName" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  // "bankBranch" field.
  String? _bankBranch;
  String get bankBranch => _bankBranch ?? '';
  bool hasBankBranch() => _bankBranch != null;

  // "ifscCode" field.
  String? _ifscCode;
  String get ifscCode => _ifscCode ?? '';
  bool hasIfscCode() => _ifscCode != null;

  // "accountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "subtitleAddress" field.
  String? _subtitleAddress;
  String get subtitleAddress => _subtitleAddress ?? '';
  bool hasSubtitleAddress() => _subtitleAddress != null;

  // "logoImageUrl" field.
  String? _logoImageUrl;
  String get logoImageUrl => _logoImageUrl ?? '';
  bool hasLogoImageUrl() => _logoImageUrl != null;

  // "recepitLogoUrl" field.
  String? _recepitLogoUrl;
  String get recepitLogoUrl => _recepitLogoUrl ?? '';
  bool hasRecepitLogoUrl() => _recepitLogoUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _title = snapshotData['title'] as String?;
    _address = snapshotData['address'] as String?;
    _gstNo = snapshotData['gstNo'] as String?;
    _contactNo = snapshotData['contactNo'] as String?;
    _email = snapshotData['email'] as String?;
    _serialNo = snapshotData['serialNo'] as String?;
    _taxInvoice = snapshotData['taxInvoice'] as String?;
    _bankName = snapshotData['bankName'] as String?;
    _bankBranch = snapshotData['bankBranch'] as String?;
    _ifscCode = snapshotData['ifscCode'] as String?;
    _accountNumber = snapshotData['accountNumber'] as String?;
    _subtitleAddress = snapshotData['subtitleAddress'] as String?;
    _logoImageUrl = snapshotData['logoImageUrl'] as String?;
    _recepitLogoUrl = snapshotData['recepitLogoUrl'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('HEADER')
          : FirebaseFirestore.instance.collectionGroup('HEADER');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('HEADER').doc(id);

  static Stream<HeaderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HeaderRecord.fromSnapshot(s));

  static Future<HeaderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HeaderRecord.fromSnapshot(s));

  static HeaderRecord fromSnapshot(DocumentSnapshot snapshot) => HeaderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HeaderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HeaderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HeaderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HeaderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHeaderRecordData({
  String? id,
  String? title,
  String? address,
  String? gstNo,
  String? contactNo,
  String? email,
  String? serialNo,
  String? taxInvoice,
  String? bankName,
  String? bankBranch,
  String? ifscCode,
  String? accountNumber,
  String? subtitleAddress,
  String? logoImageUrl,
  String? recepitLogoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'title': title,
      'address': address,
      'gstNo': gstNo,
      'contactNo': contactNo,
      'email': email,
      'serialNo': serialNo,
      'taxInvoice': taxInvoice,
      'bankName': bankName,
      'bankBranch': bankBranch,
      'ifscCode': ifscCode,
      'accountNumber': accountNumber,
      'subtitleAddress': subtitleAddress,
      'logoImageUrl': logoImageUrl,
      'recepitLogoUrl': recepitLogoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class HeaderRecordDocumentEquality implements Equality<HeaderRecord> {
  const HeaderRecordDocumentEquality();

  @override
  bool equals(HeaderRecord? e1, HeaderRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.title == e2?.title &&
        e1?.address == e2?.address &&
        e1?.gstNo == e2?.gstNo &&
        e1?.contactNo == e2?.contactNo &&
        e1?.email == e2?.email &&
        e1?.serialNo == e2?.serialNo &&
        e1?.taxInvoice == e2?.taxInvoice &&
        e1?.bankName == e2?.bankName &&
        e1?.bankBranch == e2?.bankBranch &&
        e1?.ifscCode == e2?.ifscCode &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.subtitleAddress == e2?.subtitleAddress &&
        e1?.logoImageUrl == e2?.logoImageUrl &&
        e1?.recepitLogoUrl == e2?.recepitLogoUrl;
  }

  @override
  int hash(HeaderRecord? e) => const ListEquality().hash([
        e?.id,
        e?.title,
        e?.address,
        e?.gstNo,
        e?.contactNo,
        e?.email,
        e?.serialNo,
        e?.taxInvoice,
        e?.bankName,
        e?.bankBranch,
        e?.ifscCode,
        e?.accountNumber,
        e?.subtitleAddress,
        e?.logoImageUrl,
        e?.recepitLogoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is HeaderRecord;
}
