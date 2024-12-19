// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductStructStruct extends FFFirebaseStruct {
  ProductStructStruct({
    String? id,
    double? price,
    String? category,
    int? code,
    String? name,
    double? sellingPrice,
    double? mrpPrice,
    double? purchasePrice,
    String? categoryId,
    String? taxId,
    String? unitId,
    String? regionalName,
    String? barcode,
    int? hsncode,
    int? reorderLevel,
    int? searchcode,
    String? shortName,
    bool? weightable,
    bool? stockable,
    double? discountPer,
    double? discountAmt,
    String? productMasterId,
    String? recipeRefId,
    String? imageUrl,
    String? serviceOutletId,
    int? type,
    String? recipeId,
    int? stock,
    bool? isDeleted,
    List<String>? keywords,
    bool? synC,
    int? hivekey,
    int? version,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _price = price,
        _category = category,
        _code = code,
        _name = name,
        _sellingPrice = sellingPrice,
        _mrpPrice = mrpPrice,
        _purchasePrice = purchasePrice,
        _categoryId = categoryId,
        _taxId = taxId,
        _unitId = unitId,
        _regionalName = regionalName,
        _barcode = barcode,
        _hsncode = hsncode,
        _reorderLevel = reorderLevel,
        _searchcode = searchcode,
        _shortName = shortName,
        _weightable = weightable,
        _stockable = stockable,
        _discountPer = discountPer,
        _discountAmt = discountAmt,
        _productMasterId = productMasterId,
        _recipeRefId = recipeRefId,
        _imageUrl = imageUrl,
        _serviceOutletId = serviceOutletId,
        _type = type,
        _recipeId = recipeId,
        _stock = stock,
        _isDeleted = isDeleted,
        _keywords = keywords,
        _synC = synC,
        _hivekey = hivekey,
        _version = version,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "sellingPrice" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  set sellingPrice(double? val) => _sellingPrice = val;

  void incrementSellingPrice(double amount) =>
      sellingPrice = sellingPrice + amount;

  bool hasSellingPrice() => _sellingPrice != null;

  // "mrpPrice" field.
  double? _mrpPrice;
  double get mrpPrice => _mrpPrice ?? 0.0;
  set mrpPrice(double? val) => _mrpPrice = val;

  void incrementMrpPrice(double amount) => mrpPrice = mrpPrice + amount;

  bool hasMrpPrice() => _mrpPrice != null;

  // "purchasePrice" field.
  double? _purchasePrice;
  double get purchasePrice => _purchasePrice ?? 0.0;
  set purchasePrice(double? val) => _purchasePrice = val;

  void incrementPurchasePrice(double amount) =>
      purchasePrice = purchasePrice + amount;

  bool hasPurchasePrice() => _purchasePrice != null;

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  set categoryId(String? val) => _categoryId = val;

  bool hasCategoryId() => _categoryId != null;

  // "taxId" field.
  String? _taxId;
  String get taxId => _taxId ?? '';
  set taxId(String? val) => _taxId = val;

  bool hasTaxId() => _taxId != null;

  // "unitId" field.
  String? _unitId;
  String get unitId => _unitId ?? '';
  set unitId(String? val) => _unitId = val;

  bool hasUnitId() => _unitId != null;

  // "regionalName" field.
  String? _regionalName;
  String get regionalName => _regionalName ?? '';
  set regionalName(String? val) => _regionalName = val;

  bool hasRegionalName() => _regionalName != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;

  bool hasBarcode() => _barcode != null;

  // "hsncode" field.
  int? _hsncode;
  int get hsncode => _hsncode ?? 0;
  set hsncode(int? val) => _hsncode = val;

  void incrementHsncode(int amount) => hsncode = hsncode + amount;

  bool hasHsncode() => _hsncode != null;

  // "reorderLevel" field.
  int? _reorderLevel;
  int get reorderLevel => _reorderLevel ?? 0;
  set reorderLevel(int? val) => _reorderLevel = val;

  void incrementReorderLevel(int amount) =>
      reorderLevel = reorderLevel + amount;

  bool hasReorderLevel() => _reorderLevel != null;

  // "searchcode" field.
  int? _searchcode;
  int get searchcode => _searchcode ?? 0;
  set searchcode(int? val) => _searchcode = val;

  void incrementSearchcode(int amount) => searchcode = searchcode + amount;

  bool hasSearchcode() => _searchcode != null;

  // "shortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  set shortName(String? val) => _shortName = val;

  bool hasShortName() => _shortName != null;

  // "weightable" field.
  bool? _weightable;
  bool get weightable => _weightable ?? false;
  set weightable(bool? val) => _weightable = val;

  bool hasWeightable() => _weightable != null;

  // "stockable" field.
  bool? _stockable;
  bool get stockable => _stockable ?? false;
  set stockable(bool? val) => _stockable = val;

  bool hasStockable() => _stockable != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  set discountPer(double? val) => _discountPer = val;

  void incrementDiscountPer(double amount) =>
      discountPer = discountPer + amount;

  bool hasDiscountPer() => _discountPer != null;

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  set discountAmt(double? val) => _discountAmt = val;

  void incrementDiscountAmt(double amount) =>
      discountAmt = discountAmt + amount;

  bool hasDiscountAmt() => _discountAmt != null;

  // "productMasterId" field.
  String? _productMasterId;
  String get productMasterId => _productMasterId ?? '';
  set productMasterId(String? val) => _productMasterId = val;

  bool hasProductMasterId() => _productMasterId != null;

  // "recipeRefId" field.
  String? _recipeRefId;
  String get recipeRefId => _recipeRefId ?? '';
  set recipeRefId(String? val) => _recipeRefId = val;

  bool hasRecipeRefId() => _recipeRefId != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "serviceOutletId" field.
  String? _serviceOutletId;
  String get serviceOutletId => _serviceOutletId ?? '';
  set serviceOutletId(String? val) => _serviceOutletId = val;

  bool hasServiceOutletId() => _serviceOutletId != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  // "recipeId" field.
  String? _recipeId;
  String get recipeId => _recipeId ?? '';
  set recipeId(String? val) => _recipeId = val;

  bool hasRecipeId() => _recipeId != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  set stock(int? val) => _stock = val;

  void incrementStock(int amount) => stock = stock + amount;

  bool hasStock() => _stock != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "keywords" field.
  List<String>? _keywords;
  List<String> get keywords => _keywords ?? const [];
  set keywords(List<String>? val) => _keywords = val;

  void updateKeywords(Function(List<String>) updateFn) {
    updateFn(_keywords ??= []);
  }

  bool hasKeywords() => _keywords != null;

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

  static ProductStructStruct fromMap(Map<String, dynamic> data) =>
      ProductStructStruct(
        id: data['id'] as String?,
        price: castToType<double>(data['price']),
        category: data['category'] as String?,
        code: castToType<int>(data['code']),
        name: data['name'] as String?,
        sellingPrice: castToType<double>(data['sellingPrice']),
        mrpPrice: castToType<double>(data['mrpPrice']),
        purchasePrice: castToType<double>(data['purchasePrice']),
        categoryId: data['categoryId'] as String?,
        taxId: data['taxId'] as String?,
        unitId: data['unitId'] as String?,
        regionalName: data['regionalName'] as String?,
        barcode: data['barcode'] as String?,
        hsncode: castToType<int>(data['hsncode']),
        reorderLevel: castToType<int>(data['reorderLevel']),
        searchcode: castToType<int>(data['searchcode']),
        shortName: data['shortName'] as String?,
        weightable: data['weightable'] as bool?,
        stockable: data['stockable'] as bool?,
        discountPer: castToType<double>(data['discountPer']),
        discountAmt: castToType<double>(data['discountAmt']),
        productMasterId: data['productMasterId'] as String?,
        recipeRefId: data['recipeRefId'] as String?,
        imageUrl: data['imageUrl'] as String?,
        serviceOutletId: data['serviceOutletId'] as String?,
        type: castToType<int>(data['type']),
        recipeId: data['recipeId'] as String?,
        stock: castToType<int>(data['stock']),
        isDeleted: data['isDeleted'] as bool?,
        keywords: getDataList(data['keywords']),
        synC: data['synC'] as bool?,
        hivekey: castToType<int>(data['hivekey']),
        version: castToType<int>(data['version']),
      );

  static ProductStructStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'price': _price,
        'category': _category,
        'code': _code,
        'name': _name,
        'sellingPrice': _sellingPrice,
        'mrpPrice': _mrpPrice,
        'purchasePrice': _purchasePrice,
        'categoryId': _categoryId,
        'taxId': _taxId,
        'unitId': _unitId,
        'regionalName': _regionalName,
        'barcode': _barcode,
        'hsncode': _hsncode,
        'reorderLevel': _reorderLevel,
        'searchcode': _searchcode,
        'shortName': _shortName,
        'weightable': _weightable,
        'stockable': _stockable,
        'discountPer': _discountPer,
        'discountAmt': _discountAmt,
        'productMasterId': _productMasterId,
        'recipeRefId': _recipeRefId,
        'imageUrl': _imageUrl,
        'serviceOutletId': _serviceOutletId,
        'type': _type,
        'recipeId': _recipeId,
        'stock': _stock,
        'isDeleted': _isDeleted,
        'keywords': _keywords,
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
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'sellingPrice': serializeParam(
          _sellingPrice,
          ParamType.double,
        ),
        'mrpPrice': serializeParam(
          _mrpPrice,
          ParamType.double,
        ),
        'purchasePrice': serializeParam(
          _purchasePrice,
          ParamType.double,
        ),
        'categoryId': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'taxId': serializeParam(
          _taxId,
          ParamType.String,
        ),
        'unitId': serializeParam(
          _unitId,
          ParamType.String,
        ),
        'regionalName': serializeParam(
          _regionalName,
          ParamType.String,
        ),
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'hsncode': serializeParam(
          _hsncode,
          ParamType.int,
        ),
        'reorderLevel': serializeParam(
          _reorderLevel,
          ParamType.int,
        ),
        'searchcode': serializeParam(
          _searchcode,
          ParamType.int,
        ),
        'shortName': serializeParam(
          _shortName,
          ParamType.String,
        ),
        'weightable': serializeParam(
          _weightable,
          ParamType.bool,
        ),
        'stockable': serializeParam(
          _stockable,
          ParamType.bool,
        ),
        'discountPer': serializeParam(
          _discountPer,
          ParamType.double,
        ),
        'discountAmt': serializeParam(
          _discountAmt,
          ParamType.double,
        ),
        'productMasterId': serializeParam(
          _productMasterId,
          ParamType.String,
        ),
        'recipeRefId': serializeParam(
          _recipeRefId,
          ParamType.String,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'serviceOutletId': serializeParam(
          _serviceOutletId,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'recipeId': serializeParam(
          _recipeId,
          ParamType.String,
        ),
        'stock': serializeParam(
          _stock,
          ParamType.int,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'keywords': serializeParam(
          _keywords,
          ParamType.String,
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

  static ProductStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        sellingPrice: deserializeParam(
          data['sellingPrice'],
          ParamType.double,
          false,
        ),
        mrpPrice: deserializeParam(
          data['mrpPrice'],
          ParamType.double,
          false,
        ),
        purchasePrice: deserializeParam(
          data['purchasePrice'],
          ParamType.double,
          false,
        ),
        categoryId: deserializeParam(
          data['categoryId'],
          ParamType.String,
          false,
        ),
        taxId: deserializeParam(
          data['taxId'],
          ParamType.String,
          false,
        ),
        unitId: deserializeParam(
          data['unitId'],
          ParamType.String,
          false,
        ),
        regionalName: deserializeParam(
          data['regionalName'],
          ParamType.String,
          false,
        ),
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        hsncode: deserializeParam(
          data['hsncode'],
          ParamType.int,
          false,
        ),
        reorderLevel: deserializeParam(
          data['reorderLevel'],
          ParamType.int,
          false,
        ),
        searchcode: deserializeParam(
          data['searchcode'],
          ParamType.int,
          false,
        ),
        shortName: deserializeParam(
          data['shortName'],
          ParamType.String,
          false,
        ),
        weightable: deserializeParam(
          data['weightable'],
          ParamType.bool,
          false,
        ),
        stockable: deserializeParam(
          data['stockable'],
          ParamType.bool,
          false,
        ),
        discountPer: deserializeParam(
          data['discountPer'],
          ParamType.double,
          false,
        ),
        discountAmt: deserializeParam(
          data['discountAmt'],
          ParamType.double,
          false,
        ),
        productMasterId: deserializeParam(
          data['productMasterId'],
          ParamType.String,
          false,
        ),
        recipeRefId: deserializeParam(
          data['recipeRefId'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        serviceOutletId: deserializeParam(
          data['serviceOutletId'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        recipeId: deserializeParam(
          data['recipeId'],
          ParamType.String,
          false,
        ),
        stock: deserializeParam(
          data['stock'],
          ParamType.int,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        keywords: deserializeParam<String>(
          data['keywords'],
          ParamType.String,
          true,
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
  String toString() => 'ProductStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductStructStruct &&
        id == other.id &&
        price == other.price &&
        category == other.category &&
        code == other.code &&
        name == other.name &&
        sellingPrice == other.sellingPrice &&
        mrpPrice == other.mrpPrice &&
        purchasePrice == other.purchasePrice &&
        categoryId == other.categoryId &&
        taxId == other.taxId &&
        unitId == other.unitId &&
        regionalName == other.regionalName &&
        barcode == other.barcode &&
        hsncode == other.hsncode &&
        reorderLevel == other.reorderLevel &&
        searchcode == other.searchcode &&
        shortName == other.shortName &&
        weightable == other.weightable &&
        stockable == other.stockable &&
        discountPer == other.discountPer &&
        discountAmt == other.discountAmt &&
        productMasterId == other.productMasterId &&
        recipeRefId == other.recipeRefId &&
        imageUrl == other.imageUrl &&
        serviceOutletId == other.serviceOutletId &&
        type == other.type &&
        recipeId == other.recipeId &&
        stock == other.stock &&
        isDeleted == other.isDeleted &&
        listEquality.equals(keywords, other.keywords) &&
        synC == other.synC &&
        hivekey == other.hivekey &&
        version == other.version;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        price,
        category,
        code,
        name,
        sellingPrice,
        mrpPrice,
        purchasePrice,
        categoryId,
        taxId,
        unitId,
        regionalName,
        barcode,
        hsncode,
        reorderLevel,
        searchcode,
        shortName,
        weightable,
        stockable,
        discountPer,
        discountAmt,
        productMasterId,
        recipeRefId,
        imageUrl,
        serviceOutletId,
        type,
        recipeId,
        stock,
        isDeleted,
        keywords,
        synC,
        hivekey,
        version
      ]);
}

ProductStructStruct createProductStructStruct({
  String? id,
  double? price,
  String? category,
  int? code,
  String? name,
  double? sellingPrice,
  double? mrpPrice,
  double? purchasePrice,
  String? categoryId,
  String? taxId,
  String? unitId,
  String? regionalName,
  String? barcode,
  int? hsncode,
  int? reorderLevel,
  int? searchcode,
  String? shortName,
  bool? weightable,
  bool? stockable,
  double? discountPer,
  double? discountAmt,
  String? productMasterId,
  String? recipeRefId,
  String? imageUrl,
  String? serviceOutletId,
  int? type,
  String? recipeId,
  int? stock,
  bool? isDeleted,
  bool? synC,
  int? hivekey,
  int? version,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductStructStruct(
      id: id,
      price: price,
      category: category,
      code: code,
      name: name,
      sellingPrice: sellingPrice,
      mrpPrice: mrpPrice,
      purchasePrice: purchasePrice,
      categoryId: categoryId,
      taxId: taxId,
      unitId: unitId,
      regionalName: regionalName,
      barcode: barcode,
      hsncode: hsncode,
      reorderLevel: reorderLevel,
      searchcode: searchcode,
      shortName: shortName,
      weightable: weightable,
      stockable: stockable,
      discountPer: discountPer,
      discountAmt: discountAmt,
      productMasterId: productMasterId,
      recipeRefId: recipeRefId,
      imageUrl: imageUrl,
      serviceOutletId: serviceOutletId,
      type: type,
      recipeId: recipeId,
      stock: stock,
      isDeleted: isDeleted,
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

ProductStructStruct? updateProductStructStruct(
  ProductStructStruct? productStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductStructStructData(
  Map<String, dynamic> firestoreData,
  ProductStructStruct? productStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productStruct == null) {
    return;
  }
  if (productStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productStructData =
      getProductStructFirestoreData(productStruct, forFieldValue);
  final nestedData =
      productStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductStructFirestoreData(
  ProductStructStruct? productStruct, [
  bool forFieldValue = false,
]) {
  if (productStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productStruct.toMap());

  // Add any Firestore field values
  productStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductStructListFirestoreData(
  List<ProductStructStruct>? productStructs,
) =>
    productStructs
        ?.map((e) => getProductStructFirestoreData(e, true))
        .toList() ??
    [];
