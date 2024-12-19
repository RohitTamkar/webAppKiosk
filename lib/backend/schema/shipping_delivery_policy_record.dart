import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingDeliveryPolicyRecord extends FirestoreRecord {
  ShippingDeliveryPolicyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "contains" field.
  String? _contains;
  String get contains => _contains ?? '';
  bool hasContains() => _contains != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _contains = snapshotData['contains'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Shipping_Delivery_Policy')
          : FirebaseFirestore.instance
              .collectionGroup('Shipping_Delivery_Policy');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Shipping_Delivery_Policy').doc(id);

  static Stream<ShippingDeliveryPolicyRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ShippingDeliveryPolicyRecord.fromSnapshot(s));

  static Future<ShippingDeliveryPolicyRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ShippingDeliveryPolicyRecord.fromSnapshot(s));

  static ShippingDeliveryPolicyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShippingDeliveryPolicyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShippingDeliveryPolicyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShippingDeliveryPolicyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShippingDeliveryPolicyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShippingDeliveryPolicyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShippingDeliveryPolicyRecordData({
  String? id,
  String? contains,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'contains': contains,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShippingDeliveryPolicyRecordDocumentEquality
    implements Equality<ShippingDeliveryPolicyRecord> {
  const ShippingDeliveryPolicyRecordDocumentEquality();

  @override
  bool equals(
      ShippingDeliveryPolicyRecord? e1, ShippingDeliveryPolicyRecord? e2) {
    return e1?.id == e2?.id && e1?.contains == e2?.contains;
  }

  @override
  int hash(ShippingDeliveryPolicyRecord? e) =>
      const ListEquality().hash([e?.id, e?.contains]);

  @override
  bool isValidKey(Object? o) => o is ShippingDeliveryPolicyRecord;
}
