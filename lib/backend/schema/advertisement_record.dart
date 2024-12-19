import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvertisementRecord extends FirestoreRecord {
  AdvertisementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _imageUrl = snapshotData['imageUrl'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ADVERTISEMENT')
          : FirebaseFirestore.instance.collectionGroup('ADVERTISEMENT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ADVERTISEMENT').doc(id);

  static Stream<AdvertisementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdvertisementRecord.fromSnapshot(s));

  static Future<AdvertisementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdvertisementRecord.fromSnapshot(s));

  static AdvertisementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdvertisementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvertisementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvertisementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvertisementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvertisementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdvertisementRecordData({
  String? id,
  int? code,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'code': code,
      'imageUrl': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdvertisementRecordDocumentEquality
    implements Equality<AdvertisementRecord> {
  const AdvertisementRecordDocumentEquality();

  @override
  bool equals(AdvertisementRecord? e1, AdvertisementRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.code == e2?.code &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(AdvertisementRecord? e) =>
      const ListEquality().hash([e?.id, e?.code, e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is AdvertisementRecord;
}
