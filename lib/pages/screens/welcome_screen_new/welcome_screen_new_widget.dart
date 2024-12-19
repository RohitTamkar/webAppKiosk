import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shake/shake.dart';
import 'welcome_screen_new_model.dart';
export 'welcome_screen_new_model.dart';

class WelcomeScreenNewWidget extends StatefulWidget {
  const WelcomeScreenNewWidget({super.key});

  @override
  State<WelcomeScreenNewWidget> createState() => _WelcomeScreenNewWidgetState();
}

class _WelcomeScreenNewWidgetState extends State<WelcomeScreenNewWidget>
    with TickerProviderStateMixin {
  late WelcomeScreenNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ShakeDetector shakeDetector;
  var shakeActionInProgress = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WelcomeScreenNewModel());

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
          isEqualTo: valueOrDefault<String>(
            getJsonField(
              _model.docRes,
              r'''$.deviceId''',
            )?.toString()?.toString(),
            'null',
          ),
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
          serial: FFAppState().dId,
          branch: '',
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
              serial: FFAppState().dId,
              branch: '',
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

      if (FFAppState().targetPlatform == 'android') {}
    });

    // On shake action.
    shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () async {
        if (shakeActionInProgress) {
          return;
        }
        shakeActionInProgress = true;
        try {} finally {
          shakeActionInProgress = false;
        }
      },
      shakeThresholdGravity: 1.5,
    );

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 1000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    shakeDetector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'welcomeScreenNew',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF1E2429),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primaryBtnText,
                  FlutterFlowTheme.of(context).error
                ],
                stops: [1.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Sensible_Connect_Logo_2.png',
                  height: 180.0,
                  fit: BoxFit.contain,
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ));
  }
}
