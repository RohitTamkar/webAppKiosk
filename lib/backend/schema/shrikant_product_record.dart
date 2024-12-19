import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShrikantProductRecord extends FirestoreRecord {
  ShrikantProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "productImage" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _productName = snapshotData['productName'] as String?;
    _id = snapshotData['id'] as String?;
    _categoryName = snapshotData['categoryName'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _productImage = snapshotData['productImage'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shrikantProduct');

  static Stream<ShrikantProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShrikantProductRecord.fromSnapshot(s));

  static Future<ShrikantProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShrikantProductRecord.fromSnapshot(s));

  static ShrikantProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShrikantProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShrikantProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShrikantProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShrikantProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShrikantProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShrikantProductRecordData({
  String? productName,
  String? id,
  String? categoryName,
  double? quantity,
  String? productImage,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'productName': productName,
      'id': id,
      'categoryName': categoryName,
      'quantity': quantity,
      'productImage': productImage,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShrikantProductRecordDocumentEquality
    implements Equality<ShrikantProductRecord> {
  const ShrikantProductRecordDocumentEquality();

  @override
  bool equals(ShrikantProductRecord? e1, ShrikantProductRecord? e2) {
    return e1?.productName == e2?.productName &&
        e1?.id == e2?.id &&
        e1?.categoryName == e2?.categoryName &&
        e1?.quantity == e2?.quantity &&
        e1?.productImage == e2?.productImage &&
        e1?.price == e2?.price;
  }

  @override
  int hash(ShrikantProductRecord? e) => const ListEquality().hash([
        e?.productName,
        e?.id,
        e?.categoryName,
        e?.quantity,
        e?.productImage,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is ShrikantProductRecord;
}
