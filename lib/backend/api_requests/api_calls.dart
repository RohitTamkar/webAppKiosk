import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

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

class PayApiCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? merchantTransactionId = '',
    String? merchantUserId = '',
    double? amount,
    String? redirectUrl = '',
    String? redirectMode = '',
    String? callbackUrl = '',
    int? mobileNumber,
    String? type = '',
    String? outletId = '',
    String? orderId = '',
    String? merchantKey = '',
    bool? isProd,
  }) async {
    final ffApiRequestBody = '''
{
  "merchantId": "${escapeStringForJson(merchantId)}",
  "merchantTransactionId": "${escapeStringForJson(merchantTransactionId)}",
  "merchantUserId": "${escapeStringForJson(merchantUserId)}",
  "amount": ${amount},
  "redirectUrl": "${escapeStringForJson(redirectUrl)}",
  "redirectMode": "${escapeStringForJson(redirectMode)}",
  "callbackUrl": "${escapeStringForJson(callbackUrl)}",
  "mobileNumber": ${mobileNumber},
  "type": "${escapeStringForJson(type)}",
  "outletId": "${escapeStringForJson(outletId)}",
  "orderId": "${escapeStringForJson(orderId)}",
  "merchantKey": "${escapeStringForJson(merchantKey)}",
  "isProd": ${isProd}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'payApi',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/PhonePeAPI/payAPI',
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

class CheckStatusCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? merchantTransactionId = '',
    String? outletId = '',
    String? orderId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "merchantId": "${escapeStringForJson(merchantId)}",
  "merchantTransactionId": "${escapeStringForJson(merchantTransactionId)}",
  "outletId": "${escapeStringForJson(outletId)}",
  "orderId": "${escapeStringForJson(orderId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkStatus',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/PhonePeAPI/payAPI/status',
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
