// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoiceStructStruct extends FFFirebaseStruct {
  InvoiceStructStruct({
    String? id,
    String? invoice,
    String? party,
    String? products,
    int? invoiceDate,
    String? paymentMode,
    String? dayId,
    double? discountAmt,
    double? discountPer,
    double? delliveryChrg,
    double? taxAmt,
    double? billAmt,
    double? finalBillAmt,
    int? createdDate,
    int? updatedDate,
    double? roundOff,
    String? updatedBy,
    int? code,
    String? shiftId,
    String? partyMobNo,
    String? createdBy,
    List<SelItemListStruct>? productList,
    bool? synC,
    int? hivekey,
    int? version,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _invoice = invoice,
        _party = party,
        _products = products,
        _invoiceDate = invoiceDate,
        _paymentMode = paymentMode,
        _dayId = dayId,
        _discountAmt = discountAmt,
        _discountPer = discountPer,
        _delliveryChrg = delliveryChrg,
        _taxAmt = taxAmt,
        _billAmt = billAmt,
        _finalBillAmt = finalBillAmt,
        _createdDate = createdDate,
        _updatedDate = updatedDate,
        _roundOff = roundOff,
        _updatedBy = updatedBy,
        _code = code,
        _shiftId = shiftId,
        _partyMobNo = partyMobNo,
        _createdBy = createdBy,
        _productList = productList,
        _synC = synC,
        _hivekey = hivekey,
        _version = version,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "invoice" field.
  String? _invoice;
  String get invoice => _invoice ?? '';
  set invoice(String? val) => _invoice = val;

  bool hasInvoice() => _invoice != null;

  // "party" field.
  String? _party;
  String get party => _party ?? '';
  set party(String? val) => _party = val;

  bool hasParty() => _party != null;

  // "products" field.
  String? _products;
  String get products => _products ?? '';
  set products(String? val) => _products = val;

  bool hasProducts() => _products != null;

  // "invoiceDate" field.
  int? _invoiceDate;
  int get invoiceDate => _invoiceDate ?? 0;
  set invoiceDate(int? val) => _invoiceDate = val;

  void incrementInvoiceDate(int amount) => invoiceDate = invoiceDate + amount;

  bool hasInvoiceDate() => _invoiceDate != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  set paymentMode(String? val) => _paymentMode = val;

  bool hasPaymentMode() => _paymentMode != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  set dayId(String? val) => _dayId = val;

  bool hasDayId() => _dayId != null;

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  set discountAmt(double? val) => _discountAmt = val;

  void incrementDiscountAmt(double amount) =>
      discountAmt = discountAmt + amount;

  bool hasDiscountAmt() => _discountAmt != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  set discountPer(double? val) => _discountPer = val;

  void incrementDiscountPer(double amount) =>
      discountPer = discountPer + amount;

  bool hasDiscountPer() => _discountPer != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  set delliveryChrg(double? val) => _delliveryChrg = val;

  void incrementDelliveryChrg(double amount) =>
      delliveryChrg = delliveryChrg + amount;

  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  set taxAmt(double? val) => _taxAmt = val;

  void incrementTaxAmt(double amount) => taxAmt = taxAmt + amount;

  bool hasTaxAmt() => _taxAmt != null;

  // "billAmt" field.
  double? _billAmt;
  double get billAmt => _billAmt ?? 0.0;
  set billAmt(double? val) => _billAmt = val;

  void incrementBillAmt(double amount) => billAmt = billAmt + amount;

  bool hasBillAmt() => _billAmt != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  set finalBillAmt(double? val) => _finalBillAmt = val;

  void incrementFinalBillAmt(double amount) =>
      finalBillAmt = finalBillAmt + amount;

  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  set createdDate(int? val) => _createdDate = val;

  void incrementCreatedDate(int amount) => createdDate = createdDate + amount;

  bool hasCreatedDate() => _createdDate != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  set updatedDate(int? val) => _updatedDate = val;

  void incrementUpdatedDate(int amount) => updatedDate = updatedDate + amount;

  bool hasUpdatedDate() => _updatedDate != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  set roundOff(double? val) => _roundOff = val;

  void incrementRoundOff(double amount) => roundOff = roundOff + amount;

  bool hasRoundOff() => _roundOff != null;

  // "updatedBy" field.
  String? _updatedBy;
  String get updatedBy => _updatedBy ?? '';
  set updatedBy(String? val) => _updatedBy = val;

  bool hasUpdatedBy() => _updatedBy != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "shiftId" field.
  String? _shiftId;
  String get shiftId => _shiftId ?? '';
  set shiftId(String? val) => _shiftId = val;

  bool hasShiftId() => _shiftId != null;

  // "partyMobNo" field.
  String? _partyMobNo;
  String get partyMobNo => _partyMobNo ?? '';
  set partyMobNo(String? val) => _partyMobNo = val;

  bool hasPartyMobNo() => _partyMobNo != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  set createdBy(String? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "productList" field.
  List<SelItemListStruct>? _productList;
  List<SelItemListStruct> get productList => _productList ?? const [];
  set productList(List<SelItemListStruct>? val) => _productList = val;

  void updateProductList(Function(List<SelItemListStruct>) updateFn) {
    updateFn(_productList ??= []);
  }

  bool hasProductList() => _productList != null;

  // "synC" field.
  bool? _synC;
  bool get synC => _synC ?? false;
  set synC(bool? val) => _synC = val;

  bool hasSynC() => _synC != null;

  // "hivekey" field.
  int? _hivekey;
  int get hivekey => _hivekey ?? 0;
  set hivekey(int? val) => _hivekey = val;

  void incrementHivekey(int amount) => hivekey = hivekey + amount;

  bool hasHivekey() => _hivekey != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  set version(int? val) => _version = val;

  void incrementVersion(int amount) => version = version + amount;

  bool hasVersion() => _version != null;

  static InvoiceStructStruct fromMap(Map<String, dynamic> data) =>
      InvoiceStructStruct(
        id: data['id'] as String?,
        invoice: data['invoice'] as String?,
        party: data['party'] as String?,
        products: data['products'] as String?,
        invoiceDate: castToType<int>(data['invoiceDate']),
        paymentMode: data['paymentMode'] as String?,
        dayId: data['dayId'] as String?,
        discountAmt: castToType<double>(data['discountAmt']),
        discountPer: castToType<double>(data['discountPer']),
        delliveryChrg: castToType<double>(data['delliveryChrg']),
        taxAmt: castToType<double>(data['taxAmt']),
        billAmt: castToType<double>(data['billAmt']),
        finalBillAmt: castToType<double>(data['finalBillAmt']),
        createdDate: castToType<int>(data['createdDate']),
        updatedDate: castToType<int>(data['updatedDate']),
        roundOff: castToType<double>(data['roundOff']),
        updatedBy: data['updatedBy'] as String?,
        code: castToType<int>(data['code']),
        shiftId: data['shiftId'] as String?,
        partyMobNo: data['partyMobNo'] as String?,
        createdBy: data['createdBy'] as String?,
        productList: getStructList(
          data['productList'],
          SelItemListStruct.fromMap,
        ),
        synC: data['synC'] as bool?,
        hivekey: castToType<int>(data['hivekey']),
        version: castToType<int>(data['version']),
      );

  static InvoiceStructStruct? maybeFromMap(dynamic data) => data is Map
      ? InvoiceStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'invoice': _invoice,
        'party': _party,
        'products': _products,
        'invoiceDate': _invoiceDate,
        'paymentMode': _paymentMode,
        'dayId': _dayId,
        'discountAmt': _discountAmt,
        'discountPer': _discountPer,
        'delliveryChrg': _delliveryChrg,
        'taxAmt': _taxAmt,
        'billAmt': _billAmt,
        'finalBillAmt': _finalBillAmt,
        'createdDate': _createdDate,
        'updatedDate': _updatedDate,
        'roundOff': _roundOff,
        'updatedBy': _updatedBy,
        'code': _code,
        'shiftId': _shiftId,
        'partyMobNo': _partyMobNo,
        'createdBy': _createdBy,
        'productList': _productList?.map((e) => e.toMap()).toList(),
        'synC': _synC,
        'hivekey': _hivekey,
        'version': _version,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'invoice': serializeParam(
          _invoice,
          ParamType.String,
        ),
        'party': serializeParam(
          _party,
          ParamType.String,
        ),
        'products': serializeParam(
          _products,
          ParamType.String,
        ),
        'invoiceDate': serializeParam(
          _invoiceDate,
          ParamType.int,
        ),
        'paymentMode': serializeParam(
          _paymentMode,
          ParamType.String,
        ),
        'dayId': serializeParam(
          _dayId,
          ParamType.String,
        ),
        'discountAmt': serializeParam(
          _discountAmt,
          ParamType.double,
        ),
        'discountPer': serializeParam(
          _discountPer,
          ParamType.double,
        ),
        'delliveryChrg': serializeParam(
          _delliveryChrg,
          ParamType.double,
        ),
        'taxAmt': serializeParam(
          _taxAmt,
          ParamType.double,
        ),
        'billAmt': serializeParam(
          _billAmt,
          ParamType.double,
        ),
        'finalBillAmt': serializeParam(
          _finalBillAmt,
          ParamType.double,
        ),
        'createdDate': serializeParam(
          _createdDate,
          ParamType.int,
        ),
        'updatedDate': serializeParam(
          _updatedDate,
          ParamType.int,
        ),
        'roundOff': serializeParam(
          _roundOff,
          ParamType.double,
        ),
        'updatedBy': serializeParam(
          _updatedBy,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'shiftId': serializeParam(
          _shiftId,
          ParamType.String,
        ),
        'partyMobNo': serializeParam(
          _partyMobNo,
          ParamType.String,
        ),
        'createdBy': serializeParam(
          _createdBy,
          ParamType.String,
        ),
        'productList': serializeParam(
          _productList,
          ParamType.DataStruct,
          isList: true,
        ),
        'synC': serializeParam(
          _synC,
          ParamType.bool,
        ),
        'hivekey': serializeParam(
          _hivekey,
          ParamType.int,
        ),
        'version': serializeParam(
          _version,
          ParamType.int,
        ),
      }.withoutNulls;

  static InvoiceStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvoiceStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        invoice: deserializeParam(
          data['invoice'],
          ParamType.String,
          false,
        ),
        party: deserializeParam(
          data['party'],
          ParamType.String,
          false,
        ),
        products: deserializeParam(
          data['products'],
          ParamType.String,
          false,
        ),
        invoiceDate: deserializeParam(
          data['invoiceDate'],
          ParamType.int,
          false,
        ),
        paymentMode: deserializeParam(
          data['paymentMode'],
          ParamType.String,
          false,
        ),
        dayId: deserializeParam(
          data['dayId'],
          ParamType.String,
          false,
        ),
        discountAmt: deserializeParam(
          data['discountAmt'],
          ParamType.double,
          false,
        ),
        discountPer: deserializeParam(
          data['discountPer'],
          ParamType.double,
          false,
        ),
        delliveryChrg: deserializeParam(
          data['delliveryChrg'],
          ParamType.double,
          false,
        ),
        taxAmt: deserializeParam(
          data['taxAmt'],
          ParamType.double,
          false,
        ),
        billAmt: deserializeParam(
          data['billAmt'],
          ParamType.double,
          false,
        ),
        finalBillAmt: deserializeParam(
          data['finalBillAmt'],
          ParamType.double,
          false,
        ),
        createdDate: deserializeParam(
          data['createdDate'],
          ParamType.int,
          false,
        ),
        updatedDate: deserializeParam(
          data['updatedDate'],
          ParamType.int,
          false,
        ),
        roundOff: deserializeParam(
          data['roundOff'],
          ParamType.double,
          false,
        ),
        updatedBy: deserializeParam(
          data['updatedBy'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        shiftId: deserializeParam(
          data['shiftId'],
          ParamType.String,
          false,
        ),
        partyMobNo: deserializeParam(
          data['partyMobNo'],
          ParamType.String,
          false,
        ),
        createdBy: deserializeParam(
          data['createdBy'],
          ParamType.String,
          false,
        ),
        productList: deserializeStructParam<SelItemListStruct>(
          data['productList'],
          ParamType.DataStruct,
          true,
          structBuilder: SelItemListStruct.fromSerializableMap,
        ),
        synC: deserializeParam(
          data['synC'],
          ParamType.bool,
          false,
        ),
        hivekey: deserializeParam(
          data['hivekey'],
          ParamType.int,
          false,
        ),
        version: deserializeParam(
          data['version'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'InvoiceStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InvoiceStructStruct &&
        id == other.id &&
        invoice == other.invoice &&
        party == other.party &&
        products == other.products &&
        invoiceDate == other.invoiceDate &&
        paymentMode == other.paymentMode &&
        dayId == other.dayId &&
        discountAmt == other.discountAmt &&
        discountPer == other.discountPer &&
        delliveryChrg == other.delliveryChrg &&
        taxAmt == other.taxAmt &&
        billAmt == other.billAmt &&
        finalBillAmt == other.finalBillAmt &&
        createdDate == other.createdDate &&
        updatedDate == other.updatedDate &&
        roundOff == other.roundOff &&
        updatedBy == other.updatedBy &&
        code == other.code &&
        shiftId == other.shiftId &&
        partyMobNo == other.partyMobNo &&
        createdBy == other.createdBy &&
        listEquality.equals(productList, other.productList) &&
        synC == other.synC &&
        hivekey == other.hivekey &&
        version == other.version;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        invoice,
        party,
        products,
        invoiceDate,
        paymentMode,
        dayId,
        discountAmt,
        discountPer,
        delliveryChrg,
        taxAmt,
        billAmt,
        finalBillAmt,
        createdDate,
        updatedDate,
        roundOff,
        updatedBy,
        code,
        shiftId,
        partyMobNo,
        createdBy,
        productList,
        synC,
        hivekey,
        version
      ]);
}

InvoiceStructStruct createInvoiceStructStruct({
  String? id,
  String? invoice,
  String? party,
  String? products,
  int? invoiceDate,
  String? paymentMode,
  String? dayId,
  double? discountAmt,
  double? discountPer,
  double? delliveryChrg,
  double? taxAmt,
  double? billAmt,
  double? finalBillAmt,
  int? createdDate,
  int? updatedDate,
  double? roundOff,
  String? updatedBy,
  int? code,
  String? shiftId,
  String? partyMobNo,
  String? createdBy,
  bool? synC,
  int? hivekey,
  int? version,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InvoiceStructStruct(
      id: id,
      invoice: invoice,
      party: party,
      products: products,
      invoiceDate: invoiceDate,
      paymentMode: paymentMode,
      dayId: dayId,
      discountAmt: discountAmt,
      discountPer: discountPer,
      delliveryChrg: delliveryChrg,
      taxAmt: taxAmt,
      billAmt: billAmt,
      finalBillAmt: finalBillAmt,
      createdDate: createdDate,
      updatedDate: updatedDate,
      roundOff: roundOff,
      updatedBy: updatedBy,
      code: code,
      shiftId: shiftId,
      partyMobNo: partyMobNo,
      createdBy: createdBy,
      synC: synC,
      hivekey: hivekey,
      version: version,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InvoiceStructStruct? updateInvoiceStructStruct(
  InvoiceStructStruct? invoiceStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    invoiceStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInvoiceStructStructData(
  Map<String, dynamic> firestoreData,
  InvoiceStructStruct? invoiceStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (invoiceStruct == null) {
    return;
  }
  if (invoiceStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && invoiceStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final invoiceStructData =
      getInvoiceStructFirestoreData(invoiceStruct, forFieldValue);
  final nestedData =
      invoiceStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = invoiceStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInvoiceStructFirestoreData(
  InvoiceStructStruct? invoiceStruct, [
  bool forFieldValue = false,
]) {
  if (invoiceStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(invoiceStruct.toMap());

  // Add any Firestore field values
  invoiceStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInvoiceStructListFirestoreData(
  List<InvoiceStructStruct>? invoiceStructs,
) =>
    invoiceStructs
        ?.map((e) => getInvoiceStructFirestoreData(e, true))
        .toList() ??
    [];
