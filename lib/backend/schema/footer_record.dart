import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FooterRecord extends FirestoreRecord {
  FooterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "footerText1" field.
  String? _footerText1;
  String get footerText1 => _footerText1 ?? '';
  bool hasFooterText1() => _footerText1 != null;

  // "footerText2" field.
  String? _footerText2;
  String get footerText2 => _footerText2 ?? '';
  bool hasFooterText2() => _footerText2 != null;

  // "footerText3" field.
  String? _footerText3;
  String get footerText3 => _footerText3 ?? '';
  bool hasFooterText3() => _footerText3 != null;

  // "footerText4" field.
  String? _footerText4;
  String get footerText4 => _footerText4 ?? '';
  bool hasFooterText4() => _footerText4 != null;

  // "footerText5" field.
  String? _footerText5;
  String get footerText5 => _footerText5 ?? '';
  bool hasFooterText5() => _footerText5 != null;

  // "isPrintOnBill" field.
  bool? _isPrintOnBill;
  bool get isPrintOnBill => _isPrintOnBill ?? false;
  bool hasIsPrintOnBill() => _isPrintOnBill != null;

  // "parcelCharges" field.
  double? _parcelCharges;
  double get parcelCharges => _parcelCharges ?? 0.0;
  bool hasParcelCharges() => _parcelCharges != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _footerText1 = snapshotData['footerText1'] as String?;
    _footerText2 = snapshotData['footerText2'] as String?;
    _footerText3 = snapshotData['footerText3'] as String?;
    _footerText4 = snapshotData['footerText4'] as String?;
    _footerText5 = snapshotData['footerText5'] as String?;
    _isPrintOnBill = snapshotData['isPrintOnBill'] as bool?;
    _parcelCharges = castToType<double>(snapshotData['parcelCharges']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('FOOTER')
          : FirebaseFirestore.instance.collectionGroup('FOOTER');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('FOOTER').doc(id);

  static Stream<FooterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FooterRecord.fromSnapshot(s));

  static Future<FooterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FooterRecord.fromSnapshot(s));

  static FooterRecord fromSnapshot(DocumentSnapshot snapshot) => FooterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FooterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FooterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FooterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FooterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFooterRecordData({
  String? id,
  String? footerText1,
  String? footerText2,
  String? footerText3,
  String? footerText4,
  String? footerText5,
  bool? isPrintOnBill,
  double? parcelCharges,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'footerText1': footerText1,
      'footerText2': footerText2,
      'footerText3': footerText3,
      'footerText4': footerText4,
      'footerText5': footerText5,
      'isPrintOnBill': isPrintOnBill,
      'parcelCharges': parcelCharges,
    }.withoutNulls,
  );

  return firestoreData;
}

class FooterRecordDocumentEquality implements Equality<FooterRecord> {
  const FooterRecordDocumentEquality();

  @override
  bool equals(FooterRecord? e1, FooterRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.footerText1 == e2?.footerText1 &&
        e1?.footerText2 == e2?.footerText2 &&
        e1?.footerText3 == e2?.footerText3 &&
        e1?.footerText4 == e2?.footerText4 &&
        e1?.footerText5 == e2?.footerText5 &&
        e1?.isPrintOnBill == e2?.isPrintOnBill &&
        e1?.parcelCharges == e2?.parcelCharges;
  }

  @override
  int hash(FooterRecord? e) => const ListEquality().hash([
        e?.id,
        e?.footerText1,
        e?.footerText2,
        e?.footerText3,
        e?.footerText4,
        e?.footerText5,
        e?.isPrintOnBill,
        e?.parcelCharges
      ]);

  @override
  bool isValidKey(Object? o) => o is FooterRecord;
}
