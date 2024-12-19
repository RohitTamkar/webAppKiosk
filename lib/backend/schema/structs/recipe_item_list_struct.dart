// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipeItemListStruct extends FFFirebaseStruct {
  RecipeItemListStruct({
    String? name,
    double? price,
    double? quantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _price = price,
        _quantity = quantity,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  static RecipeItemListStruct fromMap(Map<String, dynamic> data) =>
      RecipeItemListStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        quantity: castToType<double>(data['quantity']),
      );

  static RecipeItemListStruct? maybeFromMap(dynamic data) => data is Map
      ? RecipeItemListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'quantity': _quantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
      }.withoutNulls;

  static RecipeItemListStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipeItemListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RecipeItemListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecipeItemListStruct &&
        name == other.name &&
        price == other.price &&
        quantity == other.quantity;
  }

  @override
  int get hashCode => const ListEquality().hash([name, price, quantity]);
}

RecipeItemListStruct createRecipeItemListStruct({
  String? name,
  double? price,
  double? quantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeItemListStruct(
      name: name,
      price: price,
      quantity: quantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipeItemListStruct? updateRecipeItemListStruct(
  RecipeItemListStruct? recipeItemList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipeItemList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipeItemListStructData(
  Map<String, dynamic> firestoreData,
  RecipeItemListStruct? recipeItemList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipeItemList == null) {
    return;
  }
  if (recipeItemList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipeItemList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipeItemListData =
      getRecipeItemListFirestoreData(recipeItemList, forFieldValue);
  final nestedData =
      recipeItemListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipeItemList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipeItemListFirestoreData(
  RecipeItemListStruct? recipeItemList, [
  bool forFieldValue = false,
]) {
  if (recipeItemList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipeItemList.toMap());

  // Add any Firestore field values
  recipeItemList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipeItemListListFirestoreData(
  List<RecipeItemListStruct>? recipeItemLists,
) =>
    recipeItemLists
        ?.map((e) => getRecipeItemListFirestoreData(e, true))
        .toList() ??
    [];
