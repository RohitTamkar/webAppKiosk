import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'kiosk_welcome_model.dart';
export 'kiosk_welcome_model.dart';

class KioskWelcomeWidget extends StatefulWidget {
  const KioskWelcomeWidget({super.key});

  @override
  State<KioskWelcomeWidget> createState() => _KioskWelcomeWidgetState();
}

class _KioskWelcomeWidgetState extends State<KioskWelcomeWidget> {
  late KioskWelcomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KioskWelcomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.hideAppbar();
      _model.docRes = await actions.getPlatformDetails(
        isWeb.toString(),
      );
      _model.platform = await actions.checkPlatform(
        isWeb.toString(),
      );
      _model.deiviceexistnew = await queryDeviceRecordOnce(
        queryBuilder: (deviceRecord) => deviceRecord.where(
          'deviceId',
          isEqualTo: getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString(),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.deiviceexistnew?.deviceId ==
          getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString()) {
      } else {
        var deviceRecordReference = DeviceRecord.collection.doc();
        await deviceRecordReference.set(createDeviceRecordData(
          createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
          deviceId: getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString(),
          active: false,
          brand: getJsonField(
            _model.docRes,
            r'''$.brand''',
          ).toString().toString(),
          manufacture: getJsonField(
            _model.docRes,
            r'''$.manufacturer''',
          ).toString().toString(),
          model: getJsonField(
            _model.docRes,
            r'''$.model''',
          ).toString().toString(),
          outletName: '',
          outletId: '',
          board: '',
          serial: getJsonField(
            _model.docRes,
            r'''$.deviceId''',
          ).toString().toString(),
          billingType: FFAppState().navigate,
        ));
        _model.refnew = DeviceRecord.getDocumentFromData(
            createDeviceRecordData(
              createdDate: getCurrentTimestamp.millisecondsSinceEpoch,
              deviceId: getJsonField(
                _model.docRes,
                r'''$.deviceId''',
              ).toString().toString(),
              active: false,
              brand: getJsonField(
                _model.docRes,
                r'''$.brand''',
              ).toString().toString(),
              manufacture: getJsonField(
                _model.docRes,
                r'''$.manufacturer''',
              ).toString().toString(),
              model: getJsonField(
                _model.docRes,
                r'''$.model''',
              ).toString().toString(),
              outletName: '',
              outletId: '',
              board: '',
              serial: getJsonField(
                _model.docRes,
                r'''$.deviceId''',
              ).toString().toString(),
              billingType: FFAppState().navigate,
            ),
            deviceRecordReference);

        await _model.refnew!.reference.update(createDeviceRecordData(
          id: _model.refnew?.reference.id,
        ));
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('Device Add Succefully!'),
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

      await Future.delayed(const Duration(milliseconds: 5000));

      context.pushNamed('KioskLogin');
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
        title: 'KioskWelcome',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.none,
                    image: Image.asset(
                      'assets/images/2149141371.jpg',
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 20.0,
                          sigmaY: 20.0,
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: MediaQuery.sizeOf(context).height * 0.85,
                          decoration: BoxDecoration(
                            color: Color(0x59000000),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 250.0, 50.0, 250.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 100.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.asset(
                                      'assets/images/Sensible_Connect_Logo_White.png',
                                      width: 150.0,
                                      height: 150.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'e7xczi7s' /* Welcome to */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displayLargeFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily),
                                        ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'thva74py' /* SENSIBLE */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 55.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily),
                                      ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '4yhi8kde' /* KIOSK */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 55.0,
                                        letterSpacing: 15.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displayLargeFamily),
                                      ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/threeArchedCircle-unscreen.gif',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
