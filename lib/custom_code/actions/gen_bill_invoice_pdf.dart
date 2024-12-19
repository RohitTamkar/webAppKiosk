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

import 'package:collection/collection.dart';
import 'dart:io';
import 'dart:convert';
import 'index.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;

Future<String> genBillInvoicePdf(
  InvoiceRecord bill,
  OutletRecord outletDoc,
  HeaderRecord headerDoc,
) async {
  final pdf = pw.Document();

  // Tax calculation variables
  Map<double, List<double>> taxMap =
      {}; // Store taxable amounts and total tax by percentage
  double totalCGST = 0.0;
  double totalSGST = 0.0;
  double totalTaxAmt = 0.0;

  // Group products by tax percentage and calculate respective taxes
  for (var item in bill.productList) {
    double taxPer = item.taxPer;
    double taxAmt = item.taxAmt;
    double taxableAmt =
        item.price * item.quantity; // Assuming total includes tax

    if (!taxMap.containsKey(taxPer)) {
      taxMap[taxPer] = [0, 0]; // Initialize with [taxableAmt, taxAmt]
    }

    taxMap[taxPer]?[0] += taxableAmt;
    taxMap[taxPer]?[1] += taxAmt;
  }

  taxMap.forEach((taxPer, values) {
    double taxableAmt = values[0];
    double taxAmt = values[1];
    double cgst = taxAmt / 2;
    double sgst = taxAmt / 2;

    totalCGST += cgst;
    totalSGST += sgst;
    totalTaxAmt += taxAmt;
  });

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          padding: pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section
              pw.Center(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    if (headerDoc.title.isNotEmpty)
                      pw.Text(headerDoc.title,
                          style: pw.TextStyle(
                              fontSize: 24, fontWeight: pw.FontWeight.bold)),
                    if (headerDoc.address.isNotEmpty)
                      pw.Text(headerDoc.address),
                    if (headerDoc.subtitleAddress.isNotEmpty)
                      pw.Wrap(
                        alignment: pw.WrapAlignment.center,
                        children: [
                          pw.Text(
                            headerDoc.subtitleAddress,
                            textAlign: pw.TextAlign.center,
                          ),
                        ],
                      ),
                    if (headerDoc.contactNo.isNotEmpty)
                      pw.Text("Contact No: ${headerDoc.contactNo}"),
                    if (headerDoc.email.isNotEmpty)
                      pw.Text("Email: ${headerDoc.email}"),
                    if (headerDoc.gstNo.isNotEmpty)
                      pw.Text("GST NO: ${headerDoc.gstNo}"),
                  ],
                ),
              ),
              pw.Divider(),

              // Bill Info
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Date: ${bill.dayId}"),
                  pw.Text("Bill No: ${bill.invoice}"),
                ],
              ),
              pw.SizedBox(height: 10),

              pw.Divider(),

              // Items Table Header
              pw.Table.fromTextArray(
                headers: ['ITEM_NAME', 'QTY', 'RATE', 'DIS%', 'TOTAL'],
                data: bill.productList
                    .map((item) => [
                          item.name,
                          item.quantity.toString(),
                          item.price.toString(),
                          item.disPer.toString() ??
                              0, // assuming discount is 0 for now
                          item.total.toString(),
                        ])
                    .toList(),
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Items: ${bill.productList.length}"),
                  pw.Text(
                      "Sub total: ${(bill.billAmt - bill.taxAmt).toStringAsFixed(2)}"),
                ],
              ),

              // Tax and Discounts
              pw.SizedBox(height: 5),
              pw.Text("Total Tax: ${totalTaxAmt.toStringAsFixed(2)}"),
              pw.Text(
                  "Total Discount Amt: ${bill.discountAmt.toStringAsFixed(2)}"),
              pw.SizedBox(height: 10),

              pw.Text(
                "Grand Total: ${bill.finalBillAmt.toStringAsFixed(2)}",
                style:
                    pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 5),

              pw.Divider(),

              // Payment Mode
              pw.Text("PAYMENT MODE: ${bill.paymentMode}"),
              pw.SizedBox(height: 10),

              // Tax Details Table
              pw.Text("Tax Details ( All Exclusive )"),
              pw.Table.fromTextArray(
                headers: ['TAX%', 'TAXABLE', 'CGST', 'SGST', 'TAXAMT'],
                data: taxMap.entries.map((entry) {
                  double taxPer = entry.key;
                  double taxableAmt = entry.value[0];
                  double taxAmt = entry.value[1];
                  double cgst = taxAmt / 2;
                  double sgst = taxAmt / 2;

                  return [
                    taxPer.toString(),
                    taxableAmt.toStringAsFixed(2),
                    cgst.toStringAsFixed(2),
                    sgst.toStringAsFixed(2),
                    taxAmt.toStringAsFixed(2),
                  ];
                }).toList(),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                "Total Taxable Amount: ${bill.productList.map((item) => item.total - item.taxAmt).reduce((a, b) => a + b).toStringAsFixed(2)}  "
                "CGST: ${totalCGST.toStringAsFixed(2)}  "
                "SGST: ${totalSGST.toStringAsFixed(2)}  "
                "TaxAmt: ${totalTaxAmt.toStringAsFixed(2)}",
              ),
              pw.SizedBox(height: 20),

              // Footer
              pw.Center(
                child: pw.Text("THANK YOU VISIT AGAIN",
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    ),
  );

  // Save the PDF
  final bytes = await pdf.save();
  final base64String = base64Encode(bytes);
  return base64String;
}

String convertToWords(int amount) {
  final List<String> units = [
    '',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Sixteen',
    'Seventeen',
    'Eighteen',
    'Nineteen'
  ];

  final List<String> tens = [
    '',
    '',
    'Twenty',
    'Thirty',
    'Forty',
    'Fifty',
    'Sixty',
    'Seventy',
    'Eighty',
    'Ninety'
  ];

  final List<String> scales = [
    '',
    'Thousand',
    'Lakh',
    'Crore',
  ];

  if (amount == 0) {
    return 'Zero';
  }

  if (amount < 0) {
    return 'Minus ${convertToWords(-amount)}';
  }

  int num = amount;
  String words = '';

  // Handling Crores
  if (num >= 10000000) {
    words += '${convertToWords(num ~/ 10000000)} Crore ';
    num %= 10000000;
  }

  // Handling Lakhs
  if (num >= 100000) {
    words += '${convertToWords(num ~/ 100000)} Lakh ';
    num %= 100000;
  }

  // Handling Thousands
  if (num >= 1000) {
    words += '${convertToWords(num ~/ 1000)} Thousand ';
    num %= 1000;
  }

  // Handling Hundreds
  if (num >= 100) {
    words += '${convertToWords(num ~/ 100)} Hundred ';
    num %= 100;
  }

  // Handling tens and units
  if (num > 0) {
    if (num < 20) {
      words += units[num];
    } else {
      words += tens[num ~/ 10];
      if ((num % 10) > 0) {
        words += ' ${units[num % 10]}';
      }
    }
  }

  return words.trim();
}
