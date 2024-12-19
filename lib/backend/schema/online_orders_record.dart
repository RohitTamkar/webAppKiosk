import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnlineOrdersRecord extends FirestoreRecord {
  OnlineOrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "actionedAt" field.
  String? _actionedAt;
  String get actionedAt => _actionedAt ?? '';
  bool hasActionedAt() => _actionedAt != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  bool hasCreatedAt() => _createdAt != null;

  // "deliveryMode" field.
  String? _deliveryMode;
  String get deliveryMode => _deliveryMode ?? '';
  bool hasDeliveryMode() => _deliveryMode != null;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "orderValue" field.
  String? _orderValue;
  String get orderValue => _orderValue ?? '';
  bool hasOrderValue() => _orderValue != null;

  // "resId" field.
  String? _resId;
  String get resId => _resId ?? '';
  bool hasResId() => _resId != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "timestamp_unix" field.
  int? _timestampUnix;
  int get timestampUnix => _timestampUnix ?? 0;
  bool hasTimestampUnix() => _timestampUnix != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  bool hasUpdatedAt() => _updatedAt != null;

  // "vendor" field.
  String? _vendor;
  String get vendor => _vendor ?? '';
  bool hasVendor() => _vendor != null;

  // "totalCost" field.
  int? _totalCost;
  int get totalCost => _totalCost ?? 0;
  bool hasTotalCost() => _totalCost != null;

  void _initializeFields() {
    _actionedAt = snapshotData['actionedAt'] as String?;
    _createdAt = snapshotData['createdAt'] as String?;
    _deliveryMode = snapshotData['deliveryMode'] as String?;
    _orderId = snapshotData['orderId'] as String?;
    _orderValue = snapshotData['orderValue'] as String?;
    _resId = snapshotData['resId'] as String?;
    _state = snapshotData['state'] as String?;
    _status = snapshotData['status'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _timestampUnix = castToType<int>(snapshotData['timestamp_unix']);
    _updatedAt = snapshotData['updatedAt'] as String?;
    _vendor = snapshotData['vendor'] as String?;
    _totalCost = castToType<int>(snapshotData['totalCost']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ONLINE_ORDERS');

  static Stream<OnlineOrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnlineOrdersRecord.fromSnapshot(s));

  static Future<OnlineOrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OnlineOrdersRecord.fromSnapshot(s));

  static OnlineOrdersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnlineOrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnlineOrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnlineOrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnlineOrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnlineOrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnlineOrdersRecordData({
  String? actionedAt,
  String? createdAt,
  String? deliveryMode,
  String? orderId,
  String? orderValue,
  String? resId,
  String? state,
  String? status,
  DateTime? timestamp,
  int? timestampUnix,
  String? updatedAt,
  String? vendor,
  int? totalCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'actionedAt': actionedAt,
      'createdAt': createdAt,
      'deliveryMode': deliveryMode,
      'orderId': orderId,
      'orderValue': orderValue,
      'resId': resId,
      'state': state,
      'status': status,
      'timestamp': timestamp,
      'timestamp_unix': timestampUnix,
      'updatedAt': updatedAt,
      'vendor': vendor,
      'totalCost': totalCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnlineOrdersRecordDocumentEquality
    implements Equality<OnlineOrdersRecord> {
  const OnlineOrdersRecordDocumentEquality();

  @override
  bool equals(OnlineOrdersRecord? e1, OnlineOrdersRecord? e2) {
    return e1?.actionedAt == e2?.actionedAt &&
        e1?.createdAt == e2?.createdAt &&
        e1?.deliveryMode == e2?.deliveryMode &&
        e1?.orderId == e2?.orderId &&
        e1?.orderValue == e2?.orderValue &&
        e1?.resId == e2?.resId &&
        e1?.state == e2?.state &&
        e1?.status == e2?.status &&
        e1?.timestamp == e2?.timestamp &&
        e1?.timestampUnix == e2?.timestampUnix &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.vendor == e2?.vendor &&
        e1?.totalCost == e2?.totalCost;
  }

  @override
  int hash(OnlineOrdersRecord? e) => const ListEquality().hash([
        e?.actionedAt,
        e?.createdAt,
        e?.deliveryMode,
        e?.orderId,
        e?.orderValue,
        e?.resId,
        e?.state,
        e?.status,
        e?.timestamp,
        e?.timestampUnix,
        e?.updatedAt,
        e?.vendor,
        e?.totalCost
      ]);

  @override
  bool isValidKey(Object? o) => o is OnlineOrdersRecord;
}
