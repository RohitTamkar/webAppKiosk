import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSettingsRecord extends FirestoreRecord {
  AppSettingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "billFormatSendToEmail" field.
  bool? _billFormatSendToEmail;
  bool get billFormatSendToEmail => _billFormatSendToEmail ?? false;
  bool hasBillFormatSendToEmail() => _billFormatSendToEmail != null;

  // "billSettlement" field.
  bool? _billSettlement;
  bool get billSettlement => _billSettlement ?? false;
  bool hasBillSettlement() => _billSettlement != null;

  // "calculateReverseQuantity" field.
  bool? _calculateReverseQuantity;
  bool get calculateReverseQuantity => _calculateReverseQuantity ?? false;
  bool hasCalculateReverseQuantity() => _calculateReverseQuantity != null;

  // "captainDetails" field.
  bool? _captainDetails;
  bool get captainDetails => _captainDetails ?? false;
  bool hasCaptainDetails() => _captainDetails != null;

  // "captainRequest" field.
  bool? _captainRequest;
  bool get captainRequest => _captainRequest ?? false;
  bool hasCaptainRequest() => _captainRequest != null;

  // "checkInCheckOut" field.
  bool? _checkInCheckOut;
  bool get checkInCheckOut => _checkInCheckOut ?? false;
  bool hasCheckInCheckOut() => _checkInCheckOut != null;

  // "couponKotHeader" field.
  bool? _couponKotHeader;
  bool get couponKotHeader => _couponKotHeader ?? false;
  bool hasCouponKotHeader() => _couponKotHeader != null;

  // "couponPrintBill" field.
  bool? _couponPrintBill;
  bool get couponPrintBill => _couponPrintBill ?? false;
  bool hasCouponPrintBill() => _couponPrintBill != null;

  // "couponSaveBill" field.
  bool? _couponSaveBill;
  bool get couponSaveBill => _couponSaveBill ?? false;
  bool hasCouponSaveBill() => _couponSaveBill != null;

  // "deliveryNote" field.
  bool? _deliveryNote;
  bool get deliveryNote => _deliveryNote ?? false;
  bool hasDeliveryNote() => _deliveryNote != null;

  // "saveButton" field.
  bool? _saveButton;
  bool get saveButton => _saveButton ?? false;
  bool hasSaveButton() => _saveButton != null;

  // "saveKot" field.
  bool? _saveKot;
  bool get saveKot => _saveKot ?? false;
  bool hasSaveKot() => _saveKot != null;

  // "discountToBill" field.
  bool? _discountToBill;
  bool get discountToBill => _discountToBill ?? false;
  bool hasDiscountToBill() => _discountToBill != null;

  // "doNotShowProductList" field.
  bool? _doNotShowProductList;
  bool get doNotShowProductList => _doNotShowProductList ?? false;
  bool hasDoNotShowProductList() => _doNotShowProductList != null;

  // "barcodeMenu" field.
  bool? _barcodeMenu;
  bool get barcodeMenu => _barcodeMenu ?? false;
  bool hasBarcodeMenu() => _barcodeMenu != null;

  // "billModificationtoUser" field.
  bool? _billModificationtoUser;
  bool get billModificationtoUser => _billModificationtoUser ?? false;
  bool hasBillModificationtoUser() => _billModificationtoUser != null;

  // "comboPriceUpdate" field.
  bool? _comboPriceUpdate;
  bool get comboPriceUpdate => _comboPriceUpdate ?? false;
  bool hasComboPriceUpdate() => _comboPriceUpdate != null;

  // "customerAdvance" field.
  bool? _customerAdvance;
  bool get customerAdvance => _customerAdvance ?? false;
  bool hasCustomerAdvance() => _customerAdvance != null;

  // "customerforcefully" field.
  bool? _customerforcefully;
  bool get customerforcefully => _customerforcefully ?? false;
  bool hasCustomerforcefully() => _customerforcefully != null;

  // "editingSettlement" field.
  bool? _editingSettlement;
  bool get editingSettlement => _editingSettlement ?? false;
  bool hasEditingSettlement() => _editingSettlement != null;

  // "floatingKeyboard" field.
  bool? _floatingKeyboard;
  bool get floatingKeyboard => _floatingKeyboard ?? false;
  bool hasFloatingKeyboard() => _floatingKeyboard != null;

  // "goodsReceivedMenu" field.
  bool? _goodsReceivedMenu;
  bool get goodsReceivedMenu => _goodsReceivedMenu ?? false;
  bool hasGoodsReceivedMenu() => _goodsReceivedMenu != null;

  // "kotPrintAmountColumn" field.
  bool? _kotPrintAmountColumn;
  bool get kotPrintAmountColumn => _kotPrintAmountColumn ?? false;
  bool hasKotPrintAmountColumn() => _kotPrintAmountColumn != null;

  // "kotReprint" field.
  bool? _kotReprint;
  bool get kotReprint => _kotReprint ?? false;
  bool hasKotReprint() => _kotReprint != null;

  // "loyaltyPoints" field.
  bool? _loyaltyPoints;
  bool get loyaltyPoints => _loyaltyPoints ?? false;
  bool hasLoyaltyPoints() => _loyaltyPoints != null;

  // "onlineOrderSystem" field.
  bool? _onlineOrderSystem;
  bool get onlineOrderSystem => _onlineOrderSystem ?? false;
  bool hasOnlineOrderSystem() => _onlineOrderSystem != null;

  // "openingBalanceAmountSet" field.
  bool? _openingBalanceAmountSet;
  bool get openingBalanceAmountSet => _openingBalanceAmountSet ?? false;
  bool hasOpeningBalanceAmountSet() => _openingBalanceAmountSet != null;

  // "openingBalancePopup" field.
  bool? _openingBalancePopup;
  bool get openingBalancePopup => _openingBalancePopup ?? false;
  bool hasOpeningBalancePopup() => _openingBalancePopup != null;

  // "paymentMenu" field.
  bool? _paymentMenu;
  bool get paymentMenu => _paymentMenu ?? false;
  bool hasPaymentMenu() => _paymentMenu != null;

  // "salesman" field.
  bool? _salesman;
  bool get salesman => _salesman ?? false;
  bool hasSalesman() => _salesman != null;

  // "salesmanForcefully" field.
  bool? _salesmanForcefully;
  bool get salesmanForcefully => _salesmanForcefully ?? false;
  bool hasSalesmanForcefully() => _salesmanForcefully != null;

  // "salesmanProductWise" field.
  bool? _salesmanProductWise;
  bool get salesmanProductWise => _salesmanProductWise ?? false;
  bool hasSalesmanProductWise() => _salesmanProductWise != null;

  // "stockOutMenu" field.
  bool? _stockOutMenu;
  bool get stockOutMenu => _stockOutMenu ?? false;
  bool hasStockOutMenu() => _stockOutMenu != null;

  // "store" field.
  bool? _store;
  bool get store => _store ?? false;
  bool hasStore() => _store != null;

  // "tableForcefully" field.
  bool? _tableForcefully;
  bool get tableForcefully => _tableForcefully ?? false;
  bool hasTableForcefully() => _tableForcefully != null;

  // "threeCharSearch" field.
  bool? _threeCharSearch;
  bool get threeCharSearch => _threeCharSearch ?? false;
  bool hasThreeCharSearch() => _threeCharSearch != null;

  // "wlanCommunication" field.
  bool? _wlanCommunication;
  bool get wlanCommunication => _wlanCommunication ?? false;
  bool hasWlanCommunication() => _wlanCommunication != null;

  // "estimateMode" field.
  bool? _estimateMode;
  bool get estimateMode => _estimateMode ?? false;
  bool hasEstimateMode() => _estimateMode != null;

  // "hideKeyboard" field.
  bool? _hideKeyboard;
  bool get hideKeyboard => _hideKeyboard ?? false;
  bool hasHideKeyboard() => _hideKeyboard != null;

  // "hideProductSearchCode" field.
  bool? _hideProductSearchCode;
  bool get hideProductSearchCode => _hideProductSearchCode ?? false;
  bool hasHideProductSearchCode() => _hideProductSearchCode != null;

  // "inclusiveTax" field.
  bool? _inclusiveTax;
  bool get inclusiveTax => _inclusiveTax ?? false;
  bool hasInclusiveTax() => _inclusiveTax != null;

  // "itemStockRequestSent" field.
  bool? _itemStockRequestSent;
  bool get itemStockRequestSent => _itemStockRequestSent ?? false;
  bool hasItemStockRequestSent() => _itemStockRequestSent != null;

  // "kotRemark" field.
  bool? _kotRemark;
  bool get kotRemark => _kotRemark ?? false;
  bool hasKotRemark() => _kotRemark != null;

  // "manualPrice" field.
  bool? _manualPrice;
  bool get manualPrice => _manualPrice ?? false;
  bool hasManualPrice() => _manualPrice != null;

  // "openPrice" field.
  bool? _openPrice;
  bool get openPrice => _openPrice ?? false;
  bool hasOpenPrice() => _openPrice != null;

  // "pemisesShowCodeWise" field.
  bool? _pemisesShowCodeWise;
  bool get pemisesShowCodeWise => _pemisesShowCodeWise ?? false;
  bool hasPemisesShowCodeWise() => _pemisesShowCodeWise != null;

  // "productSuggestionRemove" field.
  bool? _productSuggestionRemove;
  bool get productSuggestionRemove => _productSuggestionRemove ?? false;
  bool hasProductSuggestionRemove() => _productSuggestionRemove != null;

  // "regionalLanguage" field.
  bool? _regionalLanguage;
  bool get regionalLanguage => _regionalLanguage ?? false;
  bool hasRegionalLanguage() => _regionalLanguage != null;

  // "rfidMasterRead" field.
  bool? _rfidMasterRead;
  bool get rfidMasterRead => _rfidMasterRead ?? false;
  bool hasRfidMasterRead() => _rfidMasterRead != null;

  // "rfidMasterWrite" field.
  bool? _rfidMasterWrite;
  bool get rfidMasterWrite => _rfidMasterWrite ?? false;
  bool hasRfidMasterWrite() => _rfidMasterWrite != null;

  // "searchWithOnlyBarcode" field.
  bool? _searchWithOnlyBarcode;
  bool get searchWithOnlyBarcode => _searchWithOnlyBarcode ?? false;
  bool hasSearchWithOnlyBarcode() => _searchWithOnlyBarcode != null;

  // "sendSMS" field.
  bool? _sendSMS;
  bool get sendSMS => _sendSMS ?? false;
  bool hasSendSMS() => _sendSMS != null;

  // "showHoldListButton" field.
  bool? _showHoldListButton;
  bool get showHoldListButton => _showHoldListButton ?? false;
  bool hasShowHoldListButton() => _showHoldListButton != null;

  // "showPrintButtonsAfterPay" field.
  bool? _showPrintButtonsAfterPay;
  bool get showPrintButtonsAfterPay => _showPrintButtonsAfterPay ?? false;
  bool hasShowPrintButtonsAfterPay() => _showPrintButtonsAfterPay != null;

  // "showProductImage" field.
  bool? _showProductImage;
  bool get showProductImage => _showProductImage ?? false;
  bool hasShowProductImage() => _showProductImage != null;

  // "sortHotKeys" field.
  bool? _sortHotKeys;
  bool get sortHotKeys => _sortHotKeys ?? false;
  bool hasSortHotKeys() => _sortHotKeys != null;

  // "stockGettingMinus" field.
  bool? _stockGettingMinus;
  bool get stockGettingMinus => _stockGettingMinus ?? false;
  bool hasStockGettingMinus() => _stockGettingMinus != null;

  // "stockRequestAccept" field.
  bool? _stockRequestAccept;
  bool get stockRequestAccept => _stockRequestAccept ?? false;
  bool hasStockRequestAccept() => _stockRequestAccept != null;

  // "tables" field.
  bool? _tables;
  bool get tables => _tables ?? false;
  bool hasTables() => _tables != null;

  // "upiButton" field.
  bool? _upiButton;
  bool get upiButton => _upiButton ?? false;
  bool hasUpiButton() => _upiButton != null;

  // "vehicleNumber" field.
  bool? _vehicleNumber;
  bool get vehicleNumber => _vehicleNumber ?? false;
  bool hasVehicleNumber() => _vehicleNumber != null;

  // "weightMinus" field.
  bool? _weightMinus;
  bool get weightMinus => _weightMinus ?? false;
  bool hasWeightMinus() => _weightMinus != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

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

  // "openSoftKeyWord" field.
  bool? _openSoftKeyWord;
  bool get openSoftKeyWord => _openSoftKeyWord ?? false;
  bool hasOpenSoftKeyWord() => _openSoftKeyWord != null;

  // "rateColumn-Tax" field.
  bool? _rateColumnTax;
  bool get rateColumnTax => _rateColumnTax ?? false;
  bool hasRateColumnTax() => _rateColumnTax != null;

  // "showProductImg" field.
  bool? _showProductImg;
  bool get showProductImg => _showProductImg ?? false;
  bool hasShowProductImg() => _showProductImg != null;

  // "regularScreen" field.
  bool? _regularScreen;
  bool get regularScreen => _regularScreen ?? false;
  bool hasRegularScreen() => _regularScreen != null;

  // "tableScreen" field.
  bool? _tableScreen;
  bool get tableScreen => _tableScreen ?? false;
  bool hasTableScreen() => _tableScreen != null;

  // "fullScreenQr" field.
  bool? _fullScreenQr;
  bool get fullScreenQr => _fullScreenQr ?? false;
  bool hasFullScreenQr() => _fullScreenQr != null;

  // "fullScreenBill" field.
  bool? _fullScreenBill;
  bool get fullScreenBill => _fullScreenBill ?? false;
  bool hasFullScreenBill() => _fullScreenBill != null;

  // "productAndList" field.
  bool? _productAndList;
  bool get productAndList => _productAndList ?? false;
  bool hasProductAndList() => _productAndList != null;

  // "shiftEndBtn" field.
  bool? _shiftEndBtn;
  bool get shiftEndBtn => _shiftEndBtn ?? false;
  bool hasShiftEndBtn() => _shiftEndBtn != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "kioSKscreen" field.
  bool? _kioSKscreen;
  bool get kioSKscreen => _kioSKscreen ?? false;
  bool hasKioSKscreen() => _kioSKscreen != null;

  // "ethernetPrint" field.
  bool? _ethernetPrint;
  bool get ethernetPrint => _ethernetPrint ?? false;
  bool hasEthernetPrint() => _ethernetPrint != null;

  // "printKOTWithBill" field.
  bool? _printKOTWithBill;
  bool get printKOTWithBill => _printKOTWithBill ?? false;
  bool hasPrintKOTWithBill() => _printKOTWithBill != null;

  // "hideParcelButton" field.
  bool? _hideParcelButton;
  bool get hideParcelButton => _hideParcelButton ?? false;
  bool hasHideParcelButton() => _hideParcelButton != null;

  // "settingList" field.
  List<AppSettingsStruct>? _settingList;
  List<AppSettingsStruct> get settingList => _settingList ?? const [];
  bool hasSettingList() => _settingList != null;

  // "allowSaleWithoutTax" field.
  bool? _allowSaleWithoutTax;
  bool get allowSaleWithoutTax => _allowSaleWithoutTax ?? false;
  bool hasAllowSaleWithoutTax() => _allowSaleWithoutTax != null;

  // "askCustomerInBillCreation" field.
  bool? _askCustomerInBillCreation;
  bool get askCustomerInBillCreation => _askCustomerInBillCreation ?? false;
  bool hasAskCustomerInBillCreation() => _askCustomerInBillCreation != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _billFormatSendToEmail = snapshotData['billFormatSendToEmail'] as bool?;
    _billSettlement = snapshotData['billSettlement'] as bool?;
    _calculateReverseQuantity =
        snapshotData['calculateReverseQuantity'] as bool?;
    _captainDetails = snapshotData['captainDetails'] as bool?;
    _captainRequest = snapshotData['captainRequest'] as bool?;
    _checkInCheckOut = snapshotData['checkInCheckOut'] as bool?;
    _couponKotHeader = snapshotData['couponKotHeader'] as bool?;
    _couponPrintBill = snapshotData['couponPrintBill'] as bool?;
    _couponSaveBill = snapshotData['couponSaveBill'] as bool?;
    _deliveryNote = snapshotData['deliveryNote'] as bool?;
    _saveButton = snapshotData['saveButton'] as bool?;
    _saveKot = snapshotData['saveKot'] as bool?;
    _discountToBill = snapshotData['discountToBill'] as bool?;
    _doNotShowProductList = snapshotData['doNotShowProductList'] as bool?;
    _barcodeMenu = snapshotData['barcodeMenu'] as bool?;
    _billModificationtoUser = snapshotData['billModificationtoUser'] as bool?;
    _comboPriceUpdate = snapshotData['comboPriceUpdate'] as bool?;
    _customerAdvance = snapshotData['customerAdvance'] as bool?;
    _customerforcefully = snapshotData['customerforcefully'] as bool?;
    _editingSettlement = snapshotData['editingSettlement'] as bool?;
    _floatingKeyboard = snapshotData['floatingKeyboard'] as bool?;
    _goodsReceivedMenu = snapshotData['goodsReceivedMenu'] as bool?;
    _kotPrintAmountColumn = snapshotData['kotPrintAmountColumn'] as bool?;
    _kotReprint = snapshotData['kotReprint'] as bool?;
    _loyaltyPoints = snapshotData['loyaltyPoints'] as bool?;
    _onlineOrderSystem = snapshotData['onlineOrderSystem'] as bool?;
    _openingBalanceAmountSet = snapshotData['openingBalanceAmountSet'] as bool?;
    _openingBalancePopup = snapshotData['openingBalancePopup'] as bool?;
    _paymentMenu = snapshotData['paymentMenu'] as bool?;
    _salesman = snapshotData['salesman'] as bool?;
    _salesmanForcefully = snapshotData['salesmanForcefully'] as bool?;
    _salesmanProductWise = snapshotData['salesmanProductWise'] as bool?;
    _stockOutMenu = snapshotData['stockOutMenu'] as bool?;
    _store = snapshotData['store'] as bool?;
    _tableForcefully = snapshotData['tableForcefully'] as bool?;
    _threeCharSearch = snapshotData['threeCharSearch'] as bool?;
    _wlanCommunication = snapshotData['wlanCommunication'] as bool?;
    _estimateMode = snapshotData['estimateMode'] as bool?;
    _hideKeyboard = snapshotData['hideKeyboard'] as bool?;
    _hideProductSearchCode = snapshotData['hideProductSearchCode'] as bool?;
    _inclusiveTax = snapshotData['inclusiveTax'] as bool?;
    _itemStockRequestSent = snapshotData['itemStockRequestSent'] as bool?;
    _kotRemark = snapshotData['kotRemark'] as bool?;
    _manualPrice = snapshotData['manualPrice'] as bool?;
    _openPrice = snapshotData['openPrice'] as bool?;
    _pemisesShowCodeWise = snapshotData['pemisesShowCodeWise'] as bool?;
    _productSuggestionRemove = snapshotData['productSuggestionRemove'] as bool?;
    _regionalLanguage = snapshotData['regionalLanguage'] as bool?;
    _rfidMasterRead = snapshotData['rfidMasterRead'] as bool?;
    _rfidMasterWrite = snapshotData['rfidMasterWrite'] as bool?;
    _searchWithOnlyBarcode = snapshotData['searchWithOnlyBarcode'] as bool?;
    _sendSMS = snapshotData['sendSMS'] as bool?;
    _showHoldListButton = snapshotData['showHoldListButton'] as bool?;
    _showPrintButtonsAfterPay =
        snapshotData['showPrintButtonsAfterPay'] as bool?;
    _showProductImage = snapshotData['showProductImage'] as bool?;
    _sortHotKeys = snapshotData['sortHotKeys'] as bool?;
    _stockGettingMinus = snapshotData['stockGettingMinus'] as bool?;
    _stockRequestAccept = snapshotData['stockRequestAccept'] as bool?;
    _tables = snapshotData['tables'] as bool?;
    _upiButton = snapshotData['upiButton'] as bool?;
    _vehicleNumber = snapshotData['vehicleNumber'] as bool?;
    _weightMinus = snapshotData['weightMinus'] as bool?;
    _code = castToType<int>(snapshotData['code']);
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
    _openSoftKeyWord = snapshotData['openSoftKeyWord'] as bool?;
    _rateColumnTax = snapshotData['rateColumn-Tax'] as bool?;
    _showProductImg = snapshotData['showProductImg'] as bool?;
    _regularScreen = snapshotData['regularScreen'] as bool?;
    _tableScreen = snapshotData['tableScreen'] as bool?;
    _fullScreenQr = snapshotData['fullScreenQr'] as bool?;
    _fullScreenBill = snapshotData['fullScreenBill'] as bool?;
    _productAndList = snapshotData['productAndList'] as bool?;
    _shiftEndBtn = snapshotData['shiftEndBtn'] as bool?;
    _deviceId = snapshotData['deviceId'] as String?;
    _kioSKscreen = snapshotData['kioSKscreen'] as bool?;
    _ethernetPrint = snapshotData['ethernetPrint'] as bool?;
    _printKOTWithBill = snapshotData['printKOTWithBill'] as bool?;
    _hideParcelButton = snapshotData['hideParcelButton'] as bool?;
    _settingList = getStructList(
      snapshotData['settingList'],
      AppSettingsStruct.fromMap,
    );
    _allowSaleWithoutTax = snapshotData['allowSaleWithoutTax'] as bool?;
    _askCustomerInBillCreation =
        snapshotData['askCustomerInBillCreation'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('APP_SETTINGS')
          : FirebaseFirestore.instance.collectionGroup('APP_SETTINGS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('APP_SETTINGS').doc(id);

  static Stream<AppSettingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppSettingsRecord.fromSnapshot(s));

  static Future<AppSettingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppSettingsRecord.fromSnapshot(s));

  static AppSettingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppSettingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppSettingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppSettingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppSettingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppSettingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppSettingsRecordData({
  bool? billFormatSendToEmail,
  bool? billSettlement,
  bool? calculateReverseQuantity,
  bool? captainDetails,
  bool? captainRequest,
  bool? checkInCheckOut,
  bool? couponKotHeader,
  bool? couponPrintBill,
  bool? couponSaveBill,
  bool? deliveryNote,
  bool? saveButton,
  bool? saveKot,
  bool? discountToBill,
  bool? doNotShowProductList,
  bool? barcodeMenu,
  bool? billModificationtoUser,
  bool? comboPriceUpdate,
  bool? customerAdvance,
  bool? customerforcefully,
  bool? editingSettlement,
  bool? floatingKeyboard,
  bool? goodsReceivedMenu,
  bool? kotPrintAmountColumn,
  bool? kotReprint,
  bool? loyaltyPoints,
  bool? onlineOrderSystem,
  bool? openingBalanceAmountSet,
  bool? openingBalancePopup,
  bool? paymentMenu,
  bool? salesman,
  bool? salesmanForcefully,
  bool? salesmanProductWise,
  bool? stockOutMenu,
  bool? store,
  bool? tableForcefully,
  bool? threeCharSearch,
  bool? wlanCommunication,
  bool? estimateMode,
  bool? hideKeyboard,
  bool? hideProductSearchCode,
  bool? inclusiveTax,
  bool? itemStockRequestSent,
  bool? kotRemark,
  bool? manualPrice,
  bool? openPrice,
  bool? pemisesShowCodeWise,
  bool? productSuggestionRemove,
  bool? regionalLanguage,
  bool? rfidMasterRead,
  bool? rfidMasterWrite,
  bool? searchWithOnlyBarcode,
  bool? sendSMS,
  bool? showHoldListButton,
  bool? showPrintButtonsAfterPay,
  bool? showProductImage,
  bool? sortHotKeys,
  bool? stockGettingMinus,
  bool? stockRequestAccept,
  bool? tables,
  bool? upiButton,
  bool? vehicleNumber,
  bool? weightMinus,
  int? code,
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
  bool? openSoftKeyWord,
  bool? rateColumnTax,
  bool? showProductImg,
  bool? regularScreen,
  bool? tableScreen,
  bool? fullScreenQr,
  bool? fullScreenBill,
  bool? productAndList,
  bool? shiftEndBtn,
  String? deviceId,
  bool? kioSKscreen,
  bool? ethernetPrint,
  bool? printKOTWithBill,
  bool? hideParcelButton,
  bool? allowSaleWithoutTax,
  bool? askCustomerInBillCreation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'billFormatSendToEmail': billFormatSendToEmail,
      'billSettlement': billSettlement,
      'calculateReverseQuantity': calculateReverseQuantity,
      'captainDetails': captainDetails,
      'captainRequest': captainRequest,
      'checkInCheckOut': checkInCheckOut,
      'couponKotHeader': couponKotHeader,
      'couponPrintBill': couponPrintBill,
      'couponSaveBill': couponSaveBill,
      'deliveryNote': deliveryNote,
      'saveButton': saveButton,
      'saveKot': saveKot,
      'discountToBill': discountToBill,
      'doNotShowProductList': doNotShowProductList,
      'barcodeMenu': barcodeMenu,
      'billModificationtoUser': billModificationtoUser,
      'comboPriceUpdate': comboPriceUpdate,
      'customerAdvance': customerAdvance,
      'customerforcefully': customerforcefully,
      'editingSettlement': editingSettlement,
      'floatingKeyboard': floatingKeyboard,
      'goodsReceivedMenu': goodsReceivedMenu,
      'kotPrintAmountColumn': kotPrintAmountColumn,
      'kotReprint': kotReprint,
      'loyaltyPoints': loyaltyPoints,
      'onlineOrderSystem': onlineOrderSystem,
      'openingBalanceAmountSet': openingBalanceAmountSet,
      'openingBalancePopup': openingBalancePopup,
      'paymentMenu': paymentMenu,
      'salesman': salesman,
      'salesmanForcefully': salesmanForcefully,
      'salesmanProductWise': salesmanProductWise,
      'stockOutMenu': stockOutMenu,
      'store': store,
      'tableForcefully': tableForcefully,
      'threeCharSearch': threeCharSearch,
      'wlanCommunication': wlanCommunication,
      'estimateMode': estimateMode,
      'hideKeyboard': hideKeyboard,
      'hideProductSearchCode': hideProductSearchCode,
      'inclusiveTax': inclusiveTax,
      'itemStockRequestSent': itemStockRequestSent,
      'kotRemark': kotRemark,
      'manualPrice': manualPrice,
      'openPrice': openPrice,
      'pemisesShowCodeWise': pemisesShowCodeWise,
      'productSuggestionRemove': productSuggestionRemove,
      'regionalLanguage': regionalLanguage,
      'rfidMasterRead': rfidMasterRead,
      'rfidMasterWrite': rfidMasterWrite,
      'searchWithOnlyBarcode': searchWithOnlyBarcode,
      'sendSMS': sendSMS,
      'showHoldListButton': showHoldListButton,
      'showPrintButtonsAfterPay': showPrintButtonsAfterPay,
      'showProductImage': showProductImage,
      'sortHotKeys': sortHotKeys,
      'stockGettingMinus': stockGettingMinus,
      'stockRequestAccept': stockRequestAccept,
      'tables': tables,
      'upiButton': upiButton,
      'vehicleNumber': vehicleNumber,
      'weightMinus': weightMinus,
      'code': code,
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
      'openSoftKeyWord': openSoftKeyWord,
      'rateColumn-Tax': rateColumnTax,
      'showProductImg': showProductImg,
      'regularScreen': regularScreen,
      'tableScreen': tableScreen,
      'fullScreenQr': fullScreenQr,
      'fullScreenBill': fullScreenBill,
      'productAndList': productAndList,
      'shiftEndBtn': shiftEndBtn,
      'deviceId': deviceId,
      'kioSKscreen': kioSKscreen,
      'ethernetPrint': ethernetPrint,
      'printKOTWithBill': printKOTWithBill,
      'hideParcelButton': hideParcelButton,
      'allowSaleWithoutTax': allowSaleWithoutTax,
      'askCustomerInBillCreation': askCustomerInBillCreation,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppSettingsRecordDocumentEquality implements Equality<AppSettingsRecord> {
  const AppSettingsRecordDocumentEquality();

  @override
  bool equals(AppSettingsRecord? e1, AppSettingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.billFormatSendToEmail == e2?.billFormatSendToEmail &&
        e1?.billSettlement == e2?.billSettlement &&
        e1?.calculateReverseQuantity == e2?.calculateReverseQuantity &&
        e1?.captainDetails == e2?.captainDetails &&
        e1?.captainRequest == e2?.captainRequest &&
        e1?.checkInCheckOut == e2?.checkInCheckOut &&
        e1?.couponKotHeader == e2?.couponKotHeader &&
        e1?.couponPrintBill == e2?.couponPrintBill &&
        e1?.couponSaveBill == e2?.couponSaveBill &&
        e1?.deliveryNote == e2?.deliveryNote &&
        e1?.saveButton == e2?.saveButton &&
        e1?.saveKot == e2?.saveKot &&
        e1?.discountToBill == e2?.discountToBill &&
        e1?.doNotShowProductList == e2?.doNotShowProductList &&
        e1?.barcodeMenu == e2?.barcodeMenu &&
        e1?.billModificationtoUser == e2?.billModificationtoUser &&
        e1?.comboPriceUpdate == e2?.comboPriceUpdate &&
        e1?.customerAdvance == e2?.customerAdvance &&
        e1?.customerforcefully == e2?.customerforcefully &&
        e1?.editingSettlement == e2?.editingSettlement &&
        e1?.floatingKeyboard == e2?.floatingKeyboard &&
        e1?.goodsReceivedMenu == e2?.goodsReceivedMenu &&
        e1?.kotPrintAmountColumn == e2?.kotPrintAmountColumn &&
        e1?.kotReprint == e2?.kotReprint &&
        e1?.loyaltyPoints == e2?.loyaltyPoints &&
        e1?.onlineOrderSystem == e2?.onlineOrderSystem &&
        e1?.openingBalanceAmountSet == e2?.openingBalanceAmountSet &&
        e1?.openingBalancePopup == e2?.openingBalancePopup &&
        e1?.paymentMenu == e2?.paymentMenu &&
        e1?.salesman == e2?.salesman &&
        e1?.salesmanForcefully == e2?.salesmanForcefully &&
        e1?.salesmanProductWise == e2?.salesmanProductWise &&
        e1?.stockOutMenu == e2?.stockOutMenu &&
        e1?.store == e2?.store &&
        e1?.tableForcefully == e2?.tableForcefully &&
        e1?.threeCharSearch == e2?.threeCharSearch &&
        e1?.wlanCommunication == e2?.wlanCommunication &&
        e1?.estimateMode == e2?.estimateMode &&
        e1?.hideKeyboard == e2?.hideKeyboard &&
        e1?.hideProductSearchCode == e2?.hideProductSearchCode &&
        e1?.inclusiveTax == e2?.inclusiveTax &&
        e1?.itemStockRequestSent == e2?.itemStockRequestSent &&
        e1?.kotRemark == e2?.kotRemark &&
        e1?.manualPrice == e2?.manualPrice &&
        e1?.openPrice == e2?.openPrice &&
        e1?.pemisesShowCodeWise == e2?.pemisesShowCodeWise &&
        e1?.productSuggestionRemove == e2?.productSuggestionRemove &&
        e1?.regionalLanguage == e2?.regionalLanguage &&
        e1?.rfidMasterRead == e2?.rfidMasterRead &&
        e1?.rfidMasterWrite == e2?.rfidMasterWrite &&
        e1?.searchWithOnlyBarcode == e2?.searchWithOnlyBarcode &&
        e1?.sendSMS == e2?.sendSMS &&
        e1?.showHoldListButton == e2?.showHoldListButton &&
        e1?.showPrintButtonsAfterPay == e2?.showPrintButtonsAfterPay &&
        e1?.showProductImage == e2?.showProductImage &&
        e1?.sortHotKeys == e2?.sortHotKeys &&
        e1?.stockGettingMinus == e2?.stockGettingMinus &&
        e1?.stockRequestAccept == e2?.stockRequestAccept &&
        e1?.tables == e2?.tables &&
        e1?.upiButton == e2?.upiButton &&
        e1?.vehicleNumber == e2?.vehicleNumber &&
        e1?.weightMinus == e2?.weightMinus &&
        e1?.code == e2?.code &&
        e1?.barcodeOnBill == e2?.barcodeOnBill &&
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
        e1?.openSoftKeyWord == e2?.openSoftKeyWord &&
        e1?.rateColumnTax == e2?.rateColumnTax &&
        e1?.showProductImg == e2?.showProductImg &&
        e1?.regularScreen == e2?.regularScreen &&
        e1?.tableScreen == e2?.tableScreen &&
        e1?.fullScreenQr == e2?.fullScreenQr &&
        e1?.fullScreenBill == e2?.fullScreenBill &&
        e1?.productAndList == e2?.productAndList &&
        e1?.shiftEndBtn == e2?.shiftEndBtn &&
        e1?.deviceId == e2?.deviceId &&
        e1?.kioSKscreen == e2?.kioSKscreen &&
        e1?.ethernetPrint == e2?.ethernetPrint &&
        e1?.printKOTWithBill == e2?.printKOTWithBill &&
        e1?.hideParcelButton == e2?.hideParcelButton &&
        listEquality.equals(e1?.settingList, e2?.settingList) &&
        e1?.allowSaleWithoutTax == e2?.allowSaleWithoutTax &&
        e1?.askCustomerInBillCreation == e2?.askCustomerInBillCreation;
  }

  @override
  int hash(AppSettingsRecord? e) => const ListEquality().hash([
        e?.billFormatSendToEmail,
        e?.billSettlement,
        e?.calculateReverseQuantity,
        e?.captainDetails,
        e?.captainRequest,
        e?.checkInCheckOut,
        e?.couponKotHeader,
        e?.couponPrintBill,
        e?.couponSaveBill,
        e?.deliveryNote,
        e?.saveButton,
        e?.saveKot,
        e?.discountToBill,
        e?.doNotShowProductList,
        e?.barcodeMenu,
        e?.billModificationtoUser,
        e?.comboPriceUpdate,
        e?.customerAdvance,
        e?.customerforcefully,
        e?.editingSettlement,
        e?.floatingKeyboard,
        e?.goodsReceivedMenu,
        e?.kotPrintAmountColumn,
        e?.kotReprint,
        e?.loyaltyPoints,
        e?.onlineOrderSystem,
        e?.openingBalanceAmountSet,
        e?.openingBalancePopup,
        e?.paymentMenu,
        e?.salesman,
        e?.salesmanForcefully,
        e?.salesmanProductWise,
        e?.stockOutMenu,
        e?.store,
        e?.tableForcefully,
        e?.threeCharSearch,
        e?.wlanCommunication,
        e?.estimateMode,
        e?.hideKeyboard,
        e?.hideProductSearchCode,
        e?.inclusiveTax,
        e?.itemStockRequestSent,
        e?.kotRemark,
        e?.manualPrice,
        e?.openPrice,
        e?.pemisesShowCodeWise,
        e?.productSuggestionRemove,
        e?.regionalLanguage,
        e?.rfidMasterRead,
        e?.rfidMasterWrite,
        e?.searchWithOnlyBarcode,
        e?.sendSMS,
        e?.showHoldListButton,
        e?.showPrintButtonsAfterPay,
        e?.showProductImage,
        e?.sortHotKeys,
        e?.stockGettingMinus,
        e?.stockRequestAccept,
        e?.tables,
        e?.upiButton,
        e?.vehicleNumber,
        e?.weightMinus,
        e?.code,
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
        e?.openSoftKeyWord,
        e?.rateColumnTax,
        e?.showProductImg,
        e?.regularScreen,
        e?.tableScreen,
        e?.fullScreenQr,
        e?.fullScreenBill,
        e?.productAndList,
        e?.shiftEndBtn,
        e?.deviceId,
        e?.kioSKscreen,
        e?.ethernetPrint,
        e?.printKOTWithBill,
        e?.hideParcelButton,
        e?.settingList,
        e?.allowSaleWithoutTax,
        e?.askCustomerInBillCreation
      ]);

  @override
  bool isValidKey(Object? o) => o is AppSettingsRecord;
}
