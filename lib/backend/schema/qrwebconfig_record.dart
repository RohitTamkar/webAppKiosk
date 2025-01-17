import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrwebconfigRecord extends FirestoreRecord {
  QrwebconfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  bool hasDomain() => _domain != null;

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  bool hasOutletId() => _outletId != null;

  // "phonePeMid" field.
  String? _phonePeMid;
  String get phonePeMid => _phonePeMid ?? '';
  bool hasPhonePeMid() => _phonePeMid != null;

  // "phonePeMkey" field.
  String? _phonePeMkey;
  String get phonePeMkey => _phonePeMkey ?? '';
  bool hasPhonePeMkey() => _phonePeMkey != null;

  // "isProdWeb" field.
  bool? _isProdWeb;
  bool get isProdWeb => _isProdWeb ?? false;
  bool hasIsProdWeb() => _isProdWeb != null;

  // "redirectUrl" field.
  String? _redirectUrl;
  String get redirectUrl => _redirectUrl ?? '';
  bool hasRedirectUrl() => _redirectUrl != null;

  // "outletName" field.
  String? _outletName;
  String get outletName => _outletName ?? '';
  bool hasOutletName() => _outletName != null;

  // "paytmMkey" field.
  String? _paytmMkey;
  String get paytmMkey => _paytmMkey ?? '';
  bool hasPaytmMkey() => _paytmMkey != null;

  // "paytmMid" field.
  String? _paytmMid;
  String get paytmMid => _paytmMid ?? '';
  bool hasPaytmMid() => _paytmMid != null;

  void _initializeFields() {
    _domain = snapshotData['domain'] as String?;
    _outletId = snapshotData['outletId'] as String?;
    _phonePeMid = snapshotData['phonePeMid'] as String?;
    _phonePeMkey = snapshotData['phonePeMkey'] as String?;
    _isProdWeb = snapshotData['isProdWeb'] as bool?;
    _redirectUrl = snapshotData['redirectUrl'] as String?;
    _outletName = snapshotData['outletName'] as String?;
    _paytmMkey = snapshotData['paytmMkey'] as String?;
    _paytmMid = snapshotData['paytmMid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QRWEBCONFIG');

  static Stream<QrwebconfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrwebconfigRecord.fromSnapshot(s));

  static Future<QrwebconfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrwebconfigRecord.fromSnapshot(s));

  static QrwebconfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QrwebconfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrwebconfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrwebconfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrwebconfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrwebconfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrwebconfigRecordData({
  String? domain,
  String? outletId,
  String? phonePeMid,
  String? phonePeMkey,
  bool? isProdWeb,
  String? redirectUrl,
  String? outletName,
  String? paytmMkey,
  String? paytmMid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'domain': domain,
      'outletId': outletId,
      'phonePeMid': phonePeMid,
      'phonePeMkey': phonePeMkey,
      'isProdWeb': isProdWeb,
      'redirectUrl': redirectUrl,
      'outletName': outletName,
      'paytmMkey': paytmMkey,
      'paytmMid': paytmMid,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrwebconfigRecordDocumentEquality implements Equality<QrwebconfigRecord> {
  const QrwebconfigRecordDocumentEquality();

  @override
  bool equals(QrwebconfigRecord? e1, QrwebconfigRecord? e2) {
    return e1?.domain == e2?.domain &&
        e1?.outletId == e2?.outletId &&
        e1?.phonePeMid == e2?.phonePeMid &&
        e1?.phonePeMkey == e2?.phonePeMkey &&
        e1?.isProdWeb == e2?.isProdWeb &&
        e1?.redirectUrl == e2?.redirectUrl &&
        e1?.outletName == e2?.outletName &&
        e1?.paytmMkey == e2?.paytmMkey &&
        e1?.paytmMid == e2?.paytmMid;
  }

  @override
  int hash(QrwebconfigRecord? e) => const ListEquality().hash([
        e?.domain,
        e?.outletId,
        e?.phonePeMid,
        e?.phonePeMkey,
        e?.isProdWeb,
        e?.redirectUrl,
        e?.outletName,
        e?.paytmMkey,
        e?.paytmMid
      ]);

  @override
  bool isValidKey(Object? o) => o is QrwebconfigRecord;
}
