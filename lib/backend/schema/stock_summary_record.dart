import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockSummaryRecord extends FirestoreRecord {
  StockSummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "updatedBy" field.
  String? _updatedBy;
  String get updatedBy => _updatedBy ?? '';
  bool hasUpdatedBy() => _updatedBy != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "productListMap" field.
  List<ProductListStockStruct>? _productListMap;
  List<ProductListStockStruct> get productListMap =>
      _productListMap ?? const [];
  bool hasProductListMap() => _productListMap != null;

  // "stockList" field.
  CartListStruct? _stockList;
  CartListStruct get stockList => _stockList ?? CartListStruct();
  bool hasStockList() => _stockList != null;

  // "createdByRef" field.
  DocumentReference? _createdByRef;
  DocumentReference? get createdByRef => _createdByRef;
  bool hasCreatedByRef() => _createdByRef != null;

  // "updatedByRef" field.
  DocumentReference? _updatedByRef;
  DocumentReference? get updatedByRef => _updatedByRef;
  bool hasUpdatedByRef() => _updatedByRef != null;

  // "requstedId" field.
  String? _requstedId;
  String get requstedId => _requstedId ?? '';
  bool hasRequstedId() => _requstedId != null;

  // "requstedStock" field.
  double? _requstedStock;
  double get requstedStock => _requstedStock ?? 0.0;
  bool hasRequstedStock() => _requstedStock != null;

  // "stockType" field.
  String? _stockType;
  String get stockType => _stockType ?? '';
  bool hasStockType() => _stockType != null;

  // "requstedCount" field.
  int? _requstedCount;
  int get requstedCount => _requstedCount ?? 0;
  bool hasRequstedCount() => _requstedCount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _status = snapshotData['status'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _monthId = snapshotData['monthId'] as String?;
    _updatedBy = snapshotData['updatedBy'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _updatedAt = snapshotData['updatedAt'] as DateTime?;
    _productListMap = getStructList(
      snapshotData['productListMap'],
      ProductListStockStruct.fromMap,
    );
    _stockList = snapshotData['stockList'] is CartListStruct
        ? snapshotData['stockList']
        : CartListStruct.maybeFromMap(snapshotData['stockList']);
    _createdByRef = snapshotData['createdByRef'] as DocumentReference?;
    _updatedByRef = snapshotData['updatedByRef'] as DocumentReference?;
    _requstedId = snapshotData['requstedId'] as String?;
    _requstedStock = castToType<double>(snapshotData['requstedStock']);
    _stockType = snapshotData['stockType'] as String?;
    _requstedCount = castToType<int>(snapshotData['requstedCount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('STOCK_SUMMARY')
          : FirebaseFirestore.instance.collectionGroup('STOCK_SUMMARY');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('STOCK_SUMMARY').doc(id);

  static Stream<StockSummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockSummaryRecord.fromSnapshot(s));

  static Future<StockSummaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockSummaryRecord.fromSnapshot(s));

  static StockSummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockSummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockSummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockSummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockSummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockSummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockSummaryRecordData({
  String? id,
  String? createdBy,
  String? status,
  String? dayId,
  String? monthId,
  String? updatedBy,
  DateTime? createdAt,
  DateTime? updatedAt,
  CartListStruct? stockList,
  DocumentReference? createdByRef,
  DocumentReference? updatedByRef,
  String? requstedId,
  double? requstedStock,
  String? stockType,
  int? requstedCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'createdBy': createdBy,
      'status': status,
      'dayId': dayId,
      'monthId': monthId,
      'updatedBy': updatedBy,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'stockList': CartListStruct().toMap(),
      'createdByRef': createdByRef,
      'updatedByRef': updatedByRef,
      'requstedId': requstedId,
      'requstedStock': requstedStock,
      'stockType': stockType,
      'requstedCount': requstedCount,
    }.withoutNulls,
  );

  // Handle nested data for "stockList" field.
  addCartListStructData(firestoreData, stockList, 'stockList');

  return firestoreData;
}

class StockSummaryRecordDocumentEquality
    implements Equality<StockSummaryRecord> {
  const StockSummaryRecordDocumentEquality();

  @override
  bool equals(StockSummaryRecord? e1, StockSummaryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.createdBy == e2?.createdBy &&
        e1?.status == e2?.status &&
        e1?.dayId == e2?.dayId &&
        e1?.monthId == e2?.monthId &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        listEquality.equals(e1?.productListMap, e2?.productListMap) &&
        e1?.stockList == e2?.stockList &&
        e1?.createdByRef == e2?.createdByRef &&
        e1?.updatedByRef == e2?.updatedByRef &&
        e1?.requstedId == e2?.requstedId &&
        e1?.requstedStock == e2?.requstedStock &&
        e1?.stockType == e2?.stockType &&
        e1?.requstedCount == e2?.requstedCount;
  }

  @override
  int hash(StockSummaryRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdBy,
        e?.status,
        e?.dayId,
        e?.monthId,
        e?.updatedBy,
        e?.createdAt,
        e?.updatedAt,
        e?.productListMap,
        e?.stockList,
        e?.createdByRef,
        e?.updatedByRef,
        e?.requstedId,
        e?.requstedStock,
        e?.stockType,
        e?.requstedCount
      ]);

  @override
  bool isValidKey(Object? o) => o is StockSummaryRecord;
}
