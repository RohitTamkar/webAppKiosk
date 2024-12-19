// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftDetailsStruct extends FFFirebaseStruct {
  ShiftDetailsStruct({
    String? id,
    int? billCount,
    String? dayId,
    String? lastBillNo,
    int? lastBillTime,
    double? tax,
    double? deliveryCharges,
    int? code,
    int? endTime,
    double? advanceAmtTotal,
    double? customerReciveAmtTotal,
    double? discount,
    double? expensesAmtTotal,
    double? openingAmt,
    double? receiveAmtTotal,
    double? refoundAmount,
    double? totalSale,
    double? roundOff,
    double? cashInHand,
    double? cashSale,
    int? startTime,
    bool? inActive,
    int? shiftNo,
    double? subTotalBill,
    String? userId,
    String? deviceId,
    String? paymentJson,
    List<SelItemListStruct>? productSaleList,
    int? version,
    String? shiftId,
    bool? synC,
    int? hivekey,
    int? newIDShift,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _billCount = billCount,
        _dayId = dayId,
        _lastBillNo = lastBillNo,
        _lastBillTime = lastBillTime,
        _tax = tax,
        _deliveryCharges = deliveryCharges,
        _code = code,
        _endTime = endTime,
        _advanceAmtTotal = advanceAmtTotal,
        _customerReciveAmtTotal = customerReciveAmtTotal,
        _discount = discount,
        _expensesAmtTotal = expensesAmtTotal,
        _openingAmt = openingAmt,
        _receiveAmtTotal = receiveAmtTotal,
        _refoundAmount = refoundAmount,
        _totalSale = totalSale,
        _roundOff = roundOff,
        _cashInHand = cashInHand,
        _cashSale = cashSale,
        _startTime = startTime,
        _inActive = inActive,
        _shiftNo = shiftNo,
        _subTotalBill = subTotalBill,
        _userId = userId,
        _deviceId = deviceId,
        _paymentJson = paymentJson,
        _productSaleList = productSaleList,
        _version = version,
        _shiftId = shiftId,
        _synC = synC,
        _hivekey = hivekey,
        _newIDShift = newIDShift,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "billCount" field.
  int? _billCount;
  int get billCount => _billCount ?? 0;
  set billCount(int? val) => _billCount = val;

  void incrementBillCount(int amount) => billCount = billCount + amount;

  bool hasBillCount() => _billCount != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  set dayId(String? val) => _dayId = val;

  bool hasDayId() => _dayId != null;

  // "lastBillNo" field.
  String? _lastBillNo;
  String get lastBillNo => _lastBillNo ?? '';
  set lastBillNo(String? val) => _lastBillNo = val;

  bool hasLastBillNo() => _lastBillNo != null;

  // "lastBillTime" field.
  int? _lastBillTime;
  int get lastBillTime => _lastBillTime ?? 0;
  set lastBillTime(int? val) => _lastBillTime = val;

  void incrementLastBillTime(int amount) =>
      lastBillTime = lastBillTime + amount;

  bool hasLastBillTime() => _lastBillTime != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  set tax(double? val) => _tax = val;

  void incrementTax(double amount) => tax = tax + amount;

  bool hasTax() => _tax != null;

  // "deliveryCharges" field.
  double? _deliveryCharges;
  double get deliveryCharges => _deliveryCharges ?? 0.0;
  set deliveryCharges(double? val) => _deliveryCharges = val;

  void incrementDeliveryCharges(double amount) =>
      deliveryCharges = deliveryCharges + amount;

  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "endTime" field.
  int? _endTime;
  int get endTime => _endTime ?? 0;
  set endTime(int? val) => _endTime = val;

  void incrementEndTime(int amount) => endTime = endTime + amount;

  bool hasEndTime() => _endTime != null;

  // "advanceAmtTotal" field.
  double? _advanceAmtTotal;
  double get advanceAmtTotal => _advanceAmtTotal ?? 0.0;
  set advanceAmtTotal(double? val) => _advanceAmtTotal = val;

  void incrementAdvanceAmtTotal(double amount) =>
      advanceAmtTotal = advanceAmtTotal + amount;

  bool hasAdvanceAmtTotal() => _advanceAmtTotal != null;

  // "customerReciveAmtTotal" field.
  double? _customerReciveAmtTotal;
  double get customerReciveAmtTotal => _customerReciveAmtTotal ?? 0.0;
  set customerReciveAmtTotal(double? val) => _customerReciveAmtTotal = val;

  void incrementCustomerReciveAmtTotal(double amount) =>
      customerReciveAmtTotal = customerReciveAmtTotal + amount;

  bool hasCustomerReciveAmtTotal() => _customerReciveAmtTotal != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  set discount(double? val) => _discount = val;

  void incrementDiscount(double amount) => discount = discount + amount;

  bool hasDiscount() => _discount != null;

  // "expensesAmtTotal" field.
  double? _expensesAmtTotal;
  double get expensesAmtTotal => _expensesAmtTotal ?? 0.0;
  set expensesAmtTotal(double? val) => _expensesAmtTotal = val;

  void incrementExpensesAmtTotal(double amount) =>
      expensesAmtTotal = expensesAmtTotal + amount;

  bool hasExpensesAmtTotal() => _expensesAmtTotal != null;

  // "openingAmt" field.
  double? _openingAmt;
  double get openingAmt => _openingAmt ?? 0.0;
  set openingAmt(double? val) => _openingAmt = val;

  void incrementOpeningAmt(double amount) => openingAmt = openingAmt + amount;

  bool hasOpeningAmt() => _openingAmt != null;

  // "receiveAmtTotal" field.
  double? _receiveAmtTotal;
  double get receiveAmtTotal => _receiveAmtTotal ?? 0.0;
  set receiveAmtTotal(double? val) => _receiveAmtTotal = val;

  void incrementReceiveAmtTotal(double amount) =>
      receiveAmtTotal = receiveAmtTotal + amount;

  bool hasReceiveAmtTotal() => _receiveAmtTotal != null;

  // "refoundAmount" field.
  double? _refoundAmount;
  double get refoundAmount => _refoundAmount ?? 0.0;
  set refoundAmount(double? val) => _refoundAmount = val;

  void incrementRefoundAmount(double amount) =>
      refoundAmount = refoundAmount + amount;

  bool hasRefoundAmount() => _refoundAmount != null;

  // "totalSale" field.
  double? _totalSale;
  double get totalSale => _totalSale ?? 0.0;
  set totalSale(double? val) => _totalSale = val;

  void incrementTotalSale(double amount) => totalSale = totalSale + amount;

  bool hasTotalSale() => _totalSale != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  set roundOff(double? val) => _roundOff = val;

  void incrementRoundOff(double amount) => roundOff = roundOff + amount;

  bool hasRoundOff() => _roundOff != null;

  // "cashInHand" field.
  double? _cashInHand;
  double get cashInHand => _cashInHand ?? 0.0;
  set cashInHand(double? val) => _cashInHand = val;

  void incrementCashInHand(double amount) => cashInHand = cashInHand + amount;

  bool hasCashInHand() => _cashInHand != null;

  // "cashSale" field.
  double? _cashSale;
  double get cashSale => _cashSale ?? 0.0;
  set cashSale(double? val) => _cashSale = val;

  void incrementCashSale(double amount) => cashSale = cashSale + amount;

  bool hasCashSale() => _cashSale != null;

  // "startTime" field.
  int? _startTime;
  int get startTime => _startTime ?? 0;
  set startTime(int? val) => _startTime = val;

  void incrementStartTime(int amount) => startTime = startTime + amount;

  bool hasStartTime() => _startTime != null;

  // "inActive" field.
  bool? _inActive;
  bool get inActive => _inActive ?? false;
  set inActive(bool? val) => _inActive = val;

  bool hasInActive() => _inActive != null;

  // "shiftNo" field.
  int? _shiftNo;
  int get shiftNo => _shiftNo ?? 0;
  set shiftNo(int? val) => _shiftNo = val;

  void incrementShiftNo(int amount) => shiftNo = shiftNo + amount;

  bool hasShiftNo() => _shiftNo != null;

  // "subTotalBill" field.
  double? _subTotalBill;
  double get subTotalBill => _subTotalBill ?? 0.0;
  set subTotalBill(double? val) => _subTotalBill = val;

  void incrementSubTotalBill(double amount) =>
      subTotalBill = subTotalBill + amount;

  bool hasSubTotalBill() => _subTotalBill != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "paymentJson" field.
  String? _paymentJson;
  String get paymentJson => _paymentJson ?? '';
  set paymentJson(String? val) => _paymentJson = val;

  bool hasPaymentJson() => _paymentJson != null;

  // "productSaleList" field.
  List<SelItemListStruct>? _productSaleList;
  List<SelItemListStruct> get productSaleList => _productSaleList ?? const [];
  set productSaleList(List<SelItemListStruct>? val) => _productSaleList = val;

  void updateProductSaleList(Function(List<SelItemListStruct>) updateFn) {
    updateFn(_productSaleList ??= []);
  }

  bool hasProductSaleList() => _productSaleList != null;

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  set version(int? val) => _version = val;

  void incrementVersion(int amount) => version = version + amount;

  bool hasVersion() => _version != null;

  // "shiftId" field.
  String? _shiftId;
  String get shiftId => _shiftId ?? '';
  set shiftId(String? val) => _shiftId = val;

  bool hasShiftId() => _shiftId != null;

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

  // "newIDShift" field.
  int? _newIDShift;
  int get newIDShift => _newIDShift ?? 0;
  set newIDShift(int? val) => _newIDShift = val;

  void incrementNewIDShift(int amount) => newIDShift = newIDShift + amount;

  bool hasNewIDShift() => _newIDShift != null;

  static ShiftDetailsStruct fromMap(Map<String, dynamic> data) =>
      ShiftDetailsStruct(
        id: data['id'] as String?,
        billCount: castToType<int>(data['billCount']),
        dayId: data['dayId'] as String?,
        lastBillNo: data['lastBillNo'] as String?,
        lastBillTime: castToType<int>(data['lastBillTime']),
        tax: castToType<double>(data['tax']),
        deliveryCharges: castToType<double>(data['deliveryCharges']),
        code: castToType<int>(data['code']),
        endTime: castToType<int>(data['endTime']),
        advanceAmtTotal: castToType<double>(data['advanceAmtTotal']),
        customerReciveAmtTotal:
            castToType<double>(data['customerReciveAmtTotal']),
        discount: castToType<double>(data['discount']),
        expensesAmtTotal: castToType<double>(data['expensesAmtTotal']),
        openingAmt: castToType<double>(data['openingAmt']),
        receiveAmtTotal: castToType<double>(data['receiveAmtTotal']),
        refoundAmount: castToType<double>(data['refoundAmount']),
        totalSale: castToType<double>(data['totalSale']),
        roundOff: castToType<double>(data['roundOff']),
        cashInHand: castToType<double>(data['cashInHand']),
        cashSale: castToType<double>(data['cashSale']),
        startTime: castToType<int>(data['startTime']),
        inActive: data['inActive'] as bool?,
        shiftNo: castToType<int>(data['shiftNo']),
        subTotalBill: castToType<double>(data['subTotalBill']),
        userId: data['userId'] as String?,
        deviceId: data['deviceId'] as String?,
        paymentJson: data['paymentJson'] as String?,
        productSaleList: getStructList(
          data['productSaleList'],
          SelItemListStruct.fromMap,
        ),
        version: castToType<int>(data['version']),
        shiftId: data['shiftId'] as String?,
        synC: data['synC'] as bool?,
        hivekey: castToType<int>(data['hivekey']),
        newIDShift: castToType<int>(data['newIDShift']),
      );

  static ShiftDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShiftDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'billCount': _billCount,
        'dayId': _dayId,
        'lastBillNo': _lastBillNo,
        'lastBillTime': _lastBillTime,
        'tax': _tax,
        'deliveryCharges': _deliveryCharges,
        'code': _code,
        'endTime': _endTime,
        'advanceAmtTotal': _advanceAmtTotal,
        'customerReciveAmtTotal': _customerReciveAmtTotal,
        'discount': _discount,
        'expensesAmtTotal': _expensesAmtTotal,
        'openingAmt': _openingAmt,
        'receiveAmtTotal': _receiveAmtTotal,
        'refoundAmount': _refoundAmount,
        'totalSale': _totalSale,
        'roundOff': _roundOff,
        'cashInHand': _cashInHand,
        'cashSale': _cashSale,
        'startTime': _startTime,
        'inActive': _inActive,
        'shiftNo': _shiftNo,
        'subTotalBill': _subTotalBill,
        'userId': _userId,
        'deviceId': _deviceId,
        'paymentJson': _paymentJson,
        'productSaleList': _productSaleList?.map((e) => e.toMap()).toList(),
        'version': _version,
        'shiftId': _shiftId,
        'synC': _synC,
        'hivekey': _hivekey,
        'newIDShift': _newIDShift,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'billCount': serializeParam(
          _billCount,
          ParamType.int,
        ),
        'dayId': serializeParam(
          _dayId,
          ParamType.String,
        ),
        'lastBillNo': serializeParam(
          _lastBillNo,
          ParamType.String,
        ),
        'lastBillTime': serializeParam(
          _lastBillTime,
          ParamType.int,
        ),
        'tax': serializeParam(
          _tax,
          ParamType.double,
        ),
        'deliveryCharges': serializeParam(
          _deliveryCharges,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.int,
        ),
        'advanceAmtTotal': serializeParam(
          _advanceAmtTotal,
          ParamType.double,
        ),
        'customerReciveAmtTotal': serializeParam(
          _customerReciveAmtTotal,
          ParamType.double,
        ),
        'discount': serializeParam(
          _discount,
          ParamType.double,
        ),
        'expensesAmtTotal': serializeParam(
          _expensesAmtTotal,
          ParamType.double,
        ),
        'openingAmt': serializeParam(
          _openingAmt,
          ParamType.double,
        ),
        'receiveAmtTotal': serializeParam(
          _receiveAmtTotal,
          ParamType.double,
        ),
        'refoundAmount': serializeParam(
          _refoundAmount,
          ParamType.double,
        ),
        'totalSale': serializeParam(
          _totalSale,
          ParamType.double,
        ),
        'roundOff': serializeParam(
          _roundOff,
          ParamType.double,
        ),
        'cashInHand': serializeParam(
          _cashInHand,
          ParamType.double,
        ),
        'cashSale': serializeParam(
          _cashSale,
          ParamType.double,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.int,
        ),
        'inActive': serializeParam(
          _inActive,
          ParamType.bool,
        ),
        'shiftNo': serializeParam(
          _shiftNo,
          ParamType.int,
        ),
        'subTotalBill': serializeParam(
          _subTotalBill,
          ParamType.double,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'deviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'paymentJson': serializeParam(
          _paymentJson,
          ParamType.String,
        ),
        'productSaleList': serializeParam(
          _productSaleList,
          ParamType.DataStruct,
          isList: true,
        ),
        'version': serializeParam(
          _version,
          ParamType.int,
        ),
        'shiftId': serializeParam(
          _shiftId,
          ParamType.String,
        ),
        'synC': serializeParam(
          _synC,
          ParamType.bool,
        ),
        'hivekey': serializeParam(
          _hivekey,
          ParamType.int,
        ),
        'newIDShift': serializeParam(
          _newIDShift,
          ParamType.int,
        ),
      }.withoutNulls;

  static ShiftDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShiftDetailsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        billCount: deserializeParam(
          data['billCount'],
          ParamType.int,
          false,
        ),
        dayId: deserializeParam(
          data['dayId'],
          ParamType.String,
          false,
        ),
        lastBillNo: deserializeParam(
          data['lastBillNo'],
          ParamType.String,
          false,
        ),
        lastBillTime: deserializeParam(
          data['lastBillTime'],
          ParamType.int,
          false,
        ),
        tax: deserializeParam(
          data['tax'],
          ParamType.double,
          false,
        ),
        deliveryCharges: deserializeParam(
          data['deliveryCharges'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.int,
          false,
        ),
        advanceAmtTotal: deserializeParam(
          data['advanceAmtTotal'],
          ParamType.double,
          false,
        ),
        customerReciveAmtTotal: deserializeParam(
          data['customerReciveAmtTotal'],
          ParamType.double,
          false,
        ),
        discount: deserializeParam(
          data['discount'],
          ParamType.double,
          false,
        ),
        expensesAmtTotal: deserializeParam(
          data['expensesAmtTotal'],
          ParamType.double,
          false,
        ),
        openingAmt: deserializeParam(
          data['openingAmt'],
          ParamType.double,
          false,
        ),
        receiveAmtTotal: deserializeParam(
          data['receiveAmtTotal'],
          ParamType.double,
          false,
        ),
        refoundAmount: deserializeParam(
          data['refoundAmount'],
          ParamType.double,
          false,
        ),
        totalSale: deserializeParam(
          data['totalSale'],
          ParamType.double,
          false,
        ),
        roundOff: deserializeParam(
          data['roundOff'],
          ParamType.double,
          false,
        ),
        cashInHand: deserializeParam(
          data['cashInHand'],
          ParamType.double,
          false,
        ),
        cashSale: deserializeParam(
          data['cashSale'],
          ParamType.double,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.int,
          false,
        ),
        inActive: deserializeParam(
          data['inActive'],
          ParamType.bool,
          false,
        ),
        shiftNo: deserializeParam(
          data['shiftNo'],
          ParamType.int,
          false,
        ),
        subTotalBill: deserializeParam(
          data['subTotalBill'],
          ParamType.double,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeParam(
          data['deviceId'],
          ParamType.String,
          false,
        ),
        paymentJson: deserializeParam(
          data['paymentJson'],
          ParamType.String,
          false,
        ),
        productSaleList: deserializeStructParam<SelItemListStruct>(
          data['productSaleList'],
          ParamType.DataStruct,
          true,
          structBuilder: SelItemListStruct.fromSerializableMap,
        ),
        version: deserializeParam(
          data['version'],
          ParamType.int,
          false,
        ),
        shiftId: deserializeParam(
          data['shiftId'],
          ParamType.String,
          false,
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
        newIDShift: deserializeParam(
          data['newIDShift'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ShiftDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShiftDetailsStruct &&
        id == other.id &&
        billCount == other.billCount &&
        dayId == other.dayId &&
        lastBillNo == other.lastBillNo &&
        lastBillTime == other.lastBillTime &&
        tax == other.tax &&
        deliveryCharges == other.deliveryCharges &&
        code == other.code &&
        endTime == other.endTime &&
        advanceAmtTotal == other.advanceAmtTotal &&
        customerReciveAmtTotal == other.customerReciveAmtTotal &&
        discount == other.discount &&
        expensesAmtTotal == other.expensesAmtTotal &&
        openingAmt == other.openingAmt &&
        receiveAmtTotal == other.receiveAmtTotal &&
        refoundAmount == other.refoundAmount &&
        totalSale == other.totalSale &&
        roundOff == other.roundOff &&
        cashInHand == other.cashInHand &&
        cashSale == other.cashSale &&
        startTime == other.startTime &&
        inActive == other.inActive &&
        shiftNo == other.shiftNo &&
        subTotalBill == other.subTotalBill &&
        userId == other.userId &&
        deviceId == other.deviceId &&
        paymentJson == other.paymentJson &&
        listEquality.equals(productSaleList, other.productSaleList) &&
        version == other.version &&
        shiftId == other.shiftId &&
        synC == other.synC &&
        hivekey == other.hivekey &&
        newIDShift == other.newIDShift;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        billCount,
        dayId,
        lastBillNo,
        lastBillTime,
        tax,
        deliveryCharges,
        code,
        endTime,
        advanceAmtTotal,
        customerReciveAmtTotal,
        discount,
        expensesAmtTotal,
        openingAmt,
        receiveAmtTotal,
        refoundAmount,
        totalSale,
        roundOff,
        cashInHand,
        cashSale,
        startTime,
        inActive,
        shiftNo,
        subTotalBill,
        userId,
        deviceId,
        paymentJson,
        productSaleList,
        version,
        shiftId,
        synC,
        hivekey,
        newIDShift
      ]);
}

ShiftDetailsStruct createShiftDetailsStruct({
  String? id,
  int? billCount,
  String? dayId,
  String? lastBillNo,
  int? lastBillTime,
  double? tax,
  double? deliveryCharges,
  int? code,
  int? endTime,
  double? advanceAmtTotal,
  double? customerReciveAmtTotal,
  double? discount,
  double? expensesAmtTotal,
  double? openingAmt,
  double? receiveAmtTotal,
  double? refoundAmount,
  double? totalSale,
  double? roundOff,
  double? cashInHand,
  double? cashSale,
  int? startTime,
  bool? inActive,
  int? shiftNo,
  double? subTotalBill,
  String? userId,
  String? deviceId,
  String? paymentJson,
  int? version,
  String? shiftId,
  bool? synC,
  int? hivekey,
  int? newIDShift,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShiftDetailsStruct(
      id: id,
      billCount: billCount,
      dayId: dayId,
      lastBillNo: lastBillNo,
      lastBillTime: lastBillTime,
      tax: tax,
      deliveryCharges: deliveryCharges,
      code: code,
      endTime: endTime,
      advanceAmtTotal: advanceAmtTotal,
      customerReciveAmtTotal: customerReciveAmtTotal,
      discount: discount,
      expensesAmtTotal: expensesAmtTotal,
      openingAmt: openingAmt,
      receiveAmtTotal: receiveAmtTotal,
      refoundAmount: refoundAmount,
      totalSale: totalSale,
      roundOff: roundOff,
      cashInHand: cashInHand,
      cashSale: cashSale,
      startTime: startTime,
      inActive: inActive,
      shiftNo: shiftNo,
      subTotalBill: subTotalBill,
      userId: userId,
      deviceId: deviceId,
      paymentJson: paymentJson,
      version: version,
      shiftId: shiftId,
      synC: synC,
      hivekey: hivekey,
      newIDShift: newIDShift,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShiftDetailsStruct? updateShiftDetailsStruct(
  ShiftDetailsStruct? shiftDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shiftDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShiftDetailsStructData(
  Map<String, dynamic> firestoreData,
  ShiftDetailsStruct? shiftDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shiftDetails == null) {
    return;
  }
  if (shiftDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shiftDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shiftDetailsData =
      getShiftDetailsFirestoreData(shiftDetails, forFieldValue);
  final nestedData =
      shiftDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shiftDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShiftDetailsFirestoreData(
  ShiftDetailsStruct? shiftDetails, [
  bool forFieldValue = false,
]) {
  if (shiftDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shiftDetails.toMap());

  // Add any Firestore field values
  shiftDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShiftDetailsListFirestoreData(
  List<ShiftDetailsStruct>? shiftDetailss,
) =>
    shiftDetailss?.map((e) => getShiftDetailsFirestoreData(e, true)).toList() ??
    [];
