import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'kiosk_advertising_widget.dart' show KioskAdvertisingWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KioskAdvertisingModel extends FlutterFlowModel<KioskAdvertisingWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - scanPrinter] action in KioskAdvertising widget.
  bool? resDevice2Copy;
  // Stores action output result for [Custom Action - connectDevice] action in KioskAdvertising widget.
  bool? connectdeviceCOPY23;
  // Model for KioskHeader component.
  late KioskHeaderModel kioskHeaderModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    kioskHeaderModel = createModel(context, () => KioskHeaderModel());
  }

  @override
  void dispose() {
    kioskHeaderModel.dispose();
  }
}
