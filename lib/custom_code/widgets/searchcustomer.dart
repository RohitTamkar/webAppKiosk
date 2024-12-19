// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/scheduler.dart';
import '/custom_code/actions/index.dart' as actions;

import '/flutter_flow/custom_functions.dart' as functions;
// Imports other custom widgets
import '/flutter_flow/custom_functions.dart' as functions;
import '../actions/setup_item_hive.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

class Searchcustomer extends StatefulWidget {
  const Searchcustomer({
    Key? key,
    this.width,
    this.height,
    required this.customer,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<PartyRecord> customer;

  @override
  _SearchcustomerState createState() => _SearchcustomerState();
}

class _SearchcustomerState extends State<Searchcustomer> {
  final TextEditingController _custNameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: TypeAheadField<PartyRecord>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _custNameController,
                focusNode: _focusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search Customer by name or mobile number...',
                ),
                onSubmitted: (value) {
                  _selectCustomer(value);
                },
              ),
              suggestionsCallback: (pattern) {
                return widget.customer.where((cust) =>
                    cust.name.toLowerCase().contains(pattern.toLowerCase()) ||
                    cust.mobile.toLowerCase().contains(pattern.toLowerCase()));
              },
              itemBuilder: (context, PartyRecord cust) {
                return ListTile(
                  title: Text(cust.name),
                  subtitle: Text('Mobile: ${cust.mobile}'),
                );
              },
              onSuggestionSelected: (PartyRecord selectedCustomer) {
                _selectCustomer(selectedCustomer.name);
                _custNameController.clear();
              },
            ),
          ),
        ),
      ],
    );
  }

  /// Handles customer selection
  void _selectCustomer(String nameOrMobile) {
    List<PartyRecord> custDetails = widget.customer
        .where((cust) =>
            cust.name.toLowerCase() == nameOrMobile.toLowerCase() ||
            cust.mobile.toLowerCase() == nameOrMobile.toLowerCase())
        .toList();

    if (custDetails.isNotEmpty) {
      PartyRecord selectedCust = custDetails.first;

      // Update global state
      //  FFAppState().setCustName = selectedCust.name;
      FFAppState().setCustName = selectedCust.name;
      FFAppState().setCustMobNo = selectedCust.mobile;
      FFAppState().oldBalance = selectedCust.oldBalance;
      FFAppState().custCredit = selectedCust.creditLimit;
      FFAppState().update(() {});
      FFAppState().setCustRef = selectedCust.reference;
      FFAppState().isCustListShown = true;
      FFAppState().update(() {});
      // Optionally refresh the UI if needed
      setState(() {});
    }
  }
}
