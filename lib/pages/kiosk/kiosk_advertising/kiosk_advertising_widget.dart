import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_advertising_model.dart';
export 'kiosk_advertising_model.dart';

class KioskAdvertisingWidget extends StatefulWidget {
  const KioskAdvertisingWidget({
    super.key,
    this.userDoc,
    this.shiftdoc,
    this.appsetting,
    this.taxcollection,
  });

  final DocumentReference? userDoc;
  final dynamic shiftdoc;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<KioskAdvertisingWidget> createState() => _KioskAdvertisingWidgetState();
}

class _KioskAdvertisingWidgetState extends State<KioskAdvertisingWidget> {
  late KioskAdvertisingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskAdvertisingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!functions.isPrinterSelected(FFAppState().printerDevice)!) {
        _model.resDevice2Copy = await actions.scanPrinter(
          FFAppState().posMode,
        );
      }
      _model.connectdeviceCOPY23 = await actions.connectDevice(
        FFAppState().printerDevice,
        FFAppState().printerIndex,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<AdvertisementRecord>>(
      stream: queryAdvertisementRecord(
        parent: FFAppState().outletIdRef,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitFadingCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<AdvertisementRecord> kioskAdvertisingAdvertisementRecordList =
            snapshot.data!;

        return Title(
            title: 'KioskAdvertising',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: wrapWithModel(
                            model: _model.kioskHeaderModel,
                            updateCallback: () => safeSetState(() {}),
                            child: KioskHeaderWidget(),
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 25.0),
                                  child: Builder(
                                    builder: (context) {
                                      final kioskAdvertisingVar =
                                          kioskAdvertisingAdvertisementRecordList
                                              .map((e) => e)
                                              .toList();

                                      return Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.9,
                                        child: CarouselSlider.builder(
                                          itemCount: kioskAdvertisingVar.length,
                                          itemBuilder: (context,
                                              kioskAdvertisingVarIndex, _) {
                                            final kioskAdvertisingVarItem =
                                                kioskAdvertisingVar[
                                                    kioskAdvertisingVarIndex];
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  kioskAdvertisingVarItem
                                                      .imageUrl,
                                                  'https://images.unsplash.com/photo-1511920170033-f8396924c348?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxjb2ZmZWV8ZW58MHx8fHwxNzE0MTAxNTg5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                                ),
                                                width: 300.0,
                                                height: 200.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0,
                                                min(
                                                    1,
                                                    kioskAdvertisingVar.length -
                                                        1)),
                                            viewportFraction: 0.9,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.45,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 600),
                                            autoPlayInterval: Duration(
                                                milliseconds: (600 + 5000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (widget!.appsetting!.settingList
                                          .where((e) =>
                                              e.title == 'hideDineInScreen')
                                          .toList()
                                          .firstOrNull!
                                          .value) {
                                        FFAppState().orderType = 'DINE IN';
                                        FFAppState().delCharges = 0.0;
                                        safeSetState(() {});

                                        context.goNamed(
                                          'KioskBillScreen',
                                          queryParameters: {
                                            'doc': serializeParam(
                                              widget!.userDoc,
                                              ParamType.DocumentReference,
                                            ),
                                            'shiftdoc': serializeParam(
                                              widget!.shiftdoc,
                                              ParamType.JSON,
                                            ),
                                            'taxcollection': serializeParam(
                                              widget!.taxcollection,
                                              ParamType.Document,
                                              isList: true,
                                            ),
                                            'appsetting': serializeParam(
                                              widget!.appsetting,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'taxcollection':
                                                widget!.taxcollection,
                                            'appsetting': widget!.appsetting,
                                          },
                                        );
                                      } else {
                                        context.goNamed(
                                          'KioskDineParcel',
                                          queryParameters: {
                                            'userdoc': serializeParam(
                                              widget!.userDoc,
                                              ParamType.DocumentReference,
                                            ),
                                            'shiftdoc': serializeParam(
                                              widget!.shiftdoc,
                                              ParamType.JSON,
                                            ),
                                            'appSetting': serializeParam(
                                              widget!.appsetting,
                                              ParamType.Document,
                                            ),
                                            'taxcollection': serializeParam(
                                              widget!.taxcollection,
                                              ParamType.Document,
                                              isList: true,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'appSetting': widget!.appsetting,
                                            'taxcollection':
                                                widget!.taxcollection,
                                          },
                                        );
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '90zc4l3n' /* Go For Menu */,
                                    ),
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 10.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        width: 5.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
