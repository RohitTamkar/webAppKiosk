import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => LoadingScreenkiosknewWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => LoadingScreenkiosknewWidget(),
          routes: [
            FFRoute(
              name: 'welcomeScreen',
              path: 'welcomeScreen',
              builder: (context, params) => WelcomeScreenWidget(),
            ),
            FFRoute(
              name: 'StartScreen',
              path: 'startScreen',
              builder: (context, params) => StartScreenWidget(),
            ),
            FFRoute(
              name: 'welcomeScreenNew',
              path: 'welcomeScreenNew',
              builder: (context, params) => WelcomeScreenNewWidget(),
            ),
            FFRoute(
              name: 'printSettingkiosk',
              path: 'printSettingkiosk',
              builder: (context, params) => PrintSettingkioskWidget(),
            ),
            FFRoute(
              name: 'KioskPayment',
              path: 'kioskPayment',
              asyncParams: {
                'appsettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskPaymentWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                qrJson: params.getParam(
                  'qrJson',
                  ParamType.JSON,
                ),
                paytmOrderId: params.getParam(
                  'paytmOrderId',
                  ParamType.String,
                ),
                isPaytm: params.getParam(
                  'isPaytm',
                  ParamType.bool,
                ),
                appsettings: params.getParam(
                  'appsettings',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskCart',
              path: 'kioskCart',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCartWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'AboutUs',
              path: 'aboutUs',
              builder: (context, params) => AboutUsWidget(),
            ),
            FFRoute(
              name: 'KioskBillScreen',
              path: 'kioskBillScreen',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskBillScreenWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                billdetails: params.getParam(
                  'billdetails',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'INVOICE'],
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'responsePage',
              path: 'responsePage',
              asyncParams: {
                'doc': getDoc(['OUTLET', 'QR_TRANSACTIONS'],
                    QrTransactionsRecord.fromSnapshot),
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ResponsePageWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.Document,
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskWelcome',
              path: 'kioskWelcome',
              builder: (context, params) => KioskWelcomeWidget(),
            ),
            FFRoute(
              name: 'KioskDineParcel',
              path: 'kioskDineParcel',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskDineParcelWidget(
                userdoc: params.getParam(
                  'userdoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskAdvertising',
              path: 'kioskAdvertising',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskAdvertisingWidget(
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskSplashScreen',
              path: 'kioskSplashScreen',
              builder: (context, params) => KioskSplashScreenWidget(),
            ),
            FFRoute(
              name: 'loadingScreenkiosknew',
              path: 'loadingScreenkiosknew',
              builder: (context, params) => LoadingScreenkiosknewWidget(),
            ),
            FFRoute(
              name: 'KotOrderScreen',
              path: 'kotOrderScreen',
              builder: (context, params) => KotOrderScreenWidget(),
            ),
            FFRoute(
              name: 'TokenDisplay',
              path: 'tokenDisplay',
              builder: (context, params) => TokenDisplayWidget(),
            ),
            FFRoute(
              name: 'responseOrder',
              path: 'responseOrder',
              asyncParams: {
                'doc': getDoc(['OUTLET', 'QR_TRANSACTIONS'],
                    QrTransactionsRecord.fromSnapshot),
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => ResponseOrderWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.Document,
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskPaymentCopy',
              path: 'kioskPaymentCopy',
              builder: (context, params) => KioskPaymentCopyWidget(
                data: params.getParam(
                  'data',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskChoosePaymentMode',
              path: 'kioskChoosePaymentMode',
              asyncParams: {
                'appSettings': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskChoosePaymentModeWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appSettings: params.getParam(
                  'appSettings',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
                qrJson: params.getParam(
                  'qrJson',
                  ParamType.JSON,
                ),
                paytmOrderId: params.getParam(
                  'paytmOrderId',
                  ParamType.String,
                ),
                isPaytm: params.getParam(
                  'isPaytm',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'cashResponsePage',
              path: 'cashResponsePage',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcoollectipon':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => CashResponsePageWidget(
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcoollectipon: params.getParam<TaxMasterRecord>(
                  'taxcoollectipon',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'kioskCustomerInfo',
              path: 'kioskCustomerInfo',
              asyncParams: {
                'appSetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCustomerInfoWidget(
                userdoc: params.getParam(
                  'userdoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdoc: params.getParam(
                  'shiftdoc',
                  ParamType.JSON,
                ),
                appSetting: params.getParam(
                  'appSetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'KioskCartCopy',
              path: 'kioskCartCopy',
              asyncParams: {
                'appsetting': getDoc(
                    ['OUTLET', 'APP_SETTINGS'], AppSettingsRecord.fromSnapshot),
                'taxcollection':
                    getDocList(['TAX_MASTER'], TaxMasterRecord.fromSnapshot),
              },
              builder: (context, params) => KioskCartCopyWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['USER_PROFILE'],
                ),
                shiftdetails: params.getParam(
                  'shiftdetails',
                  ParamType.JSON,
                ),
                appsetting: params.getParam(
                  'appsetting',
                  ParamType.Document,
                ),
                taxcollection: params.getParam<TaxMasterRecord>(
                  'taxcollection',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
