import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/kiosk/kiosk_header/kiosk_header_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_choose_payment_mode_model.dart';
export 'kiosk_choose_payment_mode_model.dart';

class KioskChoosePaymentModeWidget extends StatefulWidget {
  const KioskChoosePaymentModeWidget({
    super.key,
    this.doc,
    this.shiftdetails,
    this.appSettings,
    this.taxcollection,
    this.qrJson,
    this.paytmOrderId,
    this.isPaytm,
  });

  final DocumentReference? doc;
  final dynamic shiftdetails;
  final AppSettingsRecord? appSettings;
  final List<TaxMasterRecord>? taxcollection;
  final dynamic qrJson;
  final String? paytmOrderId;
  final bool? isPaytm;

  @override
  State<KioskChoosePaymentModeWidget> createState() =>
      _KioskChoosePaymentModeWidgetState();
}

class _KioskChoosePaymentModeWidgetState
    extends State<KioskChoosePaymentModeWidget> with TickerProviderStateMixin {
  late KioskChoosePaymentModeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskChoosePaymentModeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.footer = await queryFooterRecordOnce(
        parent: FFAppState().outletIdRef,
        singleRecord: true,
      ).then((s) => s.firstOrNull);
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.35, 1.35),
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1500.0.ms,
            color: Color(0xFFFFDD42),
            begin: 0.0,
            end: 1.0,
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
        title: 'KioskChoosePaymentMode',
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
              backgroundColor: Color(0xFFF4ECE5),
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: AlignmentDirectional(0.0, -1.0),
                    image: Image.asset(
                      'assets/images/Top_img_3.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.kioskHeaderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: KioskHeaderWidget(),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 8.0, 25.0, 8.0),
                                  child: Icon(
                                    Icons.currency_rupee_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sw0ojh01' /* Choose Payment Type  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displayLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displayLargeFamily,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 20.0,
                                      letterSpacing: 5.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displayLargeFamily),
                                    ),
                              ),
                            ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideUpiPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().PayMode = 'UPI QR';
                                  safeSetState(() {});

                                  context.goNamed(
                                    'KioskPayment',
                                    queryParameters: {
                                      'doc': serializeParam(
                                        widget!.doc,
                                        ParamType.DocumentReference,
                                      ),
                                      'shiftdetails': serializeParam(
                                        widget!.shiftdetails,
                                        ParamType.JSON,
                                      ),
                                      'qrJson': serializeParam(
                                        widget!.qrJson,
                                        ParamType.JSON,
                                      ),
                                      'paytmOrderId': serializeParam(
                                        widget!.paytmOrderId,
                                        ParamType.String,
                                      ),
                                      'isPaytm': serializeParam(
                                        widget!.isPaytm,
                                        ParamType.bool,
                                      ),
                                      'appsettings': serializeParam(
                                        widget!.appSettings,
                                        ParamType.Document,
                                      ),
                                      'taxcollection': serializeParam(
                                        widget!.taxcollection,
                                        ParamType.Document,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'appsettings': widget!.appSettings,
                                      'taxcollection': widget!.taxcollection,
                                    },
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.15,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).info,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Color(0x26000000),
                                        offset: Offset(
                                          9.0,
                                          9.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Icon(
                                            Icons.qr_code_scanner,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            size: 50.0,
                                          ).animateOnPageLoad(animationsMap[
                                              'iconOnPageLoadAnimation1']!),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'el435bod' /* UPI Payment */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displayLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displayLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
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
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideUpiPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 25.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'bi488f0w' /* OR */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 30.0,
                                        letterSpacing: 5.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily),
                                      ),
                                ),
                              ),
                            if (!valueOrDefault<bool>(
                              widget!.appSettings?.settingList
                                  ?.where(
                                      (e) => e.title == 'hideCashPaymentMode')
                                  .toList()
                                  ?.firstOrNull
                                  ?.value,
                              false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().PayMode = 'CASH';
                                    safeSetState(() {});

                                    context.goNamed(
                                      'cashResponsePage',
                                      queryParameters: {
                                        'shiftdetails': serializeParam(
                                          widget!.shiftdetails,
                                          ParamType.JSON,
                                        ),
                                        'appsetting': serializeParam(
                                          widget!.appSettings,
                                          ParamType.Document,
                                        ),
                                        'taxcoollectipon': serializeParam(
                                          widget!.taxcollection,
                                          ParamType.Document,
                                          isList: true,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'appsetting': widget!.appSettings,
                                        'taxcoollectipon':
                                            widget!.taxcollection,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.6,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.15,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).info,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 12.0,
                                          color: Color(0x27000000),
                                          offset: Offset(
                                            9.0,
                                            9.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(30.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons
                                                    .moneyBillWaveAlt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                size: 45.0,
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconOnPageLoadAnimation2']!),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ppahxy75' /* Pay at Counter */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .displayLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
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
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
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
          ),
        ));
  }
}
