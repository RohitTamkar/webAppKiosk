import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrTransactionsRecord extends FirestoreRecord {
  QrTransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "event" field.
  String? _event;
  String get event => _event ?? '';
  bool hasEvent() => _event != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "posId" field.
  String? _posId;
  String get posId => _posId ?? '';
  bool hasPosId() => _posId != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "txAmount" field.
  double? _txAmount;
  double get txAmount => _txAmount ?? 0.0;
  bool hasTxAmount() => _txAmount != null;

  // "txId" field.
  String? _txId;
  String get txId => _txId ?? '';
  bool hasTxId() => _txId != null;

  // "txType" field.
  String? _txType;
  String get txType => _txType ?? '';
  bool hasTxType() => _txType != null;

  // "txDateTime" field.
  int? _txDateTime;
  int get txDateTime => _txDateTime ?? 0;
  bool hasTxDateTime() => _txDateTime != null;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  bool hasMsg() => _msg != null;

  // "refundAmount" field.
  double? _refundAmount;
  double get refundAmount => _refundAmount ?? 0.0;
  bool hasRefundAmount() => _refundAmount != null;

  // "refundStatus" field.
  bool? _refundStatus;
  bool get refundStatus => _refundStatus ?? false;
  bool hasRefundStatus() => _refundStatus != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "mid" field.
  String? _mid;
  String get mid => _mid ?? '';
  bool hasMid() => _mid != null;

  // "resJsonString" field.
  String? _resJsonString;
  String get resJsonString => _resJsonString ?? '';
  bool hasResJsonString() => _resJsonString != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "resultStatus" field.
  String? _resultStatus;
  String get resultStatus => _resultStatus ?? '';
  bool hasResultStatus() => _resultStatus != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _event = snapshotData['event'] as String?;
    _currency = snapshotData['currency'] as String?;
    _posId = snapshotData['posId'] as String?;
    _status = snapshotData['status'] as bool?;
    _txAmount = castToType<double>(snapshotData['txAmount']);
    _txId = snapshotData['txId'] as String?;
    _txType = snapshotData['txType'] as String?;
    _txDateTime = castToType<int>(snapshotData['txDateTime']);
    _orderId = snapshotData['orderId'] as String?;
    _msg = snapshotData['msg'] as String?;
    _refundAmount = castToType<double>(snapshotData['refundAmount']);
    _refundStatus = snapshotData['refundStatus'] as bool?;
    _mode = snapshotData['mode'] as String?;
    _bank = snapshotData['bank'] as String?;
    _mid = snapshotData['mid'] as String?;
    _resJsonString = snapshotData['resJsonString'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _resultStatus = snapshotData['resultStatus'] as String?;
    _dayId = snapshotData['dayId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('QR_TRANSACTIONS')
          : FirebaseFirestore.instance.collectionGroup('QR_TRANSACTIONS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('QR_TRANSACTIONS').doc(id);

  static Stream<QrTransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrTransactionsRecord.fromSnapshot(s));

  static Future<QrTransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrTransactionsRecord.fromSnapshot(s));

  static QrTransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QrTransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrTransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrTransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrTransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrTransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrTransactionsRecordData({
  String? id,
  String? event,
  String? currency,
  String? posId,
  bool? status,
  double? txAmount,
  String? txId,
  String? txType,
  int? txDateTime,
  String? orderId,
  String? msg,
  double? refundAmount,
  bool? refundStatus,
  String? mode,
  String? bank,
  String? mid,
  String? resJsonString,
  int? createdDate,
  String? resultStatus,
  String? dayId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'event': event,
      'currency': currency,
      'posId': posId,
      'status': status,
      'txAmount': txAmount,
      'txId': txId,
      'txType': txType,
      'txDateTime': txDateTime,
      'orderId': orderId,
      'msg': msg,
      'refundAmount': refundAmount,
      'refundStatus': refundStatus,
      'mode': mode,
      'bank': bank,
      'mid': mid,
      'resJsonString': resJsonString,
      'createdDate': createdDate,
      'resultStatus': resultStatus,
      'dayId': dayId,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrTransactionsRecordDocumentEquality
    implements Equality<QrTransactionsRecord> {
  const QrTransactionsRecordDocumentEquality();

  @override
  bool equals(QrTransactionsRecord? e1, QrTransactionsRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.event == e2?.event &&
        e1?.currency == e2?.currency &&
        e1?.posId == e2?.posId &&
        e1?.status == e2?.status &&
        e1?.txAmount == e2?.txAmount &&
        e1?.txId == e2?.txId &&
        e1?.txType == e2?.txType &&
        e1?.txDateTime == e2?.txDateTime &&
        e1?.orderId == e2?.orderId &&
        e1?.msg == e2?.msg &&
        e1?.refundAmount == e2?.refundAmount &&
        e1?.refundStatus == e2?.refundStatus &&
        e1?.mode == e2?.mode &&
        e1?.bank == e2?.bank &&
        e1?.mid == e2?.mid &&
        e1?.resJsonString == e2?.resJsonString &&
        e1?.createdDate == e2?.createdDate &&
        e1?.resultStatus == e2?.resultStatus &&
        e1?.dayId == e2?.dayId;
  }

  @override
  int hash(QrTransactionsRecord? e) => const ListEquality().hash([
        e?.id,
        e?.event,
        e?.currency,
        e?.posId,
        e?.status,
        e?.txAmount,
        e?.txId,
        e?.txType,
        e?.txDateTime,
        e?.orderId,
        e?.msg,
        e?.refundAmount,
        e?.refundStatus,
        e?.mode,
        e?.bank,
        e?.mid,
        e?.resJsonString,
        e?.createdDate,
        e?.resultStatus,
        e?.dayId
      ]);

  @override
  bool isValidKey(Object? o) => o is QrTransactionsRecord;
}
