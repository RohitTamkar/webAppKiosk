import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_bill_screen_model.dart';
export 'kiosk_bill_screen_model.dart';

class KioskBillScreenWidget extends StatefulWidget {
  const KioskBillScreenWidget({
    super.key,
    this.billdetails,
    this.appsetting,
    this.taxcollection,
  });

  final DocumentReference? billdetails;
  final AppSettingsRecord? appsetting;
  final List<TaxMasterRecord>? taxcollection;

  @override
  State<KioskBillScreenWidget> createState() => _KioskBillScreenWidgetState();
}

class _KioskBillScreenWidgetState extends State<KioskBillScreenWidget>
    with TickerProviderStateMixin {
  late KioskBillScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskBillScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pressed = false;
      safeSetState(() {});
      _model.prodoc = await queryProductRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (productRecord) => productRecord
            .where(
              'isDeleted',
              isEqualTo: false,
            )
            .where(
              'isEnable',
              isEqualTo: true,
            ),
      );
      _model.categorydoc = await queryCategoryRecordOnce(
        parent: FFAppState().outletIdRef,
        queryBuilder: (categoryRecord) => categoryRecord.orderBy('categoryNo'),
      );
      FFAppState().categoryColor = 'ALL';
      safeSetState(() {});
      _model.productDoc = _model.prodoc!.toList().cast<ProductRecord>();
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 510.0.ms,
            begin: Offset(0.0, 47.0),
            end: Offset(0.0, 5.0),
          ),
        ],
      ),
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

    return Title(
        title: 'KioskBillScreen',
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
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: AlignmentDirectional(0.0, -1.0),
                          image: Image.asset(
                            'assets/images/Top_img_4.png',
                          ).image,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (false)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: wrapWithModel(
                                            model: _model.kioskHeaderModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: KioskHeaderWidget(),
                                          ),
                                        ),
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  7.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '9j0g1ck5' /* Welcome to */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        FFAppState().outletName,
                                                        'THE MAGIC ICE CREAM FACTORY',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      if (FFAppState()
                                                              .orderType ==
                                                          'DINE IN')
                                                        FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'uhllvaea' /* Dine In */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .dinner_dining_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 35.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0x00B6001A),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      if (FFAppState()
                                                              .orderType ==
                                                          'PARCEL')
                                                        FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '6gjpa29u' /* Parcel */,
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .takeout_dining_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 35.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0x00B6001A),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 10.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.replay,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model.appsettingresfresh =
                                                          await queryAppSettingsRecordOnce(
                                                        parent: FFAppState()
                                                            .outletIdRef,
                                                        queryBuilder:
                                                            (appSettingsRecord) =>
                                                                appSettingsRecord
                                                                    .where(
                                                          'deviceId',
                                                          isEqualTo:
                                                              FFAppState().dId,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);

                                                      context.pushNamed(
                                                        'KioskBillScreen',
                                                        queryParameters: {
                                                          'appsetting':
                                                              serializeParam(
                                                            _model
                                                                .appsettingresfresh,
                                                            ParamType.Document,
                                                          ),
                                                          'taxcollection':
                                                              serializeParam(
                                                            widget!
                                                                .taxcollection,
                                                            ParamType.Document,
                                                            isList: true,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'appsetting': _model
                                                              .appsettingresfresh,
                                                          'taxcollection':
                                                              widget!
                                                                  .taxcollection,
                                                        },
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderRadius: 10.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.info_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      context
                                                          .pushNamed('AboutUs');
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().categoryColor =
                                                      'ALL';
                                                  safeSetState(() {});
                                                  _model.productDoc = _model
                                                      .prodoc!
                                                      .toList()
                                                      .cast<ProductRecord>();
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 65.0,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .categoryColor ==
                                                              'ALL'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor2,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '3zt1lnqa' /* ALL */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final listcat = _model
                                                            .categorydoc
                                                            ?.where((e) =>
                                                                e.isDeleted ==
                                                                false)
                                                            .toList()
                                                            ?.sortedList(
                                                                keyOf: (e) =>
                                                                    valueOrDefault<
                                                                            bool>(
                                                                      widget!
                                                                          .appsetting
                                                                          ?.settingList
                                                                          ?.where((e) =>
                                                                              e.title ==
                                                                              'sortCategoryByCode')
                                                                          .toList()
                                                                          ?.firstOrNull
                                                                          ?.value,
                                                                      false,
                                                                    )
                                                                        ? e.code
                                                                            .toString()
                                                                        : e.name,
                                                                desc: false)
                                                            ?.toList() ??
                                                        [];

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: listcat.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(width: 10.0),
                                                      itemBuilder: (context,
                                                          listcatIndex) {
                                                        final listcatItem =
                                                            listcat[
                                                                listcatIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .categoryColor =
                                                                listcatItem.id;
                                                            safeSetState(() {});
                                                            _model.productDoc = _model
                                                                .prodoc!
                                                                .where((e) =>
                                                                    e.category ==
                                                                    listcatItem
                                                                        .id)
                                                                .toList()
                                                                .cast<
                                                                    ProductRecord>();
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.23,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: listcatItem
                                                                            .id ==
                                                                        FFAppState()
                                                                            .categoryColor
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor2,
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          listcatItem
                                                                              .catImageUrl,
                                                                          'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
                                                                        ),
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            120.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              listcatItem.name,
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).displayMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).displayMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displayMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 18,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Builder(
                                builder: (context) {
                                  final kioskBillScreenVar = _model.productDoc
                                      .where((e) => e.isEnable)
                                      .toList()
                                      .sortedList(
                                          keyOf: (e) => valueOrDefault<bool>(
                                                widget!.appsetting?.settingList
                                                    ?.where((e) =>
                                                        e.title ==
                                                        'sortProductByCode')
                                                    .toList()
                                                    ?.firstOrNull
                                                    ?.value,
                                                false,
                                              )
                                                  ? e.code.toString()
                                                  : e.name,
                                          desc: false)
                                      .toList();

                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12.0,
                                      mainAxisSpacing: 20.0,
                                      childAspectRatio: 0.8,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount: kioskBillScreenVar.length,
                                    itemBuilder:
                                        (context, kioskBillScreenVarIndex) {
                                      final kioskBillScreenVarItem =
                                          kioskBillScreenVar[
                                              kioskBillScreenVarIndex];
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Container(
                                          width: 80.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 5.0,
                                                color: Color(0x0C000000),
                                                offset: Offset(
                                                  5.0,
                                                  5.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color: Color(0xFFE7E6EF),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    kioskBillScreenVarItem
                                                        .imageUrl,
                                                    'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
                                                  ),
                                                  width: double.infinity,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0x000D0801),
                                                      Color(0x000D0801),
                                                      Color(0x980D0801),
                                                      Color(0xDA0D0801),
                                                      Color(0xFF110B02)
                                                    ],
                                                    stops: [
                                                      0.0,
                                                      0.4,
                                                      0.6,
                                                      0.8,
                                                      1.0
                                                    ],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        flex: 6,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.returnTitlecase(
                                                                  kioskBillScreenVarItem
                                                                      .name),
                                                              'null',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  color: Color(
                                                                      0xFFF7F3F3),
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            flex: 7,
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'zhqfsh59' /* ₹  */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          color:
                                                                              Color(0xFFBEE2FF),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      kioskBillScreenVarItem
                                                                          .sellingPrice
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          color:
                                                                              Color(0xFFBEE2FF),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily,
                                                                      color: Color(
                                                                          0xFF594A38),
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 13,
                                                            child: Stack(
                                                              children: [
                                                                if (!FFAppState()
                                                                    .cartItem
                                                                    .contains(
                                                                        kioskBillScreenVarItem
                                                                            .reference))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      FFAppState()
                                                                              .qty =
                                                                          1.0;
                                                                      safeSetState(
                                                                          () {});
                                                                      if (kioskBillScreenVarItem
                                                                          .stockable) {
                                                                        if (kioskBillScreenVarItem.currentStock >
                                                                            0) {
                                                                          if (FFAppState().holdBillCount ==
                                                                              0) {
                                                                            FFAppState().holdBillCount =
                                                                                FFAppState().holdBillCount + 1;
                                                                            FFAppState().addToAllBillsList(functions.generateBillDetailsJson(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                'CASH',
                                                                                0.0,
                                                                                0.0,
                                                                                FFAppState().billAmt,
                                                                                0.0,
                                                                                FFAppState().finalAmt,
                                                                                '0',
                                                                                FFAppState().itemCartList.toList(),
                                                                                FFAppState().holdBillCount));
                                                                            FFAppState().selBill =
                                                                                1;
                                                                          }
                                                                          _model.result1 =
                                                                              await actions.addToHoldListkioskGst(
                                                                            kioskBillScreenVarItem,
                                                                            valueOrDefault<int>(
                                                                              FFAppState().selBill,
                                                                              1,
                                                                            ),
                                                                            widget!.taxcollection!.toList(),
                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                              false,
                                                                            )),
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.resp2 =
                                                                              await actions.calSubTotalForHoldListkiosk(
                                                                            valueOrDefault<String>(
                                                                              FFAppState().selBill.toString(),
                                                                              '1',
                                                                            ),
                                                                            _model.result1!.toList(),
                                                                            functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                              widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                              false,
                                                                            )),
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          _model.res3 =
                                                                              await actions.calBillAmt(
                                                                            FFAppState().disAmt,
                                                                            FFAppState().delCharges,
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          FFAppState()
                                                                              .addToCartItem(kioskBillScreenVarItem.reference);
                                                                          safeSetState(
                                                                              () {});
                                                                          if (kioskBillScreenVarItem
                                                                              .stockable) {
                                                                            if (kioskBillScreenVarItem.currentStock <=
                                                                                valueOrDefault<int>(
                                                                                  getJsonField(
                                                                                    functions
                                                                                        .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                        .where((e) =>
                                                                                            kioskBillScreenVarItem.id ==
                                                                                            valueOrDefault<String>(
                                                                                              getJsonField(
                                                                                                e,
                                                                                                r'''$.id''',
                                                                                              )?.toString(),
                                                                                              '0',
                                                                                            ))
                                                                                        .toList()
                                                                                        .firstOrNull,
                                                                                    r'''$.quantity''',
                                                                                  ),
                                                                                  0,
                                                                                )) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('Item  Out Of Stock.'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                              return;
                                                                            }
                                                                          }
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                content: Text('Item  Out Of Stock.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        }
                                                                      } else {
                                                                        if (FFAppState().holdBillCount ==
                                                                            0) {
                                                                          FFAppState().holdBillCount =
                                                                              FFAppState().holdBillCount + 1;
                                                                          FFAppState().addToAllBillsList(functions.generateBillDetailsJson(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              'CASH',
                                                                              0.0,
                                                                              0.0,
                                                                              FFAppState().billAmt,
                                                                              0.0,
                                                                              FFAppState().finalAmt,
                                                                              '0',
                                                                              FFAppState().itemCartList.toList(),
                                                                              FFAppState().holdBillCount));
                                                                          FFAppState().selBill =
                                                                              1;
                                                                        }
                                                                        _model.result4 =
                                                                            await actions.addToHoldListkioskGst(
                                                                          kioskBillScreenVarItem,
                                                                          valueOrDefault<
                                                                              int>(
                                                                            FFAppState().selBill,
                                                                            1,
                                                                          ),
                                                                          widget!
                                                                              .taxcollection!
                                                                              .toList(),
                                                                          functions
                                                                              .enabletaxinclusive(valueOrDefault<bool>(
                                                                            widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                            false,
                                                                          )),
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.res5 =
                                                                            await actions.calSubTotalForHoldListkiosk(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            FFAppState().selBill.toString(),
                                                                            '1',
                                                                          ),
                                                                          _model
                                                                              .result4!
                                                                              .toList(),
                                                                          functions
                                                                              .enabletaxinclusive(valueOrDefault<bool>(
                                                                            widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                            false,
                                                                          )),
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        _model.res6 =
                                                                            await actions.calBillAmt(
                                                                          FFAppState()
                                                                              .disAmt,
                                                                          FFAppState()
                                                                              .delCharges,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        FFAppState()
                                                                            .addToCartItem(kioskBillScreenVarItem.reference);
                                                                        safeSetState(
                                                                            () {});
                                                                      }

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFC29494),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                          topLeft:
                                                                              Radius.circular(12.0),
                                                                          topRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'z8ike2kl' /* Add */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                color: Color(0xFFD70120),
                                                                                fontSize: 10.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (FFAppState()
                                                                    .cartItem
                                                                    .contains(
                                                                        kioskBillScreenVarItem
                                                                            .reference))
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFD4F995),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(12.0),
                                                                        bottomRight:
                                                                            Radius.circular(12.0),
                                                                        topLeft:
                                                                            Radius.circular(12.0),
                                                                        topRight:
                                                                            Radius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              5,
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                12.0,
                                                                            buttonSize:
                                                                                30.0,
                                                                            fillColor:
                                                                                Color(0xFF8AC328),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.remove_rounded,
                                                                              color: Colors.black,
                                                                              size: 12.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().qty <
                                                                                  getJsonField(
                                                                                    functions
                                                                                        .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                        .where((e) =>
                                                                                            kioskBillScreenVarItem.id ==
                                                                                            valueOrDefault<String>(
                                                                                              getJsonField(
                                                                                                e,
                                                                                                r'''$.id''',
                                                                                              )?.toString(),
                                                                                              '0',
                                                                                            ))
                                                                                        .toList()
                                                                                        .firstOrNull,
                                                                                    r'''$.quantity''',
                                                                                  )) {
                                                                                _model.resultkiosk = await actions.reduceQuantityHoldListkiosk(
                                                                                  functions
                                                                                      .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                      .where((e) =>
                                                                                          kioskBillScreenVarItem.id ==
                                                                                          valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            )?.toString(),
                                                                                            '0',
                                                                                          ))
                                                                                      .toList()
                                                                                      .firstOrNull!,
                                                                                  FFAppState().selBill,
                                                                                  widget!.taxcollection!.toList(),
                                                                                  functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                    widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                    false,
                                                                                  )),
                                                                                );
                                                                                _model.res2345 = await actions.calSubTotalForHoldListkiosk(
                                                                                  valueOrDefault<String>(
                                                                                    FFAppState().selBill.toString(),
                                                                                    '1',
                                                                                  ),
                                                                                  FFAppState().allBillsList.toList(),
                                                                                  functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                    widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                    false,
                                                                                  )),
                                                                                );
                                                                                _model.reu34 = await actions.calBillAmt(
                                                                                  valueOrDefault<double>(
                                                                                    FFAppState().disAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  FFAppState().delCharges,
                                                                                );
                                                                              } else {
                                                                                _model.res20Copy = await actions.removeHoldListItem(
                                                                                  functions
                                                                                      .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                      .where((e) =>
                                                                                          kioskBillScreenVarItem.id ==
                                                                                          valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              e,
                                                                                              r'''$.id''',
                                                                                            )?.toString(),
                                                                                            '0',
                                                                                          ))
                                                                                      .toList()
                                                                                      .firstOrNull!,
                                                                                  FFAppState().selBill,
                                                                                );
                                                                                _model.res23456 = await actions.calSubTotalForHoldListkiosk(
                                                                                  valueOrDefault<String>(
                                                                                    FFAppState().selBill.toString(),
                                                                                    '1',
                                                                                  ),
                                                                                  FFAppState().allBillsList.toList(),
                                                                                  functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                    widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                    false,
                                                                                  )),
                                                                                );
                                                                                _model.reuslt22Copy = await actions.calBillAmt(
                                                                                  valueOrDefault<double>(
                                                                                    FFAppState().disAmt,
                                                                                    0.0,
                                                                                  ),
                                                                                  valueOrDefault<double>(
                                                                                    FFAppState().delCharges,
                                                                                    0.0,
                                                                                  ),
                                                                                );
                                                                                FFAppState().removeFromCartItem(kioskBillScreenVarItem.reference);
                                                                                safeSetState(() {});
                                                                              }

                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              functions.loadDefaultList(FFAppState().selBill, FFAppState().allBillsList.toList(), kioskBillScreenVarItem.reference.id).length > 0
                                                                                  ? valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        functions
                                                                                            .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                            .where((e) =>
                                                                                                kioskBillScreenVarItem.id ==
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  )?.toString(),
                                                                                                  '0',
                                                                                                ))
                                                                                            .toList()
                                                                                            .firstOrNull,
                                                                                        r'''$.quantity''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    )
                                                                                  : '0',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                    color: Colors.black,
                                                                                    fontSize: 10.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              5,
                                                                          child:
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                12.0,
                                                                            buttonSize:
                                                                                30.0,
                                                                            fillColor:
                                                                                Color(0xFF8AC328),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.add,
                                                                              color: Colors.black,
                                                                              size: 12.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              var _shouldSetState = false;
                                                                              if (kioskBillScreenVarItem.stockable) {
                                                                                if (kioskBillScreenVarItem.currentStock <=
                                                                                    functions.doubleToInt(valueOrDefault<double>(
                                                                                      getJsonField(
                                                                                        functions
                                                                                            .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                            .where((e) =>
                                                                                                kioskBillScreenVarItem.id ==
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    e,
                                                                                                    r'''$.id''',
                                                                                                  )?.toString(),
                                                                                                  '0',
                                                                                                ))
                                                                                            .toList()
                                                                                            .firstOrNull,
                                                                                        r'''$.quantity''',
                                                                                      ),
                                                                                      0.0,
                                                                                    ))!) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        content: Text('Item  Out Of Stock.'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                              }
                                                                              _model.kioskresult = await actions.plusQuantityHoldListkiosk(
                                                                                functions
                                                                                    .filterBillList(FFAppState().selBill, FFAppState().allBillsList.toList())
                                                                                    .where((e) =>
                                                                                        kioskBillScreenVarItem.id ==
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            e,
                                                                                            r'''$.id''',
                                                                                          )?.toString(),
                                                                                          '0',
                                                                                        ))
                                                                                    .toList()
                                                                                    .firstOrNull!,
                                                                                FFAppState().selBill,
                                                                                widget!.taxcollection!.toList(),
                                                                                functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                  widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                  false,
                                                                                )),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.res234 = await actions.calSubTotalForHoldListkiosk(
                                                                                valueOrDefault<String>(
                                                                                  FFAppState().selBill.toString(),
                                                                                  '1',
                                                                                ),
                                                                                FFAppState().allBillsList.toList(),
                                                                                functions.enabletaxinclusive(valueOrDefault<bool>(
                                                                                  widget!.appsetting?.settingList?.where((e) => e.title == 'enableInclusiveTax').toList()?.firstOrNull?.value,
                                                                                  false,
                                                                                )),
                                                                              );
                                                                              _shouldSetState = true;
                                                                              _model.reuslt12 = await actions.calBillAmt(
                                                                                valueOrDefault<double>(
                                                                                  FFAppState().disAmt,
                                                                                  0.0,
                                                                                ),
                                                                                FFAppState().delCharges,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'containerOnPageLoadAnimation1']!),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (functions
                      .filterBillList(FFAppState().selBill,
                          FFAppState().allBillsList.toList())
                      .isNotEmpty)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD1DFFF),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              content: Text(
                                                  'Are You Sure You Want To Cancel This Order ?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Confirm'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  await actions.removeFromAllBillList(
                                    FFAppState().selBill,
                                  );
                                  await actions.clearValue();
                                  FFAppState().subTotal = 0.0;
                                  FFAppState().update(() {});
                                  FFAppState().finalAmt = 0.0;
                                  FFAppState().billAmt = 0.0;
                                  FFAppState().count = FFAppState().count;
                                  FFAppState().cartItem = [];
                                  FFAppState().isBillPrinted = true;
                                  FFAppState().noOfItems = 0;
                                  FFAppState().update(() {});
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '2wg5nblz' /* Cancel */,
                              ),
                              icon: Icon(
                                Icons.close_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 95.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x00FFAC47),
                                textStyle: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displayMediumFamily,
                                      color: Color(0xFFD70120),
                                      fontSize: 5.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displayMediumFamily),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.shopping_cart_rounded,
                                          color: Colors.black,
                                          size: 17.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          valueOrDefault<String>(
                                            FFAppState().noOfItems.toString(),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeFamily),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (FFAppState().delCharges > 0.0)
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'lffvqew8' /* Parcel : ₹  */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .displayLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayLargeFamily,
                                                color: Colors.black,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displayLargeFamily),
                                              ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            (FFAppState().delCharges *
                                                    FFAppState().noOfItems)
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily,
                                                  color: Colors.black,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displayLargeFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'g1lljtgj' /* ₹  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displayMediumFamily,
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displayMediumFamily),
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        FFAppState().finalAmt.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displayMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displayMediumFamily,
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displayMediumFamily),
                                          ),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.pressed = true;
                                safeSetState(() {});
                                if (functions
                                    .filterBillList(FFAppState().selBill,
                                        FFAppState().allBillsList.toList())
                                    .isNotEmpty) {
                                  FFAppState().isBillPrinted = false;
                                  safeSetState(() {});
                                  if (!(FFAppState().orderType != null &&
                                      FFAppState().orderType != '')) {
                                    FFAppState().orderType = 'DINE IN';
                                    safeSetState(() {});
                                  }

                                  context.goNamed(
                                    'KioskCart',
                                    queryParameters: {
                                      'shiftdetails': serializeParam(
                                        FFAppState().shiftDetailsNEw,
                                        ParamType.JSON,
                                      ),
                                      'appsetting': serializeParam(
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
                                      'appsetting': widget!.appsetting,
                                      'taxcollection': widget!.taxcollection,
                                    },
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: Text(
                                            'Choose Menu For Proceed Order !'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '7t41axvs' /* Proceed Order */,
                              ),
                              icon: Icon(
                                Icons.chevron_right,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
                                textStyle: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displayMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displayMediumFamily),
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                            ),
                            if (false)
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.phonePedata = await PhonePeQRCall.call(
                                    merchantId: 'SENSIBLEQRTESTUAT',
                                    transactionId: getCurrentTimestamp
                                        .millisecondsSinceEpoch
                                        .toString(),
                                    merchantOrderId: FFAppState().paytmOrderId,
                                    amount: functions
                                        .toDecimal(FFAppState().finalAmt),
                                    storeId: FFAppState().userdoc?.id,
                                    expiresIn: 1800,
                                  );

                                  if ((_model.phonePedata?.succeeded ?? true)) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text(getJsonField(
                                            (_model.phonePedata?.jsonBody ??
                                                ''),
                                            r'''$''',
                                          ).toString()),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );

                                    context.pushNamed(
                                      'KioskPaymentCopy',
                                      queryParameters: {
                                        'data': serializeParam(
                                          getJsonField(
                                            (_model.phonePedata?.jsonBody ??
                                                ''),
                                            r'''$.data.qrString''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'f5wun5so' /* PhonePe */,
                                ),
                                options: FFButtonOptions(
                                  height: 80.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
