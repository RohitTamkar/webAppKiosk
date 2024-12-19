// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:io';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:path_provider/path_provider.dart';
import 'dart:convert';

import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
//import 'package:http/http.dart' as http;
//import 'dart:html' as html; // Import for web specific functionality

Future<String> generateInvoice(
  String? orderId,
  List<PurchaseSaleItemListStruct>? orderList,
  String? totalAmt,
  PurchaseRecord? purchaseDetails,
  PartyRecord? userDetails,
) async {
  final pdf = pw.Document();

  // Load logo image from URL
  // final http.Response response = await http.get(Uri.parse(logoImageUrl!));
  // final Uint8List logoImageBytes = response.bodyBytes;
  // final logoImageProvider = pw.MemoryImage(logoImageBytes);

  // final http.Response response1 = await http.get(Uri.parse(
  //     'https://firebasestorage.googleapis.com/v0/b/uvpixcel.appspot.com/o/importantImages%2Faddd.jpg?alt=media&token=6a7b48ba-ecb3-4b43-817f-3386f5783546'!));
  // final Uint8List logoImageBytes1 = response1.bodyBytes;
  // final logoImageProvider1 = pw.MemoryImage(logoImageBytes1);

  double totalAmountSale = 0;
  for (var order in orderList!) {
    totalAmountSale = totalAmountSale + order.total.toDouble();
  }

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Header with logo
            // pw.Row(
            //   mainAxisAlignment: pw.MainAxisAlignment.center,
            //   children: [
            //     pw.SizedBox(width: 20),
            //     pw.Image(logoImageProvider, width: 100), // Logo image
            //   ],
            // ),
            // Order details
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.SizedBox(width: 10),
                pw.Text(
                  'PURCHASE INVOICE',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            ),
            pw.Container(
              padding: pw.EdgeInsets.symmetric(vertical: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                      'Date: ${DateFormat('dd-MM-yyyy').format(DateTime.now())}'), // Current date
                  pw.Text('Order ID: $orderId'),

                  pw.SizedBox(height: 10),
                  pw.Text(
                    'To Address: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('${userDetails?.address ?? ''}'),
                  pw.SizedBox(height: 10),
                  // Bold labels for customer details
                  pw.Text(
                    'Supplier Name: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    '${userDetails?.name ?? ''}',
                  ),
                  pw.Text(
                    'Supplier BillNo: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    '${purchaseDetails?.supplierBillNo ?? ''}',
                  ),
                  pw.Text(
                    'Note: ${purchaseDetails?.note ?? ''}',
                  ),
                  pw.Text(
                    'Mobile No: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('+91${userDetails?.mobile ?? ''}'),
                  pw.Text(
                    'Email: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text('${userDetails?.email ?? ''}'),
                  pw.SizedBox(height: 10),

                  pw.Table.fromTextArray(
                    context: context,
                    cellAlignment: pw.Alignment.centerLeft,
                    headerAlignment: pw.Alignment.centerLeft,
                    data: [
                      // Header row
                      ['Product Name', 'Quantity', 'Price', 'Total'],
                      // Order items
                      ...orderList!.map((order) => [
                            '${order.name}',
                            order.quantity.toString(),
                            order.price.toString(),
                            order.total.toString()
                          ]),
                      // ['', 'Grand Total:', totalAmt.toString()],
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.SizedBox(width: 10),
                      pw.Text(
                        'Payment Mode: ${FFAppState().groceryJson['paymentMode']}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.SizedBox(width: 10),
                      pw.Text(
                        'Grand Total: ${totalAmountSale.toStringAsFixed(2)}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  // pw.Text('${order?.totalAmt ?? ''}'),
                  pw.SizedBox(height: 10),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.SizedBox(width: 10),
                      //  pw.Image(logoImageProvider1, width: 300), // Logo image
                    ],
                  ),
                  pw.SizedBox(height: 50),
                  //pw.Spacer(),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.SizedBox(width: 10),
                      pw.Text(
                        'Authorised Signatory',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  // Save the PDF bytes
  final bytes = await pdf.save();
  final base64String = base64Encode(bytes);
  final pdfDataUri = 'data:application/pdf;base64,$base64String';

  // Print the PDF in web environment
/*  if (html.window.navigator.userAgent.contains('Chrome')) {
    // For Chrome browser
    html.AnchorElement(href: pdfDataUri)
      ..setAttribute('download', 'ORD-$orderId.pdf')
      ..click();
  } else {
    // For other browsers
    html.window.open(pdfDataUri, '_blank');

  }*/

  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/invoice_$orderId.pdf';
  final file = File(filePath);

  // Write the PDF file
  await file.writeAsBytes(bytes);

  // On Windows, open the PDF with the default viewer
  try {
    if (Platform.isWindows) {
      // Open the file using the default system application
      await Process.start('explorer.exe', [file.path]);
    } else {
      throw 'Unsupported platform';
    }
  } catch (e) {
    throw 'Could not launch the PDF file: $e';
  }

  return pdfDataUri;
}

String calculateGST(String? totalAmt) {
  if (totalAmt == null) return '0.00';
  double amt = double.tryParse(totalAmt) ?? 0.0;
  double gst = amt * 0.18; // 18% GST
  return gst.toStringAsFixed(2);
}
