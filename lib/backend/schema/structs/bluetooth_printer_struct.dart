// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BluetoothPrinterStruct extends FFFirebaseStruct {
  BluetoothPrinterStruct({
    int? id,
    String? deviceName,
    String? address,
    String? port,
    String? vendorId,
    String? productId,
    bool? isBle,
    bool? state,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _deviceName = deviceName,
        _address = address,
        _port = port,
        _vendorId = vendorId,
        _productId = productId,
        _isBle = isBle,
        _state = state,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "deviceName" field.
  String? _deviceName;
  String get deviceName => _deviceName ?? '';
  set deviceName(String? val) => _deviceName = val;

  bool hasDeviceName() => _deviceName != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "port" field.
  String? _port;
  String get port => _port ?? '';
  set port(String? val) => _port = val;

  bool hasPort() => _port != null;

  // "vendorId" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  set vendorId(String? val) => _vendorId = val;

  bool hasVendorId() => _vendorId != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "isBle" field.
  bool? _isBle;
  bool get isBle => _isBle ?? false;
  set isBle(bool? val) => _isBle = val;

  bool hasIsBle() => _isBle != null;

  // "state" field.
  bool? _state;
  bool get state => _state ?? false;
  set state(bool? val) => _state = val;

  bool hasState() => _state != null;

  static BluetoothPrinterStruct fromMap(Map<String, dynamic> data) =>
      BluetoothPrinterStruct(
        id: castToType<int>(data['id']),
        deviceName: data['deviceName'] as String?,
        address: data['address'] as String?,
        port: data['port'] as String?,
        vendorId: data['vendorId'] as String?,
        productId: data['productId'] as String?,
        isBle: data['isBle'] as bool?,
        state: data['state'] as bool?,
      );

  static BluetoothPrinterStruct? maybeFromMap(dynamic data) => data is Map
      ? BluetoothPrinterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'deviceName': _deviceName,
        'address': _address,
        'port': _port,
        'vendorId': _vendorId,
        'productId': _productId,
        'isBle': _isBle,
        'state': _state,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'deviceName': serializeParam(
          _deviceName,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'port': serializeParam(
          _port,
          ParamType.String,
        ),
        'vendorId': serializeParam(
          _vendorId,
          ParamType.String,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'isBle': serializeParam(
          _isBle,
          ParamType.bool,
        ),
        'state': serializeParam(
          _state,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BluetoothPrinterStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BluetoothPrinterStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        deviceName: deserializeParam(
          data['deviceName'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        port: deserializeParam(
          data['port'],
          ParamType.String,
          false,
        ),
        vendorId: deserializeParam(
          data['vendorId'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        isBle: deserializeParam(
          data['isBle'],
          ParamType.bool,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BluetoothPrinterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BluetoothPrinterStruct &&
        id == other.id &&
        deviceName == other.deviceName &&
        address == other.address &&
        port == other.port &&
        vendorId == other.vendorId &&
        productId == other.productId &&
        isBle == other.isBle &&
        state == other.state;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, deviceName, address, port, vendorId, productId, isBle, state]);
}

BluetoothPrinterStruct createBluetoothPrinterStruct({
  int? id,
  String? deviceName,
  String? address,
  String? port,
  String? vendorId,
  String? productId,
  bool? isBle,
  bool? state,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BluetoothPrinterStruct(
      id: id,
      deviceName: deviceName,
      address: address,
      port: port,
      vendorId: vendorId,
      productId: productId,
      isBle: isBle,
      state: state,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BluetoothPrinterStruct? updateBluetoothPrinterStruct(
  BluetoothPrinterStruct? bluetoothPrinter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bluetoothPrinter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBluetoothPrinterStructData(
  Map<String, dynamic> firestoreData,
  BluetoothPrinterStruct? bluetoothPrinter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bluetoothPrinter == null) {
    return;
  }
  if (bluetoothPrinter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bluetoothPrinter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bluetoothPrinterData =
      getBluetoothPrinterFirestoreData(bluetoothPrinter, forFieldValue);
  final nestedData =
      bluetoothPrinterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bluetoothPrinter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBluetoothPrinterFirestoreData(
  BluetoothPrinterStruct? bluetoothPrinter, [
  bool forFieldValue = false,
]) {
  if (bluetoothPrinter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bluetoothPrinter.toMap());

  // Add any Firestore field values
  bluetoothPrinter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBluetoothPrinterListFirestoreData(
  List<BluetoothPrinterStruct>? bluetoothPrinters,
) =>
    bluetoothPrinters
        ?.map((e) => getBluetoothPrinterFirestoreData(e, true))
        .toList() ??
    [];
