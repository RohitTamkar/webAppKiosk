import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrintSettingsRecord extends FirestoreRecord {
  PrintSettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "barcodeOnBill" field.
  bool? _barcodeOnBill;
  bool get barcodeOnBill => _barcodeOnBill ?? false;
  bool hasBarcodeOnBill() => _barcodeOnBill != null;

  // "billRemark" field.
  bool? _billRemark;
  bool get billRemark => _billRemark ?? false;
  bool hasBillRemark() => _billRemark != null;

  // "cgstSgstOnBill" field.
  bool? _cgstSgstOnBill;
  bool get cgstSgstOnBill => _cgstSgstOnBill ?? false;
  bool hasCgstSgstOnBill() => _cgstSgstOnBill != null;

  // "columnProductNameAndQtyPrint" field.
  bool? _columnProductNameAndQtyPrint;
  bool get columnProductNameAndQtyPrint =>
      _columnProductNameAndQtyPrint ?? false;
  bool hasColumnProductNameAndQtyPrint() =>
      _columnProductNameAndQtyPrint != null;

  // "dontPrintBillnoInbill" field.
  bool? _dontPrintBillnoInbill;
  bool get dontPrintBillnoInbill => _dontPrintBillnoInbill ?? false;
  bool hasDontPrintBillnoInbill() => _dontPrintBillnoInbill != null;

  // "dontPrintRateColumn" field.
  bool? _dontPrintRateColumn;
  bool get dontPrintRateColumn => _dontPrintRateColumn ?? false;
  bool hasDontPrintRateColumn() => _dontPrintRateColumn != null;

  // "dontPrintSerialNoInbill" field.
  bool? _dontPrintSerialNoInbill;
  bool get dontPrintSerialNoInbill => _dontPrintSerialNoInbill ?? false;
  bool hasDontPrintSerialNoInbill() => _dontPrintSerialNoInbill != null;

  // "dontPrintTaxInvoiceOnBill" field.
  bool? _dontPrintTaxInvoiceOnBill;
  bool get dontPrintTaxInvoiceOnBill => _dontPrintTaxInvoiceOnBill ?? false;
  bool hasDontPrintTaxInvoiceOnBill() => _dontPrintTaxInvoiceOnBill != null;

  // "doubleprint" field.
  bool? _doubleprint;
  bool get doubleprint => _doubleprint ?? false;
  bool hasDoubleprint() => _doubleprint != null;

  // "duplicateBill" field.
  bool? _duplicateBill;
  bool get duplicateBill => _duplicateBill ?? false;
  bool hasDuplicateBill() => _duplicateBill != null;

  // "billPrintingServicesPointWise" field.
  bool? _billPrintingServicesPointWise;
  bool get billPrintingServicesPointWise =>
      _billPrintingServicesPointWise ?? false;
  bool hasBillPrintingServicesPointWise() =>
      _billPrintingServicesPointWise != null;

  // "largeBillFont" field.
  bool? _largeBillFont;
  bool get largeBillFont => _largeBillFont ?? false;
  bool hasLargeBillFont() => _largeBillFont != null;

  // "numberToWords" field.
  bool? _numberToWords;
  bool get numberToWords => _numberToWords ?? false;
  bool hasNumberToWords() => _numberToWords != null;

  // "signatureInBill" field.
  bool? _signatureInBill;
  bool get signatureInBill => _signatureInBill ?? false;
  bool hasSignatureInBill() => _signatureInBill != null;

  // "fontBoldNetTotal" field.
  bool? _fontBoldNetTotal;
  bool get fontBoldNetTotal => _fontBoldNetTotal ?? false;
  bool hasFontBoldNetTotal() => _fontBoldNetTotal != null;

  // "gstBreakUpOnBill" field.
  bool? _gstBreakUpOnBill;
  bool get gstBreakUpOnBill => _gstBreakUpOnBill ?? false;
  bool hasGstBreakUpOnBill() => _gstBreakUpOnBill != null;

  // "hsnNumber" field.
  bool? _hsnNumber;
  bool get hsnNumber => _hsnNumber ?? false;
  bool hasHsnNumber() => _hsnNumber != null;

  // "paymentModePrint" field.
  bool? _paymentModePrint;
  bool get paymentModePrint => _paymentModePrint ?? false;
  bool hasPaymentModePrint() => _paymentModePrint != null;

  // "printConsolidateTax" field.
  bool? _printConsolidateTax;
  bool get printConsolidateTax => _printConsolidateTax ?? false;
  bool hasPrintConsolidateTax() => _printConsolidateTax != null;

  // "printDiscountOnBill" field.
  bool? _printDiscountOnBill;
  bool get printDiscountOnBill => _printDiscountOnBill ?? false;
  bool hasPrintDiscountOnBill() => _printDiscountOnBill != null;

  // "printMrpPrice" field.
  bool? _printMrpPrice;
  bool get printMrpPrice => _printMrpPrice ?? false;
  bool hasPrintMrpPrice() => _printMrpPrice != null;

  // "printUnitTypeOnBill" field.
  bool? _printUnitTypeOnBill;
  bool get printUnitTypeOnBill => _printUnitTypeOnBill ?? false;
  bool hasPrintUnitTypeOnBill() => _printUnitTypeOnBill != null;

  // "printUserNameInBill" field.
  bool? _printUserNameInBill;
  bool get printUserNameInBill => _printUserNameInBill ?? false;
  bool hasPrintUserNameInBill() => _printUserNameInBill != null;

  // "productNameCut" field.
  bool? _productNameCut;
  bool get productNameCut => _productNameCut ?? false;
  bool hasProductNameCut() => _productNameCut != null;

  // "productSerialNumber" field.
  bool? _productSerialNumber;
  bool get productSerialNumber => _productSerialNumber ?? false;
  bool hasProductSerialNumber() => _productSerialNumber != null;

  // "regionalBillPrint" field.
  bool? _regionalBillPrint;
  bool get regionalBillPrint => _regionalBillPrint ?? false;
  bool hasRegionalBillPrint() => _regionalBillPrint != null;

  // "regionalKOTPrint" field.
  bool? _regionalKOTPrint;
  bool get regionalKOTPrint => _regionalKOTPrint ?? false;
  bool hasRegionalKOTPrint() => _regionalKOTPrint != null;

  // "saveMRPinBill" field.
  bool? _saveMRPinBill;
  bool get saveMRPinBill => _saveMRPinBill ?? false;
  bool hasSaveMRPinBill() => _saveMRPinBill != null;

  // "totalQtyInBill" field.
  bool? _totalQtyInBill;
  bool get totalQtyInBill => _totalQtyInBill ?? false;
  bool hasTotalQtyInBill() => _totalQtyInBill != null;

  // "trimNameForSingleLine" field.
  bool? _trimNameForSingleLine;
  bool get trimNameForSingleLine => _trimNameForSingleLine ?? false;
  bool hasTrimNameForSingleLine() => _trimNameForSingleLine != null;

  // "billAmountInWords" field.
  bool? _billAmountInWords;
  bool get billAmountInWords => _billAmountInWords ?? false;
  bool hasBillAmountInWords() => _billAmountInWords != null;

  // "couponKotSummary" field.
  bool? _couponKotSummary;
  bool get couponKotSummary => _couponKotSummary ?? false;
  bool hasCouponKotSummary() => _couponKotSummary != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _barcodeOnBill = snapshotData['barcodeOnBill'] as bool?;
    _billRemark = snapshotData['billRemark'] as bool?;
    _cgstSgstOnBill = snapshotData['cgstSgstOnBill'] as bool?;
    _columnProductNameAndQtyPrint =
        snapshotData['columnProductNameAndQtyPrint'] as bool?;
    _dontPrintBillnoInbill = snapshotData['dontPrintBillnoInbill'] as bool?;
    _dontPrintRateColumn = snapshotData['dontPrintRateColumn'] as bool?;
    _dontPrintSerialNoInbill = snapshotData['dontPrintSerialNoInbill'] as bool?;
    _dontPrintTaxInvoiceOnBill =
        snapshotData['dontPrintTaxInvoiceOnBill'] as bool?;
    _doubleprint = snapshotData['doubleprint'] as bool?;
    _duplicateBill = snapshotData['duplicateBill'] as bool?;
    _billPrintingServicesPointWise =
        snapshotData['billPrintingServicesPointWise'] as bool?;
    _largeBillFont = snapshotData['largeBillFont'] as bool?;
    _numberToWords = snapshotData['numberToWords'] as bool?;
    _signatureInBill = snapshotData['signatureInBill'] as bool?;
    _fontBoldNetTotal = snapshotData['fontBoldNetTotal'] as bool?;
    _gstBreakUpOnBill = snapshotData['gstBreakUpOnBill'] as bool?;
    _hsnNumber = snapshotData['hsnNumber'] as bool?;
    _paymentModePrint = snapshotData['paymentModePrint'] as bool?;
    _printConsolidateTax = snapshotData['printConsolidateTax'] as bool?;
    _printDiscountOnBill = snapshotData['printDiscountOnBill'] as bool?;
    _printMrpPrice = snapshotData['printMrpPrice'] as bool?;
    _printUnitTypeOnBill = snapshotData['printUnitTypeOnBill'] as bool?;
    _printUserNameInBill = snapshotData['printUserNameInBill'] as bool?;
    _productNameCut = snapshotData['productNameCut'] as bool?;
    _productSerialNumber = snapshotData['productSerialNumber'] as bool?;
    _regionalBillPrint = snapshotData['regionalBillPrint'] as bool?;
    _regionalKOTPrint = snapshotData['regionalKOTPrint'] as bool?;
    _saveMRPinBill = snapshotData['saveMRPinBill'] as bool?;
    _totalQtyInBill = snapshotData['totalQtyInBill'] as bool?;
    _trimNameForSingleLine = snapshotData['trimNameForSingleLine'] as bool?;
    _billAmountInWords = snapshotData['billAmountInWords'] as bool?;
    _couponKotSummary = snapshotData['couponKotSummary'] as bool?;
    _code = castToType<int>(snapshotData['code']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PRINT_SETTINGS')
          : FirebaseFirestore.instance.collectionGroup('PRINT_SETTINGS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PRINT_SETTINGS').doc(id);

  static Stream<PrintSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrintSettingsRecord.fromSnapshot(s));

  static Future<PrintSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrintSettingsRecord.fromSnapshot(s));

  static PrintSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrintSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrintSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrintSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrintSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrintSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrintSettingsRecordData({
  bool? barcodeOnBill,
  bool? billRemark,
  bool? cgstSgstOnBill,
  bool? columnProductNameAndQtyPrint,
  bool? dontPrintBillnoInbill,
  bool? dontPrintRateColumn,
  bool? dontPrintSerialNoInbill,
  bool? dontPrintTaxInvoiceOnBill,
  bool? doubleprint,
  bool? duplicateBill,
  bool? billPrintingServicesPointWise,
  bool? largeBillFont,
  bool? numberToWords,
  bool? signatureInBill,
  bool? fontBoldNetTotal,
  bool? gstBreakUpOnBill,
  bool? hsnNumber,
  bool? paymentModePrint,
  bool? printConsolidateTax,
  bool? printDiscountOnBill,
  bool? printMrpPrice,
  bool? printUnitTypeOnBill,
  bool? printUserNameInBill,
  bool? productNameCut,
  bool? productSerialNumber,
  bool? regionalBillPrint,
  bool? regionalKOTPrint,
  bool? saveMRPinBill,
  bool? totalQtyInBill,
  bool? trimNameForSingleLine,
  bool? billAmountInWords,
  bool? couponKotSummary,
  int? code,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barcodeOnBill': barcodeOnBill,
      'billRemark': billRemark,
      'cgstSgstOnBill': cgstSgstOnBill,
      'columnProductNameAndQtyPrint': columnProductNameAndQtyPrint,
      'dontPrintBillnoInbill': dontPrintBillnoInbill,
      'dontPrintRateColumn': dontPrintRateColumn,
      'dontPrintSerialNoInbill': dontPrintSerialNoInbill,
      'dontPrintTaxInvoiceOnBill': dontPrintTaxInvoiceOnBill,
      'doubleprint': doubleprint,
      'duplicateBill': duplicateBill,
      'billPrintingServicesPointWise': billPrintingServicesPointWise,
      'largeBillFont': largeBillFont,
      'numberToWords': numberToWords,
      'signatureInBill': signatureInBill,
      'fontBoldNetTotal': fontBoldNetTotal,
      'gstBreakUpOnBill': gstBreakUpOnBill,
      'hsnNumber': hsnNumber,
      'paymentModePrint': paymentModePrint,
      'printConsolidateTax': printConsolidateTax,
      'printDiscountOnBill': printDiscountOnBill,
      'printMrpPrice': printMrpPrice,
      'printUnitTypeOnBill': printUnitTypeOnBill,
      'printUserNameInBill': printUserNameInBill,
      'productNameCut': productNameCut,
      'productSerialNumber': productSerialNumber,
      'regionalBillPrint': regionalBillPrint,
      'regionalKOTPrint': regionalKOTPrint,
      'saveMRPinBill': saveMRPinBill,
      'totalQtyInBill': totalQtyInBill,
      'trimNameForSingleLine': trimNameForSingleLine,
      'billAmountInWords': billAmountInWords,
      'couponKotSummary': couponKotSummary,
      'code': code,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrintSettingsRecordDocumentEquality
    implements Equality<PrintSettingsRecord> {
  const PrintSettingsRecordDocumentEquality();

  @override
  bool equals(PrintSettingsRecord? e1, PrintSettingsRecord? e2) {
    return e1?.barcodeOnBill == e2?.barcodeOnBill &&
        e1?.billRemark == e2?.billRemark &&
        e1?.cgstSgstOnBill == e2?.cgstSgstOnBill &&
        e1?.columnProductNameAndQtyPrint == e2?.columnProductNameAndQtyPrint &&
        e1?.dontPrintBillnoInbill == e2?.dontPrintBillnoInbill &&
        e1?.dontPrintRateColumn == e2?.dontPrintRateColumn &&
        e1?.dontPrintSerialNoInbill == e2?.dontPrintSerialNoInbill &&
        e1?.dontPrintTaxInvoiceOnBill == e2?.dontPrintTaxInvoiceOnBill &&
        e1?.doubleprint == e2?.doubleprint &&
        e1?.duplicateBill == e2?.duplicateBill &&
        e1?.billPrintingServicesPointWise ==
            e2?.billPrintingServicesPointWise &&
        e1?.largeBillFont == e2?.largeBillFont &&
        e1?.numberToWords == e2?.numberToWords &&
        e1?.signatureInBill == e2?.signatureInBill &&
        e1?.fontBoldNetTotal == e2?.fontBoldNetTotal &&
        e1?.gstBreakUpOnBill == e2?.gstBreakUpOnBill &&
        e1?.hsnNumber == e2?.hsnNumber &&
        e1?.paymentModePrint == e2?.paymentModePrint &&
        e1?.printConsolidateTax == e2?.printConsolidateTax &&
        e1?.printDiscountOnBill == e2?.printDiscountOnBill &&
        e1?.printMrpPrice == e2?.printMrpPrice &&
        e1?.printUnitTypeOnBill == e2?.printUnitTypeOnBill &&
        e1?.printUserNameInBill == e2?.printUserNameInBill &&
        e1?.productNameCut == e2?.productNameCut &&
        e1?.productSerialNumber == e2?.productSerialNumber &&
        e1?.regionalBillPrint == e2?.regionalBillPrint &&
        e1?.regionalKOTPrint == e2?.regionalKOTPrint &&
        e1?.saveMRPinBill == e2?.saveMRPinBill &&
        e1?.totalQtyInBill == e2?.totalQtyInBill &&
        e1?.trimNameForSingleLine == e2?.trimNameForSingleLine &&
        e1?.billAmountInWords == e2?.billAmountInWords &&
        e1?.couponKotSummary == e2?.couponKotSummary &&
        e1?.code == e2?.code;
  }

  @override
  int hash(PrintSettingsRecord? e) => const ListEquality().hash([
        e?.barcodeOnBill,
        e?.billRemark,
        e?.cgstSgstOnBill,
        e?.columnProductNameAndQtyPrint,
        e?.dontPrintBillnoInbill,
        e?.dontPrintRateColumn,
        e?.dontPrintSerialNoInbill,
        e?.dontPrintTaxInvoiceOnBill,
        e?.doubleprint,
        e?.duplicateBill,
        e?.billPrintingServicesPointWise,
        e?.largeBillFont,
        e?.numberToWords,
        e?.signatureInBill,
        e?.fontBoldNetTotal,
        e?.gstBreakUpOnBill,
        e?.hsnNumber,
        e?.paymentModePrint,
        e?.printConsolidateTax,
        e?.printDiscountOnBill,
        e?.printMrpPrice,
        e?.printUnitTypeOnBill,
        e?.printUserNameInBill,
        e?.productNameCut,
        e?.productSerialNumber,
        e?.regionalBillPrint,
        e?.regionalKOTPrint,
        e?.saveMRPinBill,
        e?.totalQtyInBill,
        e?.trimNameForSingleLine,
        e?.billAmountInWords,
        e?.couponKotSummary,
        e?.code
      ]);

  @override
  bool isValidKey(Object? o) => o is PrintSettingsRecord;
}
