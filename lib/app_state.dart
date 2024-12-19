import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _show = prefs.getBool('ff_show') ?? _show;
    });
    _safeInit(() {
      _showGrid = prefs.getBool('ff_showGrid') ?? _showGrid;
    });
    _safeInit(() {
      _itemCartList = prefs.getStringList('ff_itemCartList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _itemCartList;
    });
    _safeInit(() {
      _outletId = prefs.getString('ff_outletId') ?? _outletId;
    });
    _safeInit(() {
      _outletIdRef = prefs.getString('ff_outletIdRef')?.ref ?? _outletIdRef;
    });
    _safeInit(() {
      _count = prefs.getInt('ff_count') ?? _count;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_paymentDetails')) {
        try {
          _paymentDetails =
              jsonDecode(prefs.getString('ff_paymentDetails') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _billAmt = prefs.getDouble('ff_billAmt') ?? _billAmt;
    });
    _safeInit(() {
      _disAmt = prefs.getDouble('ff_disAmt') ?? _disAmt;
    });
    _safeInit(() {
      _disPer = prefs.getDouble('ff_disPer') ?? _disPer;
    });
    _safeInit(() {
      _finalAmt = prefs.getDouble('ff_finalAmt') ?? _finalAmt;
    });
    _safeInit(() {
      _subTotal = prefs.getDouble('ff_subTotal') ?? _subTotal;
    });
    _safeInit(() {
      _showApplyContainer =
          prefs.getBool('ff_showApplyContainer') ?? _showApplyContainer;
    });
    _safeInit(() {
      _labelContentList = prefs.getStringList('ff_labelContentList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _labelContentList;
    });
    _safeInit(() {
      _selectedConfig = prefs.getStringList('ff_selectedConfig')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _selectedConfig;
    });
    _safeInit(() {
      _showAppSettings =
          prefs.getBool('ff_showAppSettings') ?? _showAppSettings;
    });
    _safeInit(() {
      _showPrintSettings =
          prefs.getBool('ff_showPrintSettings') ?? _showPrintSettings;
    });
    _safeInit(() {
      _posMode = prefs.getString('ff_posMode') ?? _posMode;
    });
    _safeInit(() {
      _printerType = prefs.getString('ff_printerType') ?? _printerType;
    });
    _safeInit(() {
      _paperSize = prefs.getString('ff_paperSize') ?? _paperSize;
    });
    _safeInit(() {
      _posModelList = prefs.getStringList('ff_posModelList') ?? _posModelList;
    });
    _safeInit(() {
      _printerTypeList =
          prefs.getStringList('ff_printerTypeList') ?? _printerTypeList;
    });
    _safeInit(() {
      _paperSizeList =
          prefs.getStringList('ff_paperSizeList') ?? _paperSizeList;
    });
    _safeInit(() {
      _printerSetPosMode =
          prefs.getString('ff_printerSetPosMode') ?? _printerSetPosMode;
    });
    _safeInit(() {
      _printerSetPaperSize =
          prefs.getString('ff_printerSetPaperSize') ?? _printerSetPaperSize;
    });
    _safeInit(() {
      _printerSetPosModeList =
          prefs.getStringList('ff_printerSetPosModeList') ??
              _printerSetPosModeList;
    });
    _safeInit(() {
      _printerSetPrinterTypeList =
          prefs.getStringList('ff_printerSetPrinterTypeList') ??
              _printerSetPrinterTypeList;
    });
    _safeInit(() {
      _printerSetPaperSizeList =
          prefs.getStringList('ff_printerSetPaperSizeList') ??
              _printerSetPaperSizeList;
    });
    _safeInit(() {
      _printerSetPrinterType =
          prefs.getString('ff_printerSetPrinterType') ?? _printerSetPrinterType;
    });
    _safeInit(() {
      _headerList = prefs.getStringList('ff_headerList') ?? _headerList;
    });
    _safeInit(() {
      _footerList = prefs.getStringList('ff_footerList') ?? _footerList;
    });
    _safeInit(() {
      _bankDetailHeaderList = prefs.getStringList('ff_bankDetailHeaderList') ??
          _bankDetailHeaderList;
    });
    _safeInit(() {
      _isFullListShow = prefs.getBool('ff_isFullListShow') ?? _isFullListShow;
    });
    _safeInit(() {
      _setProductName = prefs.getString('ff_setProductName') ?? _setProductName;
    });
    _safeInit(() {
      _selectProductMastRef = prefs.getString('ff_selectProductMastRef')?.ref ??
          _selectProductMastRef;
    });
    _safeInit(() {
      _setTaxMastName = prefs.getString('ff_setTaxMastName') ?? _setTaxMastName;
    });
    _safeInit(() {
      _aetTaxMastRef =
          prefs.getString('ff_aetTaxMastRef')?.ref ?? _aetTaxMastRef;
    });
    _safeInit(() {
      _setCategoryName =
          prefs.getString('ff_setCategoryName') ?? _setCategoryName;
    });
    _safeInit(() {
      _setCategoryRef =
          prefs.getString('ff_setCategoryRef')?.ref ?? _setCategoryRef;
    });
    _safeInit(() {
      _custNameRef = prefs.getString('ff_custNameRef')?.ref ?? _custNameRef;
    });
    _safeInit(() {
      _dId = prefs.getString('ff_dId') ?? _dId;
    });
    _safeInit(() {
      _PayMode = prefs.getString('ff_PayMode') ?? _PayMode;
    });
    _safeInit(() {
      _shiftCount = prefs.getInt('ff_shiftCount') ?? _shiftCount;
    });
    _safeInit(() {
      _logedInUserDetail =
          prefs.getString('ff_logedInUserDetail')?.ref ?? _logedInUserDetail;
    });
    _safeInit(() {
      _setCustName = prefs.getString('ff_setCustName') ?? _setCustName;
    });
    _safeInit(() {
      _setCustRef = prefs.getString('ff_setCustRef')?.ref ?? _setCustRef;
    });
    _safeInit(() {
      _totalQuantity = prefs.getDouble('ff_totalQuantity') ?? _totalQuantity;
    });
    _safeInit(() {
      _delCharges = prefs.getDouble('ff_delCharges') ?? _delCharges;
    });
    _safeInit(() {
      _setProdName = prefs.getString('ff_setProdName') ?? _setProdName;
    });
    _safeInit(() {
      _setProdRef = prefs.getString('ff_setProdRef')?.ref ?? _setProdRef;
    });
    _safeInit(() {
      _allBillsList = prefs.getStringList('ff_allBillsList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _allBillsList;
    });
    _safeInit(() {
      _holdBillCount = prefs.getInt('ff_holdBillCount') ?? _holdBillCount;
    });
    _safeInit(() {
      _codeLenght = prefs.getInt('ff_codeLenght') ?? _codeLenght;
    });
    _safeInit(() {
      _catUpdate =
          prefs.getStringList('ff_catUpdate')?.map(int.parse).toList() ??
              _catUpdate;
    });
    _safeInit(() {
      _selBill = prefs.getInt('ff_selBill') ?? _selBill;
    });
    _safeInit(() {
      _orderColor = prefs.getBool('ff_orderColor') ?? _orderColor;
    });
    _safeInit(() {
      _shiftDocExists = prefs.getBool('ff_shiftDocExists') ?? _shiftDocExists;
    });
    _safeInit(() {
      _shiftDocRef = prefs.getString('ff_shiftDocRef')?.ref ?? _shiftDocRef;
    });
    _safeInit(() {
      _tableSetting = prefs.getBool('ff_tableSetting') ?? _tableSetting;
    });
    _safeInit(() {
      _CustSetting = prefs.getBool('ff_CustSetting') ?? _CustSetting;
    });
    _safeInit(() {
      _barcodeSet = prefs.getBool('ff_barcodeSet') ?? _barcodeSet;
    });
    _safeInit(() {
      _rfidSetting = prefs.getBool('ff_rfidSetting') ?? _rfidSetting;
    });
    _safeInit(() {
      _salesmanSet = prefs.getBool('ff_salesmanSet') ?? _salesmanSet;
    });
    _safeInit(() {
      _checkAppSetting = prefs.getStringList('ff_checkAppSetting')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _checkAppSetting;
    });
    _safeInit(() {
      _tableViewHideShow =
          prefs.getBool('ff_tableViewHideShow') ?? _tableViewHideShow;
    });
    _safeInit(() {
      _noOfItems = prefs.getInt('ff_noOfItems') ?? _noOfItems;
    });
    _safeInit(() {
      _headerDocExists =
          prefs.getBool('ff_headerDocExists') ?? _headerDocExists;
    });
    _safeInit(() {
      _headerDocRef = prefs.getString('ff_headerDocRef')?.ref ?? _headerDocRef;
    });
    _safeInit(() {
      _fsDisAmt = prefs.getDouble('ff_fsDisAmt') ?? _fsDisAmt;
    });
    _safeInit(() {
      _fsDisPer = prefs.getDouble('ff_fsDisPer') ?? _fsDisPer;
    });
    _safeInit(() {
      _fsDelChrg = prefs.getDouble('ff_fsDelChrg') ?? _fsDelChrg;
    });
    _safeInit(() {
      _fsTendCash = prefs.getDouble('ff_fsTendCash') ?? _fsTendCash;
    });
    _safeInit(() {
      _fsReturnCash = prefs.getDouble('ff_fsReturnCash') ?? _fsReturnCash;
    });
    _safeInit(() {
      _fsTaxAMt = prefs.getDouble('ff_fsTaxAMt') ?? _fsTaxAMt;
    });
    _safeInit(() {
      _AddCustList = prefs.getStringList('ff_AddCustList') ?? _AddCustList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_printerDevice')) {
        try {
          _printerDevice =
              jsonDecode(prefs.getString('ff_printerDevice') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isPrinterConnected =
          prefs.getBool('ff_isPrinterConnected') ?? _isPrinterConnected;
    });
    _safeInit(() {
      _lastBill = prefs.getDouble('ff_lastBill') ?? _lastBill;
    });
    _safeInit(() {
      _printerName = prefs.getString('ff_printerName') ?? _printerName;
    });
    _safeInit(() {
      _icon = prefs.getBool('ff_icon') ?? _icon;
    });
    _safeInit(() {
      _filterDate = prefs.getString('ff_filterDate') ?? _filterDate;
    });
    _safeInit(() {
      _selectedPremise =
          prefs.getString('ff_selectedPremise') ?? _selectedPremise;
    });
    _safeInit(() {
      _activeHoldBill = prefs.getStringList('ff_activeHoldBill')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _activeHoldBill;
    });
    _safeInit(() {
      _BillColor = prefs.getStringList('ff_BillColor') ?? _BillColor;
    });
    _safeInit(() {
      _todaysTotal = prefs.getStringList('ff_todaysTotal')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _todaysTotal;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_summaryJSON')) {
        try {
          _summaryJSON = jsonDecode(prefs.getString('ff_summaryJSON') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _filtervalue = prefs.getString('ff_filtervalue') ?? _filtervalue;
    });
    _safeInit(() {
      _preferredSearchDate =
          prefs.getString('ff_preferredSearchDate') ?? _preferredSearchDate;
    });
    _safeInit(() {
      _preferredSearchDateEnd = prefs.getString('ff_preferredSearchDateEnd') ??
          _preferredSearchDateEnd;
    });
    _safeInit(() {
      _OpeningBalance = prefs.getDouble('ff_OpeningBalance') ?? _OpeningBalance;
    });
    _safeInit(() {
      _textProduct = prefs.getBool('ff_textProduct') ?? _textProduct;
    });
    _safeInit(() {
      _selectStartDate = prefs.getInt('ff_selectStartDate') ?? _selectStartDate;
    });
    _safeInit(() {
      _selectEndDate = prefs.getInt('ff_selectEndDate') ?? _selectEndDate;
    });
    _safeInit(() {
      _flotKeypadHideShow =
          prefs.getBool('ff_flotKeypadHideShow') ?? _flotKeypadHideShow;
    });
    _safeInit(() {
      _prodListStyle = prefs.getString('ff_prodListStyle') ?? _prodListStyle;
    });
    _safeInit(() {
      _custDetails = prefs.getBool('ff_custDetails') ?? _custDetails;
    });
    _safeInit(() {
      _defPayMode = prefs.getString('ff_defPayMode') ?? _defPayMode;
    });
    _safeInit(() {
      _outletName = prefs.getString('ff_outletName') ?? _outletName;
    });
    _safeInit(() {
      _purchaseStatus =
          prefs.getString('ff_purchaseStatus')?.ref ?? _purchaseStatus;
    });
    _safeInit(() {
      _setCategoryColor =
          prefs.getString('ff_setCategoryColor') ?? _setCategoryColor;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_setHoldListColor')) {
        try {
          _setHoldListColor =
              jsonDecode(prefs.getString('ff_setHoldListColor') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _categoryColor = prefs.getString('ff_categoryColor') ?? _categoryColor;
    });
    _safeInit(() {
      _allBtnColor =
          _colorFromIntValue(prefs.getInt('ff_allBtnColor')) ?? _allBtnColor;
    });
    _safeInit(() {
      _custId = prefs.getString('ff_custId') ?? _custId;
    });
    _safeInit(() {
      _selectedPurchaceProdJson =
          prefs.getStringList('ff_selectedPurchaceProdJson')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _selectedPurchaceProdJson;
    });
    _safeInit(() {
      _catAllColor =
          _colorFromIntValue(prefs.getInt('ff_catAllColor')) ?? _catAllColor;
    });
    _safeInit(() {
      _productColor = prefs.getString('ff_productColor') ?? _productColor;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_shiftDetailsJson')) {
        try {
          _shiftDetailsJson =
              jsonDecode(prefs.getString('ff_shiftDetailsJson') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _selectedPrinterDevice =
          prefs.getStringList('ff_selectedPrinterDevice')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _selectedPrinterDevice;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_pairedDevice')) {
        try {
          _pairedDevice = jsonDecode(prefs.getString('ff_pairedDevice') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _printerIndex = prefs.getString('ff_printerIndex') ?? _printerIndex;
    });
    _safeInit(() {
      _showBillReportList =
          prefs.getBool('ff_showBillReportList') ?? _showBillReportList;
    });
    _safeInit(() {
      _invoiceRef = prefs.getString('ff_invoiceRef')?.ref ?? _invoiceRef;
    });
    _safeInit(() {
      _testing = prefs.getString('ff_testing') ?? _testing;
    });
    _safeInit(() {
      _billPrintHeader =
          prefs.getString('ff_billPrintHeader') ?? _billPrintHeader;
    });
    _safeInit(() {
      _billPrintFooter =
          prefs.getString('ff_billPrintFooter') ?? _billPrintFooter;
    });
    _safeInit(() {
      _hideHeaderFooter =
          prefs.getBool('ff_hideHeaderFooter') ?? _hideHeaderFooter;
    });
    _safeInit(() {
      _resultList = prefs.getStringList('ff_resultList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _resultList;
    });
    _safeInit(() {
      _hide = prefs.getBool('ff_hide') ?? _hide;
    });
    _safeInit(() {
      _targetPlatform = prefs.getString('ff_targetPlatform') ?? _targetPlatform;
    });
    _safeInit(() {
      _barcodeSetting = prefs.getBool('ff_barcodeSetting') ?? _barcodeSetting;
    });
    _safeInit(() {
      _currentMobileString =
          prefs.getString('ff_currentMobileString') ?? _currentMobileString;
    });
    _safeInit(() {
      _bmDocRef = prefs.getString('ff_bmDocRef')?.ref ?? _bmDocRef;
    });
    _safeInit(() {
      _setBmcolor = prefs.getString('ff_setBmcolor') ?? _setBmcolor;
    });
    _safeInit(() {
      _bmDocId = prefs.getString('ff_bmDocId') ?? _bmDocId;
    });
    _safeInit(() {
      _shiftDate = prefs.getString('ff_shiftDate') ?? _shiftDate;
    });
    _safeInit(() {
      _deviceqrId = prefs.getString('ff_deviceqrId') ?? _deviceqrId;
    });
    _safeInit(() {
      _screenSize = prefs.getDouble('ff_screenSize') ?? _screenSize;
    });
    _safeInit(() {
      _isButtonselected =
          prefs.getBool('ff_isButtonselected') ?? _isButtonselected;
    });
    _safeInit(() {
      _catCodelength = prefs.getInt('ff_catCodelength') ?? _catCodelength;
    });
    _safeInit(() {
      _codeUpdate =
          prefs.getStringList('ff_codeUpdate')?.map(int.parse).toList() ??
              _codeUpdate;
    });
    _safeInit(() {
      _setCategoryMasterName =
          prefs.getString('ff_setCategoryMasterName') ?? _setCategoryMasterName;
    });
    _safeInit(() {
      _isFullistShown = prefs.getBool('ff_isFullistShown') ?? _isFullistShown;
    });
    _safeInit(() {
      _accessContainer =
          prefs.getBool('ff_accessContainer') ?? _accessContainer;
    });
    _safeInit(() {
      _parkingCharges = prefs.getDouble('ff_parkingCharges') ?? _parkingCharges;
    });
    _safeInit(() {
      _orderId = prefs.getInt('ff_orderId') ?? _orderId;
    });
    _safeInit(() {
      _ethernetPrint = prefs.getBool('ff_ethernetPrint') ?? _ethernetPrint;
    });
    _safeInit(() {
      _port = prefs.getString('ff_port') ?? _port;
    });
    _safeInit(() {
      _ipAddresss = prefs.getString('ff_ipAddresss') ?? _ipAddresss;
    });
    _safeInit(() {
      _navigate = prefs.getString('ff_navigate') ?? _navigate;
    });
    _safeInit(() {
      _version = prefs.getString('ff_version') ?? _version;
    });
    _safeInit(() {
      _mid = prefs.getString('ff_mid') ?? _mid;
    });
    _safeInit(() {
      _tokenNo = prefs.getInt('ff_tokenNo') ?? _tokenNo;
    });
    _safeInit(() {
      _internet = prefs.getBool('ff_internet') ?? _internet;
    });
    _safeInit(() {
      _disAmtPay = prefs.getDouble('ff_disAmtPay') ?? _disAmtPay;
    });
    _safeInit(() {
      _taxAmtPay = prefs.getDouble('ff_taxAmtPay') ?? _taxAmtPay;
    });
    _safeInit(() {
      _newcount = prefs.getInt('ff_newcount') ?? _newcount;
    });
    _safeInit(() {
      _directory = prefs.getString('ff_directory') ?? _directory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _show = false;
  bool get show => _show;
  set show(bool value) {
    _show = value;
    prefs.setBool('ff_show', value);
  }

  bool _showGrid = false;
  bool get showGrid => _showGrid;
  set showGrid(bool value) {
    _showGrid = value;
    prefs.setBool('ff_showGrid', value);
  }

  List<dynamic> _itemCartList = [];
  List<dynamic> get itemCartList => _itemCartList;
  set itemCartList(List<dynamic> value) {
    _itemCartList = value;
    prefs.setStringList(
        'ff_itemCartList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToItemCartList(dynamic value) {
    itemCartList.add(value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromItemCartList(dynamic value) {
    itemCartList.remove(value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromItemCartList(int index) {
    itemCartList.removeAt(index);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void updateItemCartListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    itemCartList[index] = updateFn(_itemCartList[index]);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInItemCartList(int index, dynamic value) {
    itemCartList.insert(index, value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  String _outletId = '';
  String get outletId => _outletId;
  set outletId(String value) {
    _outletId = value;
    prefs.setString('ff_outletId', value);
  }

  DocumentReference? _outletIdRef;
  DocumentReference? get outletIdRef => _outletIdRef;
  set outletIdRef(DocumentReference? value) {
    _outletIdRef = value;
    value != null
        ? prefs.setString('ff_outletIdRef', value.path)
        : prefs.remove('ff_outletIdRef');
  }

  int _count = 0;
  int get count => _count;
  set count(int value) {
    _count = value;
    prefs.setInt('ff_count', value);
  }

  dynamic _paymentDetails;
  dynamic get paymentDetails => _paymentDetails;
  set paymentDetails(dynamic value) {
    _paymentDetails = value;
    prefs.setString('ff_paymentDetails', jsonEncode(value));
  }

  double _billAmt = 0.0;
  double get billAmt => _billAmt;
  set billAmt(double value) {
    _billAmt = value;
    prefs.setDouble('ff_billAmt', value);
  }

  double _disAmt = 0.0;
  double get disAmt => _disAmt;
  set disAmt(double value) {
    _disAmt = value;
    prefs.setDouble('ff_disAmt', value);
  }

  double _disPer = 0.0;
  double get disPer => _disPer;
  set disPer(double value) {
    _disPer = value;
    prefs.setDouble('ff_disPer', value);
  }

  double _finalAmt = 0.0;
  double get finalAmt => _finalAmt;
  set finalAmt(double value) {
    _finalAmt = value;
    prefs.setDouble('ff_finalAmt', value);
  }

  double _subTotal = 0.0;
  double get subTotal => _subTotal;
  set subTotal(double value) {
    _subTotal = value;
    prefs.setDouble('ff_subTotal', value);
  }

  bool _showApplyContainer = true;
  bool get showApplyContainer => _showApplyContainer;
  set showApplyContainer(bool value) {
    _showApplyContainer = value;
    prefs.setBool('ff_showApplyContainer', value);
  }

  dynamic _selectedItem = jsonDecode('\"{price:0,quantity:0,amount:0}\"');
  dynamic get selectedItem => _selectedItem;
  set selectedItem(dynamic value) {
    _selectedItem = value;
  }

  DocumentReference? _billRef;
  DocumentReference? get billRef => _billRef;
  set billRef(DocumentReference? value) {
    _billRef = value;
  }

  String _invoice = '';
  String get invoice => _invoice;
  set invoice(String value) {
    _invoice = value;
  }

  dynamic _selectedInvoiceJson;
  dynamic get selectedInvoiceJson => _selectedInvoiceJson;
  set selectedInvoiceJson(dynamic value) {
    _selectedInvoiceJson = value;
  }

  List<dynamic> _labelContentList = [
    jsonDecode('{\"title\":\"Shop name:\",\"value\":true}'),
    jsonDecode('{\"title\":\"Price\",\"value:\":true}'),
    jsonDecode('{\"title\":\"Short code:\",\"value\":false}'),
    jsonDecode('{\"title\":\"HSN Number:\",\"value\":false}'),
    jsonDecode('{\"title\":\"Discount:\",\"value\":false}'),
    jsonDecode('{\"title\":\"MFG Date:\",\"value\":false}'),
    jsonDecode('{\"title\":\"PACK Date:\",\"value\":false}'),
    jsonDecode('{\"title\":\"Name:\",\"value\":true}'),
    jsonDecode('{\"title\":\"Short Name:\",\"value\":false}'),
    jsonDecode('{\"title\":\"Category:\",\"value\":false}'),
    jsonDecode('{\"title\":\"MRP:\",\"value\":false}'),
    jsonDecode('{\"title\":\"Purchace Price:\",\"value\":false}'),
    jsonDecode('{\"title\":\"EXP Date:\",\"value\":false}'),
    jsonDecode('{\"title\":\"Batch No:\",\"value\":false}')
  ];
  List<dynamic> get labelContentList => _labelContentList;
  set labelContentList(List<dynamic> value) {
    _labelContentList = value;
    prefs.setStringList(
        'ff_labelContentList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToLabelContentList(dynamic value) {
    labelContentList.add(value);
    prefs.setStringList('ff_labelContentList',
        _labelContentList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLabelContentList(dynamic value) {
    labelContentList.remove(value);
    prefs.setStringList('ff_labelContentList',
        _labelContentList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLabelContentList(int index) {
    labelContentList.removeAt(index);
    prefs.setStringList('ff_labelContentList',
        _labelContentList.map((x) => jsonEncode(x)).toList());
  }

  void updateLabelContentListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    labelContentList[index] = updateFn(_labelContentList[index]);
    prefs.setStringList('ff_labelContentList',
        _labelContentList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLabelContentList(int index, dynamic value) {
    labelContentList.insert(index, value);
    prefs.setStringList('ff_labelContentList',
        _labelContentList.map((x) => jsonEncode(x)).toList());
  }

  String _barcodeLabelSize = '';
  String get barcodeLabelSize => _barcodeLabelSize;
  set barcodeLabelSize(String value) {
    _barcodeLabelSize = value;
  }

  List<dynamic> _selectedConfig = [];
  List<dynamic> get selectedConfig => _selectedConfig;
  set selectedConfig(List<dynamic> value) {
    _selectedConfig = value;
    prefs.setStringList(
        'ff_selectedConfig', value.map((x) => jsonEncode(x)).toList());
  }

  void addToSelectedConfig(dynamic value) {
    selectedConfig.add(value);
    prefs.setStringList('ff_selectedConfig',
        _selectedConfig.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSelectedConfig(dynamic value) {
    selectedConfig.remove(value);
    prefs.setStringList('ff_selectedConfig',
        _selectedConfig.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSelectedConfig(int index) {
    selectedConfig.removeAt(index);
    prefs.setStringList('ff_selectedConfig',
        _selectedConfig.map((x) => jsonEncode(x)).toList());
  }

  void updateSelectedConfigAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    selectedConfig[index] = updateFn(_selectedConfig[index]);
    prefs.setStringList('ff_selectedConfig',
        _selectedConfig.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSelectedConfig(int index, dynamic value) {
    selectedConfig.insert(index, value);
    prefs.setStringList('ff_selectedConfig',
        _selectedConfig.map((x) => jsonEncode(x)).toList());
  }

  bool _showAppSettings = false;
  bool get showAppSettings => _showAppSettings;
  set showAppSettings(bool value) {
    _showAppSettings = value;
    prefs.setBool('ff_showAppSettings', value);
  }

  bool _showPrintSettings = false;
  bool get showPrintSettings => _showPrintSettings;
  set showPrintSettings(bool value) {
    _showPrintSettings = value;
    prefs.setBool('ff_showPrintSettings', value);
  }

  String _posMode = '';
  String get posMode => _posMode;
  set posMode(String value) {
    _posMode = value;
    prefs.setString('ff_posMode', value);
  }

  String _printerType = '';
  String get printerType => _printerType;
  set printerType(String value) {
    _printerType = value;
    prefs.setString('ff_printerType', value);
  }

  String _paperSize = '';
  String get paperSize => _paperSize;
  set paperSize(String value) {
    _paperSize = value;
    prefs.setString('ff_paperSize', value);
  }

  List<String> _posModelList = ['307', 'TT', 'Magic', 'Magic pro'];
  List<String> get posModelList => _posModelList;
  set posModelList(List<String> value) {
    _posModelList = value;
    prefs.setStringList('ff_posModelList', value);
  }

  void addToPosModelList(String value) {
    posModelList.add(value);
    prefs.setStringList('ff_posModelList', _posModelList);
  }

  void removeFromPosModelList(String value) {
    posModelList.remove(value);
    prefs.setStringList('ff_posModelList', _posModelList);
  }

  void removeAtIndexFromPosModelList(int index) {
    posModelList.removeAt(index);
    prefs.setStringList('ff_posModelList', _posModelList);
  }

  void updatePosModelListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    posModelList[index] = updateFn(_posModelList[index]);
    prefs.setStringList('ff_posModelList', _posModelList);
  }

  void insertAtIndexInPosModelList(int index, String value) {
    posModelList.insert(index, value);
    prefs.setStringList('ff_posModelList', _posModelList);
  }

  List<String> _printerTypeList = ['USB', 'Bluetooth'];
  List<String> get printerTypeList => _printerTypeList;
  set printerTypeList(List<String> value) {
    _printerTypeList = value;
    prefs.setStringList('ff_printerTypeList', value);
  }

  void addToPrinterTypeList(String value) {
    printerTypeList.add(value);
    prefs.setStringList('ff_printerTypeList', _printerTypeList);
  }

  void removeFromPrinterTypeList(String value) {
    printerTypeList.remove(value);
    prefs.setStringList('ff_printerTypeList', _printerTypeList);
  }

  void removeAtIndexFromPrinterTypeList(int index) {
    printerTypeList.removeAt(index);
    prefs.setStringList('ff_printerTypeList', _printerTypeList);
  }

  void updatePrinterTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    printerTypeList[index] = updateFn(_printerTypeList[index]);
    prefs.setStringList('ff_printerTypeList', _printerTypeList);
  }

  void insertAtIndexInPrinterTypeList(int index, String value) {
    printerTypeList.insert(index, value);
    prefs.setStringList('ff_printerTypeList', _printerTypeList);
  }

  List<String> _paperSizeList = ['3 inch', '2 inch', 'A4 size', 'Dot Matrix'];
  List<String> get paperSizeList => _paperSizeList;
  set paperSizeList(List<String> value) {
    _paperSizeList = value;
    prefs.setStringList('ff_paperSizeList', value);
  }

  void addToPaperSizeList(String value) {
    paperSizeList.add(value);
    prefs.setStringList('ff_paperSizeList', _paperSizeList);
  }

  void removeFromPaperSizeList(String value) {
    paperSizeList.remove(value);
    prefs.setStringList('ff_paperSizeList', _paperSizeList);
  }

  void removeAtIndexFromPaperSizeList(int index) {
    paperSizeList.removeAt(index);
    prefs.setStringList('ff_paperSizeList', _paperSizeList);
  }

  void updatePaperSizeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    paperSizeList[index] = updateFn(_paperSizeList[index]);
    prefs.setStringList('ff_paperSizeList', _paperSizeList);
  }

  void insertAtIndexInPaperSizeList(int index, String value) {
    paperSizeList.insert(index, value);
    prefs.setStringList('ff_paperSizeList', _paperSizeList);
  }

  String _printerSetPosMode = '';
  String get printerSetPosMode => _printerSetPosMode;
  set printerSetPosMode(String value) {
    _printerSetPosMode = value;
    prefs.setString('ff_printerSetPosMode', value);
  }

  String _printerSetPaperSize = '';
  String get printerSetPaperSize => _printerSetPaperSize;
  set printerSetPaperSize(String value) {
    _printerSetPaperSize = value;
    prefs.setString('ff_printerSetPaperSize', value);
  }

  List<String> _printerSetPosModeList = ['307', 'TT', 'Magic', 'Magic Pro'];
  List<String> get printerSetPosModeList => _printerSetPosModeList;
  set printerSetPosModeList(List<String> value) {
    _printerSetPosModeList = value;
    prefs.setStringList('ff_printerSetPosModeList', value);
  }

  void addToPrinterSetPosModeList(String value) {
    printerSetPosModeList.add(value);
    prefs.setStringList('ff_printerSetPosModeList', _printerSetPosModeList);
  }

  void removeFromPrinterSetPosModeList(String value) {
    printerSetPosModeList.remove(value);
    prefs.setStringList('ff_printerSetPosModeList', _printerSetPosModeList);
  }

  void removeAtIndexFromPrinterSetPosModeList(int index) {
    printerSetPosModeList.removeAt(index);
    prefs.setStringList('ff_printerSetPosModeList', _printerSetPosModeList);
  }

  void updatePrinterSetPosModeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    printerSetPosModeList[index] = updateFn(_printerSetPosModeList[index]);
    prefs.setStringList('ff_printerSetPosModeList', _printerSetPosModeList);
  }

  void insertAtIndexInPrinterSetPosModeList(int index, String value) {
    printerSetPosModeList.insert(index, value);
    prefs.setStringList('ff_printerSetPosModeList', _printerSetPosModeList);
  }

  List<String> _printerSetPrinterTypeList = [
    'Serial',
    'Etherlet',
    'USB',
    'Bluetooth'
  ];
  List<String> get printerSetPrinterTypeList => _printerSetPrinterTypeList;
  set printerSetPrinterTypeList(List<String> value) {
    _printerSetPrinterTypeList = value;
    prefs.setStringList('ff_printerSetPrinterTypeList', value);
  }

  void addToPrinterSetPrinterTypeList(String value) {
    printerSetPrinterTypeList.add(value);
    prefs.setStringList(
        'ff_printerSetPrinterTypeList', _printerSetPrinterTypeList);
  }

  void removeFromPrinterSetPrinterTypeList(String value) {
    printerSetPrinterTypeList.remove(value);
    prefs.setStringList(
        'ff_printerSetPrinterTypeList', _printerSetPrinterTypeList);
  }

  void removeAtIndexFromPrinterSetPrinterTypeList(int index) {
    printerSetPrinterTypeList.removeAt(index);
    prefs.setStringList(
        'ff_printerSetPrinterTypeList', _printerSetPrinterTypeList);
  }

  void updatePrinterSetPrinterTypeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    printerSetPrinterTypeList[index] =
        updateFn(_printerSetPrinterTypeList[index]);
    prefs.setStringList(
        'ff_printerSetPrinterTypeList', _printerSetPrinterTypeList);
  }

  void insertAtIndexInPrinterSetPrinterTypeList(int index, String value) {
    printerSetPrinterTypeList.insert(index, value);
    prefs.setStringList(
        'ff_printerSetPrinterTypeList', _printerSetPrinterTypeList);
  }

  List<String> _printerSetPaperSizeList = [
    '3 inch',
    '2 inch',
    'A4 Size',
    'Dot Matrix'
  ];
  List<String> get printerSetPaperSizeList => _printerSetPaperSizeList;
  set printerSetPaperSizeList(List<String> value) {
    _printerSetPaperSizeList = value;
    prefs.setStringList('ff_printerSetPaperSizeList', value);
  }

  void addToPrinterSetPaperSizeList(String value) {
    printerSetPaperSizeList.add(value);
    prefs.setStringList('ff_printerSetPaperSizeList', _printerSetPaperSizeList);
  }

  void removeFromPrinterSetPaperSizeList(String value) {
    printerSetPaperSizeList.remove(value);
    prefs.setStringList('ff_printerSetPaperSizeList', _printerSetPaperSizeList);
  }

  void removeAtIndexFromPrinterSetPaperSizeList(int index) {
    printerSetPaperSizeList.removeAt(index);
    prefs.setStringList('ff_printerSetPaperSizeList', _printerSetPaperSizeList);
  }

  void updatePrinterSetPaperSizeListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    printerSetPaperSizeList[index] = updateFn(_printerSetPaperSizeList[index]);
    prefs.setStringList('ff_printerSetPaperSizeList', _printerSetPaperSizeList);
  }

  void insertAtIndexInPrinterSetPaperSizeList(int index, String value) {
    printerSetPaperSizeList.insert(index, value);
    prefs.setStringList('ff_printerSetPaperSizeList', _printerSetPaperSizeList);
  }

  String _printerSetPrinterType = '';
  String get printerSetPrinterType => _printerSetPrinterType;
  set printerSetPrinterType(String value) {
    _printerSetPrinterType = value;
    prefs.setString('ff_printerSetPrinterType', value);
  }

  List<String> _headerList = [];
  List<String> get headerList => _headerList;
  set headerList(List<String> value) {
    _headerList = value;
    prefs.setStringList('ff_headerList', value);
  }

  void addToHeaderList(String value) {
    headerList.add(value);
    prefs.setStringList('ff_headerList', _headerList);
  }

  void removeFromHeaderList(String value) {
    headerList.remove(value);
    prefs.setStringList('ff_headerList', _headerList);
  }

  void removeAtIndexFromHeaderList(int index) {
    headerList.removeAt(index);
    prefs.setStringList('ff_headerList', _headerList);
  }

  void updateHeaderListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    headerList[index] = updateFn(_headerList[index]);
    prefs.setStringList('ff_headerList', _headerList);
  }

  void insertAtIndexInHeaderList(int index, String value) {
    headerList.insert(index, value);
    prefs.setStringList('ff_headerList', _headerList);
  }

  List<String> _footerList = [];
  List<String> get footerList => _footerList;
  set footerList(List<String> value) {
    _footerList = value;
    prefs.setStringList('ff_footerList', value);
  }

  void addToFooterList(String value) {
    footerList.add(value);
    prefs.setStringList('ff_footerList', _footerList);
  }

  void removeFromFooterList(String value) {
    footerList.remove(value);
    prefs.setStringList('ff_footerList', _footerList);
  }

  void removeAtIndexFromFooterList(int index) {
    footerList.removeAt(index);
    prefs.setStringList('ff_footerList', _footerList);
  }

  void updateFooterListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    footerList[index] = updateFn(_footerList[index]);
    prefs.setStringList('ff_footerList', _footerList);
  }

  void insertAtIndexInFooterList(int index, String value) {
    footerList.insert(index, value);
    prefs.setStringList('ff_footerList', _footerList);
  }

  List<String> _bankDetailHeaderList = [];
  List<String> get bankDetailHeaderList => _bankDetailHeaderList;
  set bankDetailHeaderList(List<String> value) {
    _bankDetailHeaderList = value;
    prefs.setStringList('ff_bankDetailHeaderList', value);
  }

  void addToBankDetailHeaderList(String value) {
    bankDetailHeaderList.add(value);
    prefs.setStringList('ff_bankDetailHeaderList', _bankDetailHeaderList);
  }

  void removeFromBankDetailHeaderList(String value) {
    bankDetailHeaderList.remove(value);
    prefs.setStringList('ff_bankDetailHeaderList', _bankDetailHeaderList);
  }

  void removeAtIndexFromBankDetailHeaderList(int index) {
    bankDetailHeaderList.removeAt(index);
    prefs.setStringList('ff_bankDetailHeaderList', _bankDetailHeaderList);
  }

  void updateBankDetailHeaderListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    bankDetailHeaderList[index] = updateFn(_bankDetailHeaderList[index]);
    prefs.setStringList('ff_bankDetailHeaderList', _bankDetailHeaderList);
  }

  void insertAtIndexInBankDetailHeaderList(int index, String value) {
    bankDetailHeaderList.insert(index, value);
    prefs.setStringList('ff_bankDetailHeaderList', _bankDetailHeaderList);
  }

  bool _isFullListShow = false;
  bool get isFullListShow => _isFullListShow;
  set isFullListShow(bool value) {
    _isFullListShow = value;
    prefs.setBool('ff_isFullListShow', value);
  }

  String _setProductName = '';
  String get setProductName => _setProductName;
  set setProductName(String value) {
    _setProductName = value;
    prefs.setString('ff_setProductName', value);
  }

  DocumentReference? _selectProductMastRef;
  DocumentReference? get selectProductMastRef => _selectProductMastRef;
  set selectProductMastRef(DocumentReference? value) {
    _selectProductMastRef = value;
    value != null
        ? prefs.setString('ff_selectProductMastRef', value.path)
        : prefs.remove('ff_selectProductMastRef');
  }

  String _setTaxMastName = '';
  String get setTaxMastName => _setTaxMastName;
  set setTaxMastName(String value) {
    _setTaxMastName = value;
    prefs.setString('ff_setTaxMastName', value);
  }

  DocumentReference? _aetTaxMastRef;
  DocumentReference? get aetTaxMastRef => _aetTaxMastRef;
  set aetTaxMastRef(DocumentReference? value) {
    _aetTaxMastRef = value;
    value != null
        ? prefs.setString('ff_aetTaxMastRef', value.path)
        : prefs.remove('ff_aetTaxMastRef');
  }

  String _setCategoryName = '';
  String get setCategoryName => _setCategoryName;
  set setCategoryName(String value) {
    _setCategoryName = value;
    prefs.setString('ff_setCategoryName', value);
  }

  DocumentReference? _setCategoryRef;
  DocumentReference? get setCategoryRef => _setCategoryRef;
  set setCategoryRef(DocumentReference? value) {
    _setCategoryRef = value;
    value != null
        ? prefs.setString('ff_setCategoryRef', value.path)
        : prefs.remove('ff_setCategoryRef');
  }

  DocumentReference? _outletCatRef;
  DocumentReference? get outletCatRef => _outletCatRef;
  set outletCatRef(DocumentReference? value) {
    _outletCatRef = value;
  }

  DocumentReference? _custNameRef;
  DocumentReference? get custNameRef => _custNameRef;
  set custNameRef(DocumentReference? value) {
    _custNameRef = value;
    value != null
        ? prefs.setString('ff_custNameRef', value.path)
        : prefs.remove('ff_custNameRef');
  }

  String _dId = '';
  String get dId => _dId;
  set dId(String value) {
    _dId = value;
    prefs.setString('ff_dId', value);
  }

  String _PayMode = '';
  String get PayMode => _PayMode;
  set PayMode(String value) {
    _PayMode = value;
    prefs.setString('ff_PayMode', value);
  }

  int _shiftCount = 1;
  int get shiftCount => _shiftCount;
  set shiftCount(int value) {
    _shiftCount = value;
    prefs.setInt('ff_shiftCount', value);
  }

  DocumentReference? _logedInUserDetail;
  DocumentReference? get logedInUserDetail => _logedInUserDetail;
  set logedInUserDetail(DocumentReference? value) {
    _logedInUserDetail = value;
    value != null
        ? prefs.setString('ff_logedInUserDetail', value.path)
        : prefs.remove('ff_logedInUserDetail');
  }

  String _quickPin = '';
  String get quickPin => _quickPin;
  set quickPin(String value) {
    _quickPin = value;
  }

  bool _isCustListShown = true;
  bool get isCustListShown => _isCustListShown;
  set isCustListShown(bool value) {
    _isCustListShown = value;
  }

  String _setCustName = '';
  String get setCustName => _setCustName;
  set setCustName(String value) {
    _setCustName = value;
    prefs.setString('ff_setCustName', value);
  }

  DocumentReference? _setCustRef;
  DocumentReference? get setCustRef => _setCustRef;
  set setCustRef(DocumentReference? value) {
    _setCustRef = value;
    value != null
        ? prefs.setString('ff_setCustRef', value.path)
        : prefs.remove('ff_setCustRef');
  }

  double _totalQuantity = 0.0;
  double get totalQuantity => _totalQuantity;
  set totalQuantity(double value) {
    _totalQuantity = value;
    prefs.setDouble('ff_totalQuantity', value);
  }

  double _delCharges = 0.0;
  double get delCharges => _delCharges;
  set delCharges(double value) {
    _delCharges = value;
    prefs.setDouble('ff_delCharges', value);
  }

  bool _isProductListShow = true;
  bool get isProductListShow => _isProductListShow;
  set isProductListShow(bool value) {
    _isProductListShow = value;
  }

  String _setProdName = '';
  String get setProdName => _setProdName;
  set setProdName(String value) {
    _setProdName = value;
    prefs.setString('ff_setProdName', value);
  }

  DocumentReference? _setProdRef;
  DocumentReference? get setProdRef => _setProdRef;
  set setProdRef(DocumentReference? value) {
    _setProdRef = value;
    value != null
        ? prefs.setString('ff_setProdRef', value.path)
        : prefs.remove('ff_setProdRef');
  }

  List<dynamic> _allBillsList = [];
  List<dynamic> get allBillsList => _allBillsList;
  set allBillsList(List<dynamic> value) {
    _allBillsList = value;
    prefs.setStringList(
        'ff_allBillsList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToAllBillsList(dynamic value) {
    allBillsList.add(value);
    prefs.setStringList(
        'ff_allBillsList', _allBillsList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromAllBillsList(dynamic value) {
    allBillsList.remove(value);
    prefs.setStringList(
        'ff_allBillsList', _allBillsList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromAllBillsList(int index) {
    allBillsList.removeAt(index);
    prefs.setStringList(
        'ff_allBillsList', _allBillsList.map((x) => jsonEncode(x)).toList());
  }

  void updateAllBillsListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    allBillsList[index] = updateFn(_allBillsList[index]);
    prefs.setStringList(
        'ff_allBillsList', _allBillsList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInAllBillsList(int index, dynamic value) {
    allBillsList.insert(index, value);
    prefs.setStringList(
        'ff_allBillsList', _allBillsList.map((x) => jsonEncode(x)).toList());
  }

  int _holdBillCount = 0;
  int get holdBillCount => _holdBillCount;
  set holdBillCount(int value) {
    _holdBillCount = value;
    prefs.setInt('ff_holdBillCount', value);
  }

  int _codeLenght = 0;
  int get codeLenght => _codeLenght;
  set codeLenght(int value) {
    _codeLenght = value;
    prefs.setInt('ff_codeLenght', value);
  }

  List<int> _catUpdate = [0];
  List<int> get catUpdate => _catUpdate;
  set catUpdate(List<int> value) {
    _catUpdate = value;
    prefs.setStringList(
        'ff_catUpdate', value.map((x) => x.toString()).toList());
  }

  void addToCatUpdate(int value) {
    catUpdate.add(value);
    prefs.setStringList(
        'ff_catUpdate', _catUpdate.map((x) => x.toString()).toList());
  }

  void removeFromCatUpdate(int value) {
    catUpdate.remove(value);
    prefs.setStringList(
        'ff_catUpdate', _catUpdate.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCatUpdate(int index) {
    catUpdate.removeAt(index);
    prefs.setStringList(
        'ff_catUpdate', _catUpdate.map((x) => x.toString()).toList());
  }

  void updateCatUpdateAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    catUpdate[index] = updateFn(_catUpdate[index]);
    prefs.setStringList(
        'ff_catUpdate', _catUpdate.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCatUpdate(int index, int value) {
    catUpdate.insert(index, value);
    prefs.setStringList(
        'ff_catUpdate', _catUpdate.map((x) => x.toString()).toList());
  }

  int _selBill = 0;
  int get selBill => _selBill;
  set selBill(int value) {
    _selBill = value;
    prefs.setInt('ff_selBill', value);
  }

  DocumentReference? _catRef;
  DocumentReference? get catRef => _catRef;
  set catRef(DocumentReference? value) {
    _catRef = value;
  }

  String _color = '';
  String get color => _color;
  set color(String value) {
    _color = value;
  }

  bool _containerVisibility = false;
  bool get containerVisibility => _containerVisibility;
  set containerVisibility(bool value) {
    _containerVisibility = value;
  }

  bool _orderColor = true;
  bool get orderColor => _orderColor;
  set orderColor(bool value) {
    _orderColor = value;
    prefs.setBool('ff_orderColor', value);
  }

  bool _shiftDocExists = true;
  bool get shiftDocExists => _shiftDocExists;
  set shiftDocExists(bool value) {
    _shiftDocExists = value;
    prefs.setBool('ff_shiftDocExists', value);
  }

  DocumentReference? _shiftDocRef;
  DocumentReference? get shiftDocRef => _shiftDocRef;
  set shiftDocRef(DocumentReference? value) {
    _shiftDocRef = value;
    value != null
        ? prefs.setString('ff_shiftDocRef', value.path)
        : prefs.remove('ff_shiftDocRef');
  }

  bool _tableSetting = false;
  bool get tableSetting => _tableSetting;
  set tableSetting(bool value) {
    _tableSetting = value;
    prefs.setBool('ff_tableSetting', value);
  }

  bool _CustSetting = false;
  bool get CustSetting => _CustSetting;
  set CustSetting(bool value) {
    _CustSetting = value;
    prefs.setBool('ff_CustSetting', value);
  }

  bool _barcodeSet = false;
  bool get barcodeSet => _barcodeSet;
  set barcodeSet(bool value) {
    _barcodeSet = value;
    prefs.setBool('ff_barcodeSet', value);
  }

  bool _rfidSetting = false;
  bool get rfidSetting => _rfidSetting;
  set rfidSetting(bool value) {
    _rfidSetting = value;
    prefs.setBool('ff_rfidSetting', value);
  }

  bool _salesmanSet = false;
  bool get salesmanSet => _salesmanSet;
  set salesmanSet(bool value) {
    _salesmanSet = value;
    prefs.setBool('ff_salesmanSet', value);
  }

  List<dynamic> _checkAppSetting = [];
  List<dynamic> get checkAppSetting => _checkAppSetting;
  set checkAppSetting(List<dynamic> value) {
    _checkAppSetting = value;
    prefs.setStringList(
        'ff_checkAppSetting', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCheckAppSetting(dynamic value) {
    checkAppSetting.add(value);
    prefs.setStringList('ff_checkAppSetting',
        _checkAppSetting.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCheckAppSetting(dynamic value) {
    checkAppSetting.remove(value);
    prefs.setStringList('ff_checkAppSetting',
        _checkAppSetting.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCheckAppSetting(int index) {
    checkAppSetting.removeAt(index);
    prefs.setStringList('ff_checkAppSetting',
        _checkAppSetting.map((x) => jsonEncode(x)).toList());
  }

  void updateCheckAppSettingAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    checkAppSetting[index] = updateFn(_checkAppSetting[index]);
    prefs.setStringList('ff_checkAppSetting',
        _checkAppSetting.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCheckAppSetting(int index, dynamic value) {
    checkAppSetting.insert(index, value);
    prefs.setStringList('ff_checkAppSetting',
        _checkAppSetting.map((x) => jsonEncode(x)).toList());
  }

  bool _tableViewHideShow = false;
  bool get tableViewHideShow => _tableViewHideShow;
  set tableViewHideShow(bool value) {
    _tableViewHideShow = value;
    prefs.setBool('ff_tableViewHideShow', value);
  }

  int _noOfItems = 0;
  int get noOfItems => _noOfItems;
  set noOfItems(int value) {
    _noOfItems = value;
    prefs.setInt('ff_noOfItems', value);
  }

  bool _headerDocExists = true;
  bool get headerDocExists => _headerDocExists;
  set headerDocExists(bool value) {
    _headerDocExists = value;
    prefs.setBool('ff_headerDocExists', value);
  }

  DocumentReference? _headerDocRef;
  DocumentReference? get headerDocRef => _headerDocRef;
  set headerDocRef(DocumentReference? value) {
    _headerDocRef = value;
    value != null
        ? prefs.setString('ff_headerDocRef', value.path)
        : prefs.remove('ff_headerDocRef');
  }

  double _fsDisAmt = 0.0;
  double get fsDisAmt => _fsDisAmt;
  set fsDisAmt(double value) {
    _fsDisAmt = value;
    prefs.setDouble('ff_fsDisAmt', value);
  }

  double _fsDisPer = 0.0;
  double get fsDisPer => _fsDisPer;
  set fsDisPer(double value) {
    _fsDisPer = value;
    prefs.setDouble('ff_fsDisPer', value);
  }

  double _fsDelChrg = 0.0;
  double get fsDelChrg => _fsDelChrg;
  set fsDelChrg(double value) {
    _fsDelChrg = value;
    prefs.setDouble('ff_fsDelChrg', value);
  }

  double _fsTendCash = 0.0;
  double get fsTendCash => _fsTendCash;
  set fsTendCash(double value) {
    _fsTendCash = value;
    prefs.setDouble('ff_fsTendCash', value);
  }

  double _fsReturnCash = 0.0;
  double get fsReturnCash => _fsReturnCash;
  set fsReturnCash(double value) {
    _fsReturnCash = value;
    prefs.setDouble('ff_fsReturnCash', value);
  }

  double _fsTaxAMt = 0.0;
  double get fsTaxAMt => _fsTaxAMt;
  set fsTaxAMt(double value) {
    _fsTaxAMt = value;
    prefs.setDouble('ff_fsTaxAMt', value);
  }

  List<String> _AddCustList = [];
  List<String> get AddCustList => _AddCustList;
  set AddCustList(List<String> value) {
    _AddCustList = value;
    prefs.setStringList('ff_AddCustList', value);
  }

  void addToAddCustList(String value) {
    AddCustList.add(value);
    prefs.setStringList('ff_AddCustList', _AddCustList);
  }

  void removeFromAddCustList(String value) {
    AddCustList.remove(value);
    prefs.setStringList('ff_AddCustList', _AddCustList);
  }

  void removeAtIndexFromAddCustList(int index) {
    AddCustList.removeAt(index);
    prefs.setStringList('ff_AddCustList', _AddCustList);
  }

  void updateAddCustListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    AddCustList[index] = updateFn(_AddCustList[index]);
    prefs.setStringList('ff_AddCustList', _AddCustList);
  }

  void insertAtIndexInAddCustList(int index, String value) {
    AddCustList.insert(index, value);
    prefs.setStringList('ff_AddCustList', _AddCustList);
  }

  dynamic _printerDevice;
  dynamic get printerDevice => _printerDevice;
  set printerDevice(dynamic value) {
    _printerDevice = value;
    prefs.setString('ff_printerDevice', jsonEncode(value));
  }

  bool _isPrinterConnected = false;
  bool get isPrinterConnected => _isPrinterConnected;
  set isPrinterConnected(bool value) {
    _isPrinterConnected = value;
    prefs.setBool('ff_isPrinterConnected', value);
  }

  String _setCustMobNo = '';
  String get setCustMobNo => _setCustMobNo;
  set setCustMobNo(String value) {
    _setCustMobNo = value;
  }

  List<dynamic> _shiftRecord = [];
  List<dynamic> get shiftRecord => _shiftRecord;
  set shiftRecord(List<dynamic> value) {
    _shiftRecord = value;
  }

  void addToShiftRecord(dynamic value) {
    shiftRecord.add(value);
  }

  void removeFromShiftRecord(dynamic value) {
    shiftRecord.remove(value);
  }

  void removeAtIndexFromShiftRecord(int index) {
    shiftRecord.removeAt(index);
  }

  void updateShiftRecordAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    shiftRecord[index] = updateFn(_shiftRecord[index]);
  }

  void insertAtIndexInShiftRecord(int index, dynamic value) {
    shiftRecord.insert(index, value);
  }

  double _lastBill = 0.0;
  double get lastBill => _lastBill;
  set lastBill(double value) {
    _lastBill = value;
    prefs.setDouble('ff_lastBill', value);
  }

  String _printerName = '';
  String get printerName => _printerName;
  set printerName(String value) {
    _printerName = value;
    prefs.setString('ff_printerName', value);
  }

  bool _icon = false;
  bool get icon => _icon;
  set icon(bool value) {
    _icon = value;
    prefs.setBool('ff_icon', value);
  }

  DocumentReference? _premiseTableRef;
  DocumentReference? get premiseTableRef => _premiseTableRef;
  set premiseTableRef(DocumentReference? value) {
    _premiseTableRef = value;
  }

  String _filterDate = '';
  String get filterDate => _filterDate;
  set filterDate(String value) {
    _filterDate = value;
    prefs.setString('ff_filterDate', value);
  }

  DateTime? _filterSelectedDate;
  DateTime? get filterSelectedDate => _filterSelectedDate;
  set filterSelectedDate(DateTime? value) {
    _filterSelectedDate = value;
  }

  String _selectedPremise = '';
  String get selectedPremise => _selectedPremise;
  set selectedPremise(String value) {
    _selectedPremise = value;
    prefs.setString('ff_selectedPremise', value);
  }

  List<dynamic> _activeHoldBill = [];
  List<dynamic> get activeHoldBill => _activeHoldBill;
  set activeHoldBill(List<dynamic> value) {
    _activeHoldBill = value;
    prefs.setStringList(
        'ff_activeHoldBill', value.map((x) => jsonEncode(x)).toList());
  }

  void addToActiveHoldBill(dynamic value) {
    activeHoldBill.add(value);
    prefs.setStringList('ff_activeHoldBill',
        _activeHoldBill.map((x) => jsonEncode(x)).toList());
  }

  void removeFromActiveHoldBill(dynamic value) {
    activeHoldBill.remove(value);
    prefs.setStringList('ff_activeHoldBill',
        _activeHoldBill.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromActiveHoldBill(int index) {
    activeHoldBill.removeAt(index);
    prefs.setStringList('ff_activeHoldBill',
        _activeHoldBill.map((x) => jsonEncode(x)).toList());
  }

  void updateActiveHoldBillAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    activeHoldBill[index] = updateFn(_activeHoldBill[index]);
    prefs.setStringList('ff_activeHoldBill',
        _activeHoldBill.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInActiveHoldBill(int index, dynamic value) {
    activeHoldBill.insert(index, value);
    prefs.setStringList('ff_activeHoldBill',
        _activeHoldBill.map((x) => jsonEncode(x)).toList());
  }

  List<String> _BillColor = [];
  List<String> get BillColor => _BillColor;
  set BillColor(List<String> value) {
    _BillColor = value;
    prefs.setStringList('ff_BillColor', value);
  }

  void addToBillColor(String value) {
    BillColor.add(value);
    prefs.setStringList('ff_BillColor', _BillColor);
  }

  void removeFromBillColor(String value) {
    BillColor.remove(value);
    prefs.setStringList('ff_BillColor', _BillColor);
  }

  void removeAtIndexFromBillColor(int index) {
    BillColor.removeAt(index);
    prefs.setStringList('ff_BillColor', _BillColor);
  }

  void updateBillColorAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    BillColor[index] = updateFn(_BillColor[index]);
    prefs.setStringList('ff_BillColor', _BillColor);
  }

  void insertAtIndexInBillColor(int index, String value) {
    BillColor.insert(index, value);
    prefs.setStringList('ff_BillColor', _BillColor);
  }

  List<dynamic> _todaysTotal = [];
  List<dynamic> get todaysTotal => _todaysTotal;
  set todaysTotal(List<dynamic> value) {
    _todaysTotal = value;
    prefs.setStringList(
        'ff_todaysTotal', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTodaysTotal(dynamic value) {
    todaysTotal.add(value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTodaysTotal(dynamic value) {
    todaysTotal.remove(value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTodaysTotal(int index) {
    todaysTotal.removeAt(index);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void updateTodaysTotalAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    todaysTotal[index] = updateFn(_todaysTotal[index]);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTodaysTotal(int index, dynamic value) {
    todaysTotal.insert(index, value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  dynamic _summaryJSON;
  dynamic get summaryJSON => _summaryJSON;
  set summaryJSON(dynamic value) {
    _summaryJSON = value;
    prefs.setString('ff_summaryJSON', jsonEncode(value));
  }

  String _filtervalue = '';
  String get filtervalue => _filtervalue;
  set filtervalue(String value) {
    _filtervalue = value;
    prefs.setString('ff_filtervalue', value);
  }

  String _preferredSearchDate = '/OUTLET/3RYjtQAjBGet6k8JhM7f/INVOICE';
  String get preferredSearchDate => _preferredSearchDate;
  set preferredSearchDate(String value) {
    _preferredSearchDate = value;
    prefs.setString('ff_preferredSearchDate', value);
  }

  String _preferredSearchDateEnd = '/OUTLET/3RYjtQAjBGet6k8JhM7f/INVOICE';
  String get preferredSearchDateEnd => _preferredSearchDateEnd;
  set preferredSearchDateEnd(String value) {
    _preferredSearchDateEnd = value;
    prefs.setString('ff_preferredSearchDateEnd', value);
  }

  double _OpeningBalance = 0.0;
  double get OpeningBalance => _OpeningBalance;
  set OpeningBalance(double value) {
    _OpeningBalance = value;
    prefs.setDouble('ff_OpeningBalance', value);
  }

  bool _textProduct = false;
  bool get textProduct => _textProduct;
  set textProduct(bool value) {
    _textProduct = value;
    prefs.setBool('ff_textProduct', value);
  }

  DateTime? _startDate = DateTime.fromMillisecondsSinceEpoch(1664562600000);
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  int _selectStartDate = 0;
  int get selectStartDate => _selectStartDate;
  set selectStartDate(int value) {
    _selectStartDate = value;
    prefs.setInt('ff_selectStartDate', value);
  }

  int _selectEndDate = 0;
  int get selectEndDate => _selectEndDate;
  set selectEndDate(int value) {
    _selectEndDate = value;
    prefs.setInt('ff_selectEndDate', value);
  }

  DateTime? _endDate = DateTime.fromMillisecondsSinceEpoch(1667154600000);
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
  }

  bool _dropDown = false;
  bool get dropDown => _dropDown;
  set dropDown(bool value) {
    _dropDown = value;
  }

  double _floatingKeypadValue = 0.0;
  double get floatingKeypadValue => _floatingKeypadValue;
  set floatingKeypadValue(double value) {
    _floatingKeypadValue = value;
  }

  bool _flotKeypadHideShow = false;
  bool get flotKeypadHideShow => _flotKeypadHideShow;
  set flotKeypadHideShow(bool value) {
    _flotKeypadHideShow = value;
    prefs.setBool('ff_flotKeypadHideShow', value);
  }

  bool _saveBtn = false;
  bool get saveBtn => _saveBtn;
  set saveBtn(bool value) {
    _saveBtn = value;
  }

  String _prodListStyle = 'STANDARD';
  String get prodListStyle => _prodListStyle;
  set prodListStyle(String value) {
    _prodListStyle = value;
    prefs.setString('ff_prodListStyle', value);
  }

  bool _custDetails = false;
  bool get custDetails => _custDetails;
  set custDetails(bool value) {
    _custDetails = value;
    prefs.setBool('ff_custDetails', value);
  }

  String _defPayMode = 'CASH';
  String get defPayMode => _defPayMode;
  set defPayMode(String value) {
    _defPayMode = value;
    prefs.setString('ff_defPayMode', value);
  }

  String _testColor = '#FF7171';
  String get testColor => _testColor;
  set testColor(String value) {
    _testColor = value;
  }

  String _testColorHideShow = '';
  String get testColorHideShow => _testColorHideShow;
  set testColorHideShow(String value) {
    _testColorHideShow = value;
  }

  String _trimString = '';
  String get trimString => _trimString;
  set trimString(String value) {
    _trimString = value;
  }

  String _selectedMenu = '';
  String get selectedMenu => _selectedMenu;
  set selectedMenu(String value) {
    _selectedMenu = value;
  }

  List<String> _homeMenu = [];
  List<String> get homeMenu => _homeMenu;
  set homeMenu(List<String> value) {
    _homeMenu = value;
  }

  void addToHomeMenu(String value) {
    homeMenu.add(value);
  }

  void removeFromHomeMenu(String value) {
    homeMenu.remove(value);
  }

  void removeAtIndexFromHomeMenu(int index) {
    homeMenu.removeAt(index);
  }

  void updateHomeMenuAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    homeMenu[index] = updateFn(_homeMenu[index]);
  }

  void insertAtIndexInHomeMenu(int index, String value) {
    homeMenu.insert(index, value);
  }

  List<String> _profileMenu = [];
  List<String> get profileMenu => _profileMenu;
  set profileMenu(List<String> value) {
    _profileMenu = value;
  }

  void addToProfileMenu(String value) {
    profileMenu.add(value);
  }

  void removeFromProfileMenu(String value) {
    profileMenu.remove(value);
  }

  void removeAtIndexFromProfileMenu(int index) {
    profileMenu.removeAt(index);
  }

  void updateProfileMenuAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    profileMenu[index] = updateFn(_profileMenu[index]);
  }

  void insertAtIndexInProfileMenu(int index, String value) {
    profileMenu.insert(index, value);
  }

  double _calDisAmt = 0.0;
  double get calDisAmt => _calDisAmt;
  set calDisAmt(double value) {
    _calDisAmt = value;
  }

  double _calDisPer = 0.0;
  double get calDisPer => _calDisPer;
  set calDisPer(double value) {
    _calDisPer = value;
  }

  double _returnAmt = 0.0;
  double get returnAmt => _returnAmt;
  set returnAmt(double value) {
    _returnAmt = value;
  }

  bool _tenderRowPLScreen = false;
  bool get tenderRowPLScreen => _tenderRowPLScreen;
  set tenderRowPLScreen(bool value) {
    _tenderRowPLScreen = value;
  }

  String _outletName = '';
  String get outletName => _outletName;
  set outletName(String value) {
    _outletName = value;
    prefs.setString('ff_outletName', value);
  }

  DocumentReference? _purchaseStatus;
  DocumentReference? get purchaseStatus => _purchaseStatus;
  set purchaseStatus(DocumentReference? value) {
    _purchaseStatus = value;
    value != null
        ? prefs.setString('ff_purchaseStatus', value.path)
        : prefs.remove('ff_purchaseStatus');
  }

  String _setCategoryColor = '';
  String get setCategoryColor => _setCategoryColor;
  set setCategoryColor(String value) {
    _setCategoryColor = value;
    prefs.setString('ff_setCategoryColor', value);
  }

  dynamic _setHoldListColor;
  dynamic get setHoldListColor => _setHoldListColor;
  set setHoldListColor(dynamic value) {
    _setHoldListColor = value;
    prefs.setString('ff_setHoldListColor', jsonEncode(value));
  }

  String _categoryColor = '';
  String get categoryColor => _categoryColor;
  set categoryColor(String value) {
    _categoryColor = value;
    prefs.setString('ff_categoryColor', value);
  }

  dynamic _holdListColor;
  dynamic get holdListColor => _holdListColor;
  set holdListColor(dynamic value) {
    _holdListColor = value;
  }

  String _editBillListColor = '';
  String get editBillListColor => _editBillListColor;
  set editBillListColor(String value) {
    _editBillListColor = value;
  }

  Color _allBtnColor = Colors.transparent;
  Color get allBtnColor => _allBtnColor;
  set allBtnColor(Color value) {
    _allBtnColor = value;
    prefs.setInt('ff_allBtnColor', value.value);
  }

  String _custId = '';
  String get custId => _custId;
  set custId(String value) {
    _custId = value;
    prefs.setString('ff_custId', value);
  }

  List<dynamic> _selectedPurchaceProdJson = [jsonDecode('{}')];
  List<dynamic> get selectedPurchaceProdJson => _selectedPurchaceProdJson;
  set selectedPurchaceProdJson(List<dynamic> value) {
    _selectedPurchaceProdJson = value;
    prefs.setStringList('ff_selectedPurchaceProdJson',
        value.map((x) => jsonEncode(x)).toList());
  }

  void addToSelectedPurchaceProdJson(dynamic value) {
    selectedPurchaceProdJson.add(value);
    prefs.setStringList('ff_selectedPurchaceProdJson',
        _selectedPurchaceProdJson.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSelectedPurchaceProdJson(dynamic value) {
    selectedPurchaceProdJson.remove(value);
    prefs.setStringList('ff_selectedPurchaceProdJson',
        _selectedPurchaceProdJson.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSelectedPurchaceProdJson(int index) {
    selectedPurchaceProdJson.removeAt(index);
    prefs.setStringList('ff_selectedPurchaceProdJson',
        _selectedPurchaceProdJson.map((x) => jsonEncode(x)).toList());
  }

  void updateSelectedPurchaceProdJsonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    selectedPurchaceProdJson[index] =
        updateFn(_selectedPurchaceProdJson[index]);
    prefs.setStringList('ff_selectedPurchaceProdJson',
        _selectedPurchaceProdJson.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSelectedPurchaceProdJson(int index, dynamic value) {
    selectedPurchaceProdJson.insert(index, value);
    prefs.setStringList('ff_selectedPurchaceProdJson',
        _selectedPurchaceProdJson.map((x) => jsonEncode(x)).toList());
  }

  bool _checkinternetConnection = false;
  bool get checkinternetConnection => _checkinternetConnection;
  set checkinternetConnection(bool value) {
    _checkinternetConnection = value;
  }

  Color _catAllColor = Color(4292855973);
  Color get catAllColor => _catAllColor;
  set catAllColor(Color value) {
    _catAllColor = value;
    prefs.setInt('ff_catAllColor', value.value);
  }

  String _productColor = '';
  String get productColor => _productColor;
  set productColor(String value) {
    _productColor = value;
    prefs.setString('ff_productColor', value);
  }

  dynamic _shiftDetailsJson;
  dynamic get shiftDetailsJson => _shiftDetailsJson;
  set shiftDetailsJson(dynamic value) {
    _shiftDetailsJson = value;
    prefs.setString('ff_shiftDetailsJson', jsonEncode(value));
  }

  List<dynamic> _selectedPrinterDevice = [];
  List<dynamic> get selectedPrinterDevice => _selectedPrinterDevice;
  set selectedPrinterDevice(List<dynamic> value) {
    _selectedPrinterDevice = value;
    prefs.setStringList(
        'ff_selectedPrinterDevice', value.map((x) => jsonEncode(x)).toList());
  }

  void addToSelectedPrinterDevice(dynamic value) {
    selectedPrinterDevice.add(value);
    prefs.setStringList('ff_selectedPrinterDevice',
        _selectedPrinterDevice.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSelectedPrinterDevice(dynamic value) {
    selectedPrinterDevice.remove(value);
    prefs.setStringList('ff_selectedPrinterDevice',
        _selectedPrinterDevice.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSelectedPrinterDevice(int index) {
    selectedPrinterDevice.removeAt(index);
    prefs.setStringList('ff_selectedPrinterDevice',
        _selectedPrinterDevice.map((x) => jsonEncode(x)).toList());
  }

  void updateSelectedPrinterDeviceAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    selectedPrinterDevice[index] = updateFn(_selectedPrinterDevice[index]);
    prefs.setStringList('ff_selectedPrinterDevice',
        _selectedPrinterDevice.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSelectedPrinterDevice(int index, dynamic value) {
    selectedPrinterDevice.insert(index, value);
    prefs.setStringList('ff_selectedPrinterDevice',
        _selectedPrinterDevice.map((x) => jsonEncode(x)).toList());
  }

  dynamic _pairedDevice;
  dynamic get pairedDevice => _pairedDevice;
  set pairedDevice(dynamic value) {
    _pairedDevice = value;
    prefs.setString('ff_pairedDevice', jsonEncode(value));
  }

  String _printerIndex = '';
  String get printerIndex => _printerIndex;
  set printerIndex(String value) {
    _printerIndex = value;
    prefs.setString('ff_printerIndex', value);
  }

  bool _showBillReportList = false;
  bool get showBillReportList => _showBillReportList;
  set showBillReportList(bool value) {
    _showBillReportList = value;
    prefs.setBool('ff_showBillReportList', value);
  }

  DocumentReference? _invoiceRef;
  DocumentReference? get invoiceRef => _invoiceRef;
  set invoiceRef(DocumentReference? value) {
    _invoiceRef = value;
    value != null
        ? prefs.setString('ff_invoiceRef', value.path)
        : prefs.remove('ff_invoiceRef');
  }

  bool _fabButtonHide = false;
  bool get fabButtonHide => _fabButtonHide;
  set fabButtonHide(bool value) {
    _fabButtonHide = value;
  }

  String _testing = 'name';
  String get testing => _testing;
  set testing(String value) {
    _testing = value;
    prefs.setString('ff_testing', value);
  }

  String _curMode = '';
  String get curMode => _curMode;
  set curMode(String value) {
    _curMode = value;
  }

  String _prevMode = '';
  String get prevMode => _prevMode;
  set prevMode(String value) {
    _prevMode = value;
  }

  dynamic _updatedInvoiceJson;
  dynamic get updatedInvoiceJson => _updatedInvoiceJson;
  set updatedInvoiceJson(dynamic value) {
    _updatedInvoiceJson = value;
  }

  String _billPrintHeader = '';
  String get billPrintHeader => _billPrintHeader;
  set billPrintHeader(String value) {
    _billPrintHeader = value;
    prefs.setString('ff_billPrintHeader', value);
  }

  String _billPrintFooter = '';
  String get billPrintFooter => _billPrintFooter;
  set billPrintFooter(String value) {
    _billPrintFooter = value;
    prefs.setString('ff_billPrintFooter', value);
  }

  bool _hideHeaderFooter = false;
  bool get hideHeaderFooter => _hideHeaderFooter;
  set hideHeaderFooter(bool value) {
    _hideHeaderFooter = value;
    prefs.setBool('ff_hideHeaderFooter', value);
  }

  List<dynamic> _resultList = [];
  List<dynamic> get resultList => _resultList;
  set resultList(List<dynamic> value) {
    _resultList = value;
    prefs.setStringList(
        'ff_resultList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToResultList(dynamic value) {
    resultList.add(value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromResultList(dynamic value) {
    resultList.remove(value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromResultList(int index) {
    resultList.removeAt(index);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void updateResultListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    resultList[index] = updateFn(_resultList[index]);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInResultList(int index, dynamic value) {
    resultList.insert(index, value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _apiProdutcs = [];
  List<dynamic> get apiProdutcs => _apiProdutcs;
  set apiProdutcs(List<dynamic> value) {
    _apiProdutcs = value;
  }

  void addToApiProdutcs(dynamic value) {
    apiProdutcs.add(value);
  }

  void removeFromApiProdutcs(dynamic value) {
    apiProdutcs.remove(value);
  }

  void removeAtIndexFromApiProdutcs(int index) {
    apiProdutcs.removeAt(index);
  }

  void updateApiProdutcsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    apiProdutcs[index] = updateFn(_apiProdutcs[index]);
  }

  void insertAtIndexInApiProdutcs(int index, dynamic value) {
    apiProdutcs.insert(index, value);
  }

  String _digitalStatus = 'New';
  String get digitalStatus => _digitalStatus;
  set digitalStatus(String value) {
    _digitalStatus = value;
  }

  bool _hide = false;
  bool get hide => _hide;
  set hide(bool value) {
    _hide = value;
    prefs.setBool('ff_hide', value);
  }

  String _targetPlatform = '';
  String get targetPlatform => _targetPlatform;
  set targetPlatform(String value) {
    _targetPlatform = value;
    prefs.setString('ff_targetPlatform', value);
  }

  List<String> _emptyOptions = ['Users not available'];
  List<String> get emptyOptions => _emptyOptions;
  set emptyOptions(List<String> value) {
    _emptyOptions = value;
  }

  void addToEmptyOptions(String value) {
    emptyOptions.add(value);
  }

  void removeFromEmptyOptions(String value) {
    emptyOptions.remove(value);
  }

  void removeAtIndexFromEmptyOptions(int index) {
    emptyOptions.removeAt(index);
  }

  void updateEmptyOptionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    emptyOptions[index] = updateFn(_emptyOptions[index]);
  }

  void insertAtIndexInEmptyOptions(int index, String value) {
    emptyOptions.insert(index, value);
  }

  String _choseCatId = '';
  String get choseCatId => _choseCatId;
  set choseCatId(String value) {
    _choseCatId = value;
  }

  List<dynamic> _testingHiveJson = [];
  List<dynamic> get testingHiveJson => _testingHiveJson;
  set testingHiveJson(List<dynamic> value) {
    _testingHiveJson = value;
  }

  void addToTestingHiveJson(dynamic value) {
    testingHiveJson.add(value);
  }

  void removeFromTestingHiveJson(dynamic value) {
    testingHiveJson.remove(value);
  }

  void removeAtIndexFromTestingHiveJson(int index) {
    testingHiveJson.removeAt(index);
  }

  void updateTestingHiveJsonAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    testingHiveJson[index] = updateFn(_testingHiveJson[index]);
  }

  void insertAtIndexInTestingHiveJson(int index, dynamic value) {
    testingHiveJson.insert(index, value);
  }

  String _categoryID = '';
  String get categoryID => _categoryID;
  set categoryID(String value) {
    _categoryID = value;
  }

  dynamic _shiftDetailsNEw;
  dynamic get shiftDetailsNEw => _shiftDetailsNEw;
  set shiftDetailsNEw(dynamic value) {
    _shiftDetailsNEw = value;
  }

  List<CategoryStructStruct> _categoryHive = [];
  List<CategoryStructStruct> get categoryHive => _categoryHive;
  set categoryHive(List<CategoryStructStruct> value) {
    _categoryHive = value;
  }

  void addToCategoryHive(CategoryStructStruct value) {
    categoryHive.add(value);
  }

  void removeFromCategoryHive(CategoryStructStruct value) {
    categoryHive.remove(value);
  }

  void removeAtIndexFromCategoryHive(int index) {
    categoryHive.removeAt(index);
  }

  void updateCategoryHiveAtIndex(
    int index,
    CategoryStructStruct Function(CategoryStructStruct) updateFn,
  ) {
    categoryHive[index] = updateFn(_categoryHive[index]);
  }

  void insertAtIndexInCategoryHive(int index, CategoryStructStruct value) {
    categoryHive.insert(index, value);
  }

  List<ProductStructStruct> _productHive = [];
  List<ProductStructStruct> get productHive => _productHive;
  set productHive(List<ProductStructStruct> value) {
    _productHive = value;
  }

  void addToProductHive(ProductStructStruct value) {
    productHive.add(value);
  }

  void removeFromProductHive(ProductStructStruct value) {
    productHive.remove(value);
  }

  void removeAtIndexFromProductHive(int index) {
    productHive.removeAt(index);
  }

  void updateProductHiveAtIndex(
    int index,
    ProductStructStruct Function(ProductStructStruct) updateFn,
  ) {
    productHive[index] = updateFn(_productHive[index]);
  }

  void insertAtIndexInProductHive(int index, ProductStructStruct value) {
    productHive.insert(index, value);
  }

  String _productHiveid = '';
  String get productHiveid => _productHiveid;
  set productHiveid(String value) {
    _productHiveid = value;
  }

  ProductStructStruct _productHiveput = ProductStructStruct();
  ProductStructStruct get productHiveput => _productHiveput;
  set productHiveput(ProductStructStruct value) {
    _productHiveput = value;
  }

  void updateProductHiveputStruct(Function(ProductStructStruct) updateFn) {
    updateFn(_productHiveput);
  }

  int _startLoop = 0;
  int get startLoop => _startLoop;
  set startLoop(int value) {
    _startLoop = value;
  }

  int _endLoop = 0;
  int get endLoop => _endLoop;
  set endLoop(int value) {
    _endLoop = value;
  }

  List<InvoiceStructStruct> _invoiceList = [];
  List<InvoiceStructStruct> get invoiceList => _invoiceList;
  set invoiceList(List<InvoiceStructStruct> value) {
    _invoiceList = value;
  }

  void addToInvoiceList(InvoiceStructStruct value) {
    invoiceList.add(value);
  }

  void removeFromInvoiceList(InvoiceStructStruct value) {
    invoiceList.remove(value);
  }

  void removeAtIndexFromInvoiceList(int index) {
    invoiceList.removeAt(index);
  }

  void updateInvoiceListAtIndex(
    int index,
    InvoiceStructStruct Function(InvoiceStructStruct) updateFn,
  ) {
    invoiceList[index] = updateFn(_invoiceList[index]);
  }

  void insertAtIndexInInvoiceList(int index, InvoiceStructStruct value) {
    invoiceList.insert(index, value);
  }

  int _productStructVersion = 1;
  int get productStructVersion => _productStructVersion;
  set productStructVersion(int value) {
    _productStructVersion = value;
  }

  int _catagoryStructVersion = 1;
  int get catagoryStructVersion => _catagoryStructVersion;
  set catagoryStructVersion(int value) {
    _catagoryStructVersion = value;
  }

  int _invoiceStructVersion = 1;
  int get invoiceStructVersion => _invoiceStructVersion;
  set invoiceStructVersion(int value) {
    _invoiceStructVersion = value;
  }

  ShiftDetailsStruct _shiftDetails = ShiftDetailsStruct();
  ShiftDetailsStruct get shiftDetails => _shiftDetails;
  set shiftDetails(ShiftDetailsStruct value) {
    _shiftDetails = value;
  }

  void updateShiftDetailsStruct(Function(ShiftDetailsStruct) updateFn) {
    updateFn(_shiftDetails);
  }

  List<ShiftDetailsStruct> _shiftDetailslisthive = [];
  List<ShiftDetailsStruct> get shiftDetailslisthive => _shiftDetailslisthive;
  set shiftDetailslisthive(List<ShiftDetailsStruct> value) {
    _shiftDetailslisthive = value;
  }

  void addToShiftDetailslisthive(ShiftDetailsStruct value) {
    shiftDetailslisthive.add(value);
  }

  void removeFromShiftDetailslisthive(ShiftDetailsStruct value) {
    shiftDetailslisthive.remove(value);
  }

  void removeAtIndexFromShiftDetailslisthive(int index) {
    shiftDetailslisthive.removeAt(index);
  }

  void updateShiftDetailslisthiveAtIndex(
    int index,
    ShiftDetailsStruct Function(ShiftDetailsStruct) updateFn,
  ) {
    shiftDetailslisthive[index] = updateFn(_shiftDetailslisthive[index]);
  }

  void insertAtIndexInShiftDetailslisthive(
      int index, ShiftDetailsStruct value) {
    shiftDetailslisthive.insert(index, value);
  }

  int _shiftStructVersion = 1;
  int get shiftStructVersion => _shiftStructVersion;
  set shiftStructVersion(int value) {
    _shiftStructVersion = value;
  }

  dynamic _shiftdetails;
  dynamic get shiftdetails => _shiftdetails;
  set shiftdetails(dynamic value) {
    _shiftdetails = value;
  }

  DocumentReference? _userdoc;
  DocumentReference? get userdoc => _userdoc;
  set userdoc(DocumentReference? value) {
    _userdoc = value;
  }

  DocumentReference? _bilinvref;
  DocumentReference? get bilinvref => _bilinvref;
  set bilinvref(DocumentReference? value) {
    _bilinvref = value;
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
  }

  InvoiceStructStruct _invoiceStruct = InvoiceStructStruct();
  InvoiceStructStruct get invoiceStruct => _invoiceStruct;
  set invoiceStruct(InvoiceStructStruct value) {
    _invoiceStruct = value;
  }

  void updateInvoiceStructStruct(Function(InvoiceStructStruct) updateFn) {
    updateFn(_invoiceStruct);
  }

  double _taxamt = 0.0;
  double get taxamt => _taxamt;
  set taxamt(double value) {
    _taxamt = value;
  }

  bool _barcodeSetting = false;
  bool get barcodeSetting => _barcodeSetting;
  set barcodeSetting(bool value) {
    _barcodeSetting = value;
    prefs.setBool('ff_barcodeSetting', value);
  }

  double _qty = 0.0;
  double get qty => _qty;
  set qty(double value) {
    _qty = value;
  }

  List<dynamic> _prdJsonList = [];
  List<dynamic> get prdJsonList => _prdJsonList;
  set prdJsonList(List<dynamic> value) {
    _prdJsonList = value;
  }

  void addToPrdJsonList(dynamic value) {
    prdJsonList.add(value);
  }

  void removeFromPrdJsonList(dynamic value) {
    prdJsonList.remove(value);
  }

  void removeAtIndexFromPrdJsonList(int index) {
    prdJsonList.removeAt(index);
  }

  void updatePrdJsonListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    prdJsonList[index] = updateFn(_prdJsonList[index]);
  }

  void insertAtIndexInPrdJsonList(int index, dynamic value) {
    prdJsonList.insert(index, value);
  }

  String _htmlview = '';
  String get htmlview => _htmlview;
  set htmlview(String value) {
    _htmlview = value;
  }

  DocumentReference? _compRef =
      FirebaseFirestore.instance.doc('/COMPANY_DETAILS/aM3jgmben7TH7V9QKNqa');
  DocumentReference? get compRef => _compRef;
  set compRef(DocumentReference? value) {
    _compRef = value;
  }

  List<DocumentReference> _cartItem = [];
  List<DocumentReference> get cartItem => _cartItem;
  set cartItem(List<DocumentReference> value) {
    _cartItem = value;
  }

  void addToCartItem(DocumentReference value) {
    cartItem.add(value);
  }

  void removeFromCartItem(DocumentReference value) {
    cartItem.remove(value);
  }

  void removeAtIndexFromCartItem(int index) {
    cartItem.removeAt(index);
  }

  void updateCartItemAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    cartItem[index] = updateFn(_cartItem[index]);
  }

  void insertAtIndexInCartItem(int index, DocumentReference value) {
    cartItem.insert(index, value);
  }

  String _currentMobileString = '';
  String get currentMobileString => _currentMobileString;
  set currentMobileString(String value) {
    _currentMobileString = value;
    prefs.setString('ff_currentMobileString', value);
  }

  String _currentMobile = '';
  String get currentMobile => _currentMobile;
  set currentMobile(String value) {
    _currentMobile = value;
  }

  DocumentReference? _bmDocRef;
  DocumentReference? get bmDocRef => _bmDocRef;
  set bmDocRef(DocumentReference? value) {
    _bmDocRef = value;
    value != null
        ? prefs.setString('ff_bmDocRef', value.path)
        : prefs.remove('ff_bmDocRef');
  }

  String _setBmcolor = '';
  String get setBmcolor => _setBmcolor;
  set setBmcolor(String value) {
    _setBmcolor = value;
    prefs.setString('ff_setBmcolor', value);
  }

  String _bmDocId = '';
  String get bmDocId => _bmDocId;
  set bmDocId(String value) {
    _bmDocId = value;
    prefs.setString('ff_bmDocId', value);
  }

  String _shiftDate = '';
  String get shiftDate => _shiftDate;
  set shiftDate(String value) {
    _shiftDate = value;
    prefs.setString('ff_shiftDate', value);
  }

  String _deviceqrId = '';
  String get deviceqrId => _deviceqrId;
  set deviceqrId(String value) {
    _deviceqrId = value;
    prefs.setString('ff_deviceqrId', value);
  }

  double _screenSize = 0.0;
  double get screenSize => _screenSize;
  set screenSize(double value) {
    _screenSize = value;
    prefs.setDouble('ff_screenSize', value);
  }

  bool _isButtonselected = false;
  bool get isButtonselected => _isButtonselected;
  set isButtonselected(bool value) {
    _isButtonselected = value;
    prefs.setBool('ff_isButtonselected', value);
  }

  String _barcode = '';
  String get barcode => _barcode;
  set barcode(String value) {
    _barcode = value;
  }

  int _catCodelength = 0;
  int get catCodelength => _catCodelength;
  set catCodelength(int value) {
    _catCodelength = value;
    prefs.setInt('ff_catCodelength', value);
  }

  List<int> _codeUpdate = [];
  List<int> get codeUpdate => _codeUpdate;
  set codeUpdate(List<int> value) {
    _codeUpdate = value;
    prefs.setStringList(
        'ff_codeUpdate', value.map((x) => x.toString()).toList());
  }

  void addToCodeUpdate(int value) {
    codeUpdate.add(value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void removeFromCodeUpdate(int value) {
    codeUpdate.remove(value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCodeUpdate(int index) {
    codeUpdate.removeAt(index);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void updateCodeUpdateAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    codeUpdate[index] = updateFn(_codeUpdate[index]);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCodeUpdate(int index, int value) {
    codeUpdate.insert(index, value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  String _setCategoryMasterName = '';
  String get setCategoryMasterName => _setCategoryMasterName;
  set setCategoryMasterName(String value) {
    _setCategoryMasterName = value;
    prefs.setString('ff_setCategoryMasterName', value);
  }

  bool _isFullistShown = false;
  bool get isFullistShown => _isFullistShown;
  set isFullistShown(bool value) {
    _isFullistShown = value;
    prefs.setBool('ff_isFullistShown', value);
  }

  int _accessPo = 0;
  int get accessPo => _accessPo;
  set accessPo(int value) {
    _accessPo = value;
  }

  int _accessSo = 0;
  int get accessSo => _accessSo;
  set accessSo(int value) {
    _accessSo = value;
  }

  int _accesslogs = 0;
  int get accesslogs => _accesslogs;
  set accesslogs(int value) {
    _accesslogs = value;
  }

  int _accessStock = 0;
  int get accessStock => _accessStock;
  set accessStock(int value) {
    _accessStock = value;
  }

  int _accessLeads = 0;
  int get accessLeads => _accessLeads;
  set accessLeads(int value) {
    _accessLeads = value;
  }

  int _accessExpence = 0;
  int get accessExpence => _accessExpence;
  set accessExpence(int value) {
    _accessExpence = value;
  }

  bool _accessContainer = false;
  bool get accessContainer => _accessContainer;
  set accessContainer(bool value) {
    _accessContainer = value;
    prefs.setBool('ff_accessContainer', value);
  }

  int _accessAttendance = 4;
  int get accessAttendance => _accessAttendance;
  set accessAttendance(int value) {
    _accessAttendance = value;
  }

  int _accessProduction = 0;
  int get accessProduction => _accessProduction;
  set accessProduction(int value) {
    _accessProduction = value;
  }

  int _accessServiceCall = 0;
  int get accessServiceCall => _accessServiceCall;
  set accessServiceCall(int value) {
    _accessServiceCall = value;
  }

  int _accessSuperAdminLeads = 0;
  int get accessSuperAdminLeads => _accessSuperAdminLeads;
  set accessSuperAdminLeads(int value) {
    _accessSuperAdminLeads = value;
  }

  DocumentReference? _catRefMaster =
      FirebaseFirestore.instance.doc('/CATEGORY_MASTER/DYJSXKUlDRAyUD9DJIhC');
  DocumentReference? get catRefMaster => _catRefMaster;
  set catRefMaster(DocumentReference? value) {
    _catRefMaster = value;
  }

  double _parkingCharges = 0.0;
  double get parkingCharges => _parkingCharges;
  set parkingCharges(double value) {
    _parkingCharges = value;
    prefs.setDouble('ff_parkingCharges', value);
  }

  List<SelItemListStruct> _listCars = [];
  List<SelItemListStruct> get listCars => _listCars;
  set listCars(List<SelItemListStruct> value) {
    _listCars = value;
  }

  void addToListCars(SelItemListStruct value) {
    listCars.add(value);
  }

  void removeFromListCars(SelItemListStruct value) {
    listCars.remove(value);
  }

  void removeAtIndexFromListCars(int index) {
    listCars.removeAt(index);
  }

  void updateListCarsAtIndex(
    int index,
    SelItemListStruct Function(SelItemListStruct) updateFn,
  ) {
    listCars[index] = updateFn(_listCars[index]);
  }

  void insertAtIndexInListCars(int index, SelItemListStruct value) {
    listCars.insert(index, value);
  }

  int _colorab = 1;
  int get colorab => _colorab;
  set colorab(int value) {
    _colorab = value;
  }

  bool _addflag = false;
  bool get addflag => _addflag;
  set addflag(bool value) {
    _addflag = value;
  }

  List<int> _bytes = [];
  List<int> get bytes => _bytes;
  set bytes(List<int> value) {
    _bytes = value;
  }

  void addToBytes(int value) {
    bytes.add(value);
  }

  void removeFromBytes(int value) {
    bytes.remove(value);
  }

  void removeAtIndexFromBytes(int index) {
    bytes.removeAt(index);
  }

  void updateBytesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    bytes[index] = updateFn(_bytes[index]);
  }

  void insertAtIndexInBytes(int index, int value) {
    bytes.insert(index, value);
  }

  int _orderId = 0;
  int get orderId => _orderId;
  set orderId(int value) {
    _orderId = value;
    prefs.setInt('ff_orderId', value);
  }

  String _paytmOrderId = '';
  String get paytmOrderId => _paytmOrderId;
  set paytmOrderId(String value) {
    _paytmOrderId = value;
  }

  bool _isBillPrinted = false;
  bool get isBillPrinted => _isBillPrinted;
  set isBillPrinted(bool value) {
    _isBillPrinted = value;
  }

  String _orderType = '';
  String get orderType => _orderType;
  set orderType(String value) {
    _orderType = value;
  }

  String _shiftexist = '';
  String get shiftexist => _shiftexist;
  set shiftexist(String value) {
    _shiftexist = value;
  }

  bool _ethernetPrint = false;
  bool get ethernetPrint => _ethernetPrint;
  set ethernetPrint(bool value) {
    _ethernetPrint = value;
    prefs.setBool('ff_ethernetPrint', value);
  }

  String _port = '';
  String get port => _port;
  set port(String value) {
    _port = value;
    prefs.setString('ff_port', value);
  }

  String _ipAddresss = '';
  String get ipAddresss => _ipAddresss;
  set ipAddresss(String value) {
    _ipAddresss = value;
    prefs.setString('ff_ipAddresss', value);
  }

  String _navigate = '';
  String get navigate => _navigate;
  set navigate(String value) {
    _navigate = value;
    prefs.setString('ff_navigate', value);
  }

  String _pin2 = '4';
  String get pin2 => _pin2;
  set pin2(String value) {
    _pin2 = value;
  }

  double _kioskAmt = 0.0;
  double get kioskAmt => _kioskAmt;
  set kioskAmt(double value) {
    _kioskAmt = value;
  }

  String _version = '1.0.18';
  String get version => _version;
  set version(String value) {
    _version = value;
    prefs.setString('ff_version', value);
  }

  String _mid = '';
  String get mid => _mid;
  set mid(String value) {
    _mid = value;
    prefs.setString('ff_mid', value);
  }

  String _msg = '';
  String get msg => _msg;
  set msg(String value) {
    _msg = value;
  }

  int _billcount = 0;
  int get billcount => _billcount;
  set billcount(int value) {
    _billcount = value;
  }

  List<AppSettingsStruct> _appSettings = [];
  List<AppSettingsStruct> get appSettings => _appSettings;
  set appSettings(List<AppSettingsStruct> value) {
    _appSettings = value;
  }

  void addToAppSettings(AppSettingsStruct value) {
    appSettings.add(value);
  }

  void removeFromAppSettings(AppSettingsStruct value) {
    appSettings.remove(value);
  }

  void removeAtIndexFromAppSettings(int index) {
    appSettings.removeAt(index);
  }

  void updateAppSettingsAtIndex(
    int index,
    AppSettingsStruct Function(AppSettingsStruct) updateFn,
  ) {
    appSettings[index] = updateFn(_appSettings[index]);
  }

  void insertAtIndexInAppSettings(int index, AppSettingsStruct value) {
    appSettings.insert(index, value);
  }

  DateTime? _expTime;
  DateTime? get expTime => _expTime;
  set expTime(DateTime? value) {
    _expTime = value;
  }

  int _custCredit = 0;
  int get custCredit => _custCredit;
  set custCredit(int value) {
    _custCredit = value;
  }

  int _oldBalance = 0;
  int get oldBalance => _oldBalance;
  set oldBalance(int value) {
    _oldBalance = value;
  }

  int _tokenNo = 1;
  int get tokenNo => _tokenNo;
  set tokenNo(int value) {
    _tokenNo = value;
    prefs.setInt('ff_tokenNo', value);
  }

  bool _internet = false;
  bool get internet => _internet;
  set internet(bool value) {
    _internet = value;
    prefs.setBool('ff_internet', value);
  }

  bool _groceryshow = false;
  bool get groceryshow => _groceryshow;
  set groceryshow(bool value) {
    _groceryshow = value;
  }

  dynamic _groceryJson;
  dynamic get groceryJson => _groceryJson;
  set groceryJson(dynamic value) {
    _groceryJson = value;
  }

  double _disAmtPay = 0.0;
  double get disAmtPay => _disAmtPay;
  set disAmtPay(double value) {
    _disAmtPay = value;
    prefs.setDouble('ff_disAmtPay', value);
  }

  double _taxAmtPay = 0.0;
  double get taxAmtPay => _taxAmtPay;
  set taxAmtPay(double value) {
    _taxAmtPay = value;
    prefs.setDouble('ff_taxAmtPay', value);
  }

  List<dynamic> _months = [];
  List<dynamic> get months => _months;
  set months(List<dynamic> value) {
    _months = value;
  }

  void addToMonths(dynamic value) {
    months.add(value);
  }

  void removeFromMonths(dynamic value) {
    months.remove(value);
  }

  void removeAtIndexFromMonths(int index) {
    months.removeAt(index);
  }

  void updateMonthsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    months[index] = updateFn(_months[index]);
  }

  void insertAtIndexInMonths(int index, dynamic value) {
    months.insert(index, value);
  }

  String _emailId = '';
  String get emailId => _emailId;
  set emailId(String value) {
    _emailId = value;
  }

  String _prdid = '';
  String get prdid => _prdid;
  set prdid(String value) {
    _prdid = value;
  }

  String _paymode1 = '';
  String get paymode1 => _paymode1;
  set paymode1(String value) {
    _paymode1 = value;
  }

  String _paymode2 = '';
  String get paymode2 => _paymode2;
  set paymode2(String value) {
    _paymode2 = value;
  }

  List<PurchaseSaleItemListStruct> _orderDetails = [];
  List<PurchaseSaleItemListStruct> get orderDetails => _orderDetails;
  set orderDetails(List<PurchaseSaleItemListStruct> value) {
    _orderDetails = value;
  }

  void addToOrderDetails(PurchaseSaleItemListStruct value) {
    orderDetails.add(value);
  }

  void removeFromOrderDetails(PurchaseSaleItemListStruct value) {
    orderDetails.remove(value);
  }

  void removeAtIndexFromOrderDetails(int index) {
    orderDetails.removeAt(index);
  }

  void updateOrderDetailsAtIndex(
    int index,
    PurchaseSaleItemListStruct Function(PurchaseSaleItemListStruct) updateFn,
  ) {
    orderDetails[index] = updateFn(_orderDetails[index]);
  }

  void insertAtIndexInOrderDetails(
      int index, PurchaseSaleItemListStruct value) {
    orderDetails.insert(index, value);
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  bool _customer = false;
  bool get customer => _customer;
  set customer(bool value) {
    _customer = value;
  }

  String _customerMobileNoKiosk = '';
  String get customerMobileNoKiosk => _customerMobileNoKiosk;
  set customerMobileNoKiosk(String value) {
    _customerMobileNoKiosk = value;
  }

  String _laelsize = '';
  String get laelsize => _laelsize;
  set laelsize(String value) {
    _laelsize = value;
  }

  String _weight = '';
  String get weight => _weight;
  set weight(String value) {
    _weight = value;
  }

  int _newcount = 0;
  int get newcount => _newcount;
  set newcount(int value) {
    _newcount = value;
    prefs.setInt('ff_newcount', value);
  }

  int _countLaundryForContinuesIncrement = 0;
  int get countLaundryForContinuesIncrement =>
      _countLaundryForContinuesIncrement;
  set countLaundryForContinuesIncrement(int value) {
    _countLaundryForContinuesIncrement = value;
  }

  String _directory = 'C:\\\\Users\\\\Admin\\\\AppData\\\\Local\\\\firestore';
  String get directory => _directory;
  set directory(String value) {
    _directory = value;
    prefs.setString('ff_directory', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
