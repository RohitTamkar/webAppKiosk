import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetDaywiseShiftsCall {
  static Future<ApiCallResponse> call({
    String? outletId = '0',
    String? dayId = '0',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetDaywiseShiftsCall',
        'variables': {
          'outletId': outletId,
          'dayId': dayId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetProductWiseSaleCall {
  static Future<ApiCallResponse> call({
    String? outletId = '',
    String? dayId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProductWiseSale',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/getProductSaleDayWise',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'outletId': outletId,
        'dayId': dayId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchProdcutsCall {
  static Future<ApiCallResponse> call({
    String? query = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'searchProdcuts',
      apiUrl:
          'https://test-search.ent.asia-south1.gcp.elastic-cloud.com/api/as/v1/engines/sensiblebizproproducts/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic dGVzdHVzZXI6UG9zYmlsbEAyMw==',
      },
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDeviceCall {
  static Future<ApiCallResponse> call({
    String? deviceId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getDevice',
      apiUrl: 'https://asia-south1-sensiblebizpro.cloudfunctions.net/getDevice',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'deviceId': deviceId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserOutletWiseCall {
  static Future<ApiCallResponse> call({
    String? outletId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserOutletWise',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/getUsersOurketwise-1',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'deviceId': outletId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCategoriesCall {
  static Future<ApiCallResponse> call({
    String? outletId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCategories',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/getCategoriesByOutlet',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'outletId': outletId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductsCall {
  static Future<ApiCallResponse> call({
    String? outletId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getProducts',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/getProductsByCategory',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'outletId': outletId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateQRCall {
  static Future<ApiCallResponse> call({
    String? mid = '',
    String? orderId = '',
    String? amount = '',
    String? businessType = '',
    String? posId = '',
    String? mKey = '',
    bool? isProd = false,
  }) async {
    final ffApiRequestBody = '''
{
  "mid": "${mid}",
  "orderId": "${orderId}",
  "amount": "${amount}",
  "businessType": "${businessType}",
  "posId": "${posId}",
  "mKey": "${mKey}",
  "isProd": ${isProd}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createQR',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/paytm_QR/createQR',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TransactionStatusAPICall {
  static Future<ApiCallResponse> call({
    String? mid = '',
    String? orderId = '',
    String? mKey = '',
    bool? isProd = false,
  }) async {
    final ffApiRequestBody = '''
{
  "mid": "${mid}",
  "orderId": "${orderId}",
  "mKey": "${mKey}",
  "isProd": ${isProd}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'transactionStatusAPI',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/paytm_QR/status',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RazorpayQRCreationCall {
  static Future<ApiCallResponse> call({
    String? type = '',
    String? name = '',
    double? paymentAmount,
    String? description = '',
    int? closeBy,
    bool? isProd,
    String? purpose = '',
    bool? fixedAmount,
    String? orderId = '',
    String? posId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "type": "${type}",
  "name": "${name}",
  "fixedAmount": ${fixedAmount},
  "paymentAmount": ${paymentAmount},
  "description": "${description}",
  "closeBy": "${closeBy}",
  "isProd": ${isProd},
  "purpose": "${purpose}",
  "orderId": "${orderId}",
  "posId": "${posId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'razorpayQRCreation',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/RazorPayIntegration/payQR',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PhonePeQRCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? transactionId = '',
    String? merchantOrderId = '',
    String? amount = '',
    String? storeId = '',
    int? expiresIn,
  }) async {
    final ffApiRequestBody = '''
{
  "merchantId": "${merchantId}",
  "transactionId": "${transactionId}",
  "merchantOrderId": "${merchantOrderId}",
  "amount": ${amount},
  "storeId": "${storeId}",
  "expiresIn": ${expiresIn}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'phonePeQR',
      apiUrl:
          'https://us-central1-sensiblebizpro.cloudfunctions.net/function-2',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PhonepeStatusCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? transactionId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "merchantId": "${merchantId}",
  "transactionId": "${transactionId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'phonepeStatus',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/PhonePeCallBack/phonepe/status',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? outletName = '',
    String? file = '',
    String? fileName = '',
    String? toEmail = '',
    String? branchName = '',
    String? username = '',
    String? mobileNo = '',
    String? roll = '',
    String? reportType = '',
  }) async {
    final ffApiRequestBody = '''
{
  "outletName": "${outletName}",
  "branchName": "${branchName}",
  "userName": "${username}",
  "userMobileNumber": "${mobileNo}",
  "userRoll": "${roll}",
  "reportType":"${reportType}",
  "file": "${file}",
  "fileName": "${fileName}",
  "toEmail": "${toEmail}",
  "ccEmail": "rohit.sensibleconnect@gmail.com"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmail',
      apiUrl:
          'https://asia-south1-sconnect-pos.cloudfunctions.net/msg91Mail/send_mail',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin':
            'https://ff-debug-service-frontend-pro-ygxkweukma-uc.a.run.app',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'POST',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendWhatsappMsgBillPdfCall {
  static Future<ApiCallResponse> call({
    String? userMobileNumber = '',
    String? link = '',
    String? filename = '',
    String? name = '',
    String? outletName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userMobileNumber": "${userMobileNumber}",
  "link": "${link}",
  "filename": "${filename}",
  "name": "${name}",
  "outletName": "${outletName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendWhatsappMsgBillPdf',
      apiUrl:
          'https://asia-south1-sconnect-pos.cloudfunctions.net/SavePDFSendPDF/send_pdf_whatsapp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
