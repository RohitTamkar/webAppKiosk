import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'kn', 'mr', 'ta'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? knText = '',
    String? mrText = '',
    String? taText = '',
  }) =>
      [enText, hiText, knText, mrText, taText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // StartScreen
  {
    'f8cmpc45': {
      'en': 'Kiosk',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '31u7rrkq': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // printSettingkiosk
  {
    'nxg0pggs': {
      'en': 'Setting',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wuyvi26h': {
      'en': 'Ethernet Printing',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'sghuzjbp': {
      'en': 'port...',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '6ip8565z': {
      'en': 'Port',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pzdg0xhg': {
      'en': '9100',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7p22bixm': {
      'en': 'IP ADDRESS ...',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xphxso41': {
      'en': '192.168.0.100',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ayno1lel': {
      'en': 'Save',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'izmglg2h': {
      'en': 'Paper Size',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ro1vrnjk': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '1liauibr': {
      'en': 'Select Paper Size...',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0si4jcby': {
      'en': 'Printer Mode',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'y5stenaq': {
      'en': 'Option 1',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'rf5i3neo': {
      'en': 'Select printer mode',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'x0d9t6ae': {
      'en': 'Available Device',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'lcnle4dd': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskPayment
  {
    '660ct8y0': {
      'en': 'Payment',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'zok72012': {
      'en': 'Cancel Order !',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '3kde9mj8': {
      'en': 'Dine In',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '82k7x89c': {
      'en': 'Parcel',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'f8s34d62': {
      'en': 'SCAN & PAY WITH ANY UPI',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'te4gx51s': {
      'en': 'Grand Total :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xgvl91jj': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'drkf5k2s': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskCart
  {
    '770ul0ha': {
      'en': 'Confirm Your Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'm630vqg2': {
      'en': 'DINE IN',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '9hqpozct': {
      'en': 'PARCEL',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'vi0q6yhk': {
      'en': '₹  ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'tz46iv7q': {
      'en': 'Sub Total',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'fk7ffxym': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    's9g1enft': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '9dk0mden': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'sq4xgrw1': {
      'en': 'Proceed to Pay',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'le8dqakl': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // AboutUs
  {
    '68087x3c': {
      'en': 'Sensible Connect Solution',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'sf3dvh6y': {
      'en': 'About Us',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0n0cohzo': {
      'en': 'Terms And Conditions',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '6cxebvsj': {
      'en': 'Contact Us',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'hz3o56ow': {
      'en': 'Cancellation and Refund Policy ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'bv6op3ws': {
      'en': 'Shipping and Delivery Policy',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'aq2otstn': {
      'en': 'Privacy Policy',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '6gqhm43n': {
      'en': '@copyright reserved ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    't8hzxsqd': {
      'en': 'SENSIBLE CONNECT SOLUTIONS PRIVATE LIMITED ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '28jmmi2s': {
      'en': '2024 All rights reserved',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'zsaxygn9': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskBillScreen
  {
    '9j0g1ck5': {
      'en': 'Welcome to',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'uhllvaea': {
      'en': 'Dine In',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '6gjpa29u': {
      'en': 'Parcel',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '3zt1lnqa': {
      'en': 'ALL',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'zhqfsh59': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'z8ike2kl': {
      'en': 'Add',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2wg5nblz': {
      'en': 'Cancel',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'g1lljtgj': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7t41axvs': {
      'en': 'Proceed Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'f5wun5so': {
      'en': 'PhonePe',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '60w0wty3': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // responsePage
  {
    'y4rnysxj': {
      'en': 'Thank You !',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'e8xv42wg': {
      'en': 'Show Below Token No To Collect Your Order At Counter',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'snuv9cux': {
      'en': 'Receipt ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '33p1y43u': {
      'en': 'Payment \nSuccessful',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0av9brxy': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskWelcome
  {
    'e7xczi7s': {
      'en': 'Welcome to',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'thva74py': {
      'en': 'SENSIBLE',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4yhi8kde': {
      'en': 'KIOSK',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'oo7qlget': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskDineParcel
  {
    '0r4e1rg5': {
      'en': 'Choose Order Type ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'n96qt2ty': {
      'en': 'Dine In',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'kbrkg9nt': {
      'en': 'Parcel',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'c38a4t9i': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskAdvertising
  {
    '90zc4l3n': {
      'en': 'Go For Menu',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'isbdfdrr': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // loadingScreenkiosknew
  {
    'qbvs5rrx': {
      'en': 'SENSIBLE',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'laf4ajsw': {
      'en': 'CONNECT',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ck3nd8pe': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KotOrderScreen
  {
    'kbd7anmd': {
      'en': 'KOT Management',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'gfe5dybr': {
      'en': 'Online',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'an9msmza': {
      'en': 'Token No. : ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'jzhjl7xx': {
      'en': 'Order Picked Up',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'bgqcvj6q': {
      'en': 'Order Ready',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'u9sgi676': {
      'en': 'Delivered',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'aht0nfdt': {
      'en': 'Time : ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    's7au2r85': {
      'en': '01.34',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'n62jaani': {
      'en': ' min.',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2lvb8z2d': {
      'en': 'Bill Report',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0u0g1blp': {
      'en': 'SR. NO',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7ce6iv0z': {
      'en': 'BILL NO',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pni7uq91': {
      'en': 'DATE',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ut8dp4h1': {
      'en': 'NET AMOUNT',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2wliirwz': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // TokenDisplay
  {
    'ukecvpfy': {
      'en': 'Token Display System',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '1ya43juu': {
      'en': 'Online',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'i2rs9rwh': {
      'en': 'Preparing your Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '1yycbyk8': {
      'en': 'Ready to Collect',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'a93asvfn': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // responseOrder
  {
    'vktoj9tj': {
      'en': 'Thank you !',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'atni9g2j': {
      'en': 'Click here to continue',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'gadymulg': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskPaymentCopy
  {
    '4in5uw1r': {
      'en': 'Payment',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4a5ktxja': {
      'en': 'Cancel Order !',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4rgqiiko': {
      'en': 'SCAN & PAY WITH ANY UPI',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4xipr5hf': {
      'en': 'Grand Total :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'kehavzy0': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'jkqn1e9c': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskChoosePaymentMode
  {
    'sw0ojh01': {
      'en': 'Choose Payment Type ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'el435bod': {
      'en': 'UPI Payment',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'bi488f0w': {
      'en': 'OR',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ppahxy75': {
      'en': 'Pay at Counter',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'of3dvu80': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // cashResponsePage
  {
    'le02ktpk': {
      'en': 'Thank You !',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'vb43iai8': {
      'en': 'If bill is not printed click here to print again !',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wb7wnmgn': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // kioskCustomerInfo
  {
    'kozhgkn3': {
      'en': 'Enter Your Mobile Number',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'or522779': {
      'en': 'Mobile Number',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0j16qwmj': {
      'en': '+91 ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'hs82d2e1': {
      'en': 'Mobile No',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'fd37c86v': {
      'en': 'Enter Mobile Number',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'sh145ohz': {
      'en': 'Atleast 10 digit requird ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wq8dq12b': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'qo13s9uw': {
      'en': 'Skip for Now',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'e80b6s8u': {
      'en': 'Pick Your Products',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '90zv2vkg': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskCartCopy
  {
    'ewvj6nhv': {
      'en': 'Confirm Your Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'hua4ippd': {
      'en': 'DINE IN',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'd18ex2ub': {
      'en': 'PARCEL',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '26nqfoq2': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'gn1roys9': {
      'en': 'Sub Total :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'az87cq6x': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '5cm6w7qq': {
      'en': 'Proceed to Razorpay for payment',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'tga423x2': {
      'en': 'Cancel Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7kweka5l': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '9l6la5w7': {
      'en': 'Proceed to Payment',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'vpilw820': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // OutletDetailsHeader
  {
    'dk8fulps': {
      'en': 'Outlet Name',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ywji1i04': {
      'en': 'Branch',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'd4dfhc6a': {
      'en': 'User : ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ayrj79xx': {
      'en': 'Rohit T',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wiutyf8v': {
      'en': 'Admin',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // SelectionOption
  {
    'mebznz4i': {
      'en': 'TODAY',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2km3ra30': {
      'en': 'YESTERDAY',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'y5iz21n1': {
      'en': 'THIS MONTH',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '598lcuc6': {
      'en': 'LAST MONTH',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // Header
  {
    'xnkwbwui': {
      'en': 'Admin',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // ProductSearch
  {
    'jp6tn6am': {
      'en': 'Search Product',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // RejectOrderComment
  {
    'voqpg7vl': {
      'en': 'Comment',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'zldil85q': {
      'en': ' Comment here...',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'bj6s2jsn': {
      'en': 'Reject Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // transactionStatus
  {
    '1mz7d1fs': {
      'en': 'Receipt ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '5ydnc68n': {
      'en': 'Payment \nSuccessful',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'fe19kwg5': {
      'en': 'Redirects Automatically',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // transactionStatusFailed
  {
    '0qqtyn77': {
      'en': 'Receipt',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'uo94negs': {
      'en': 'Payment Failed',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'jp7p7j79': {
      'en': 'Redirects automaticaly',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // transactionStatusPending
  {
    'tgkxu3e9': {
      'en': 'Receipt',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pnmy6wlj': {
      'en': 'Payment Pending',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'a3sev9uo': {
      'en': 'Redirects automaticaly',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // KioskHeader
  {
    'vfk9s8di': {
      'en': 'Version : ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // cashConfirmOrder
  {
    '6jvdyqvg': {
      'en': 'Receipt ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '856hsbad': {
      'en': 'Order Placed\nSuccessfully.',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'em078l4s': {
      'en': 'Please Pay At Counter..',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0gqlcefu': {
      'en': 'Redirects Automatically',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // Sendemail
  {
    'bmdawgri': {
      'en': 'Confirm Your Email Id',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'bn9yxiad': {
      'en': 'Add  Email  Here...',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'y9voc0z5': {
      'en': 'Confirm',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // Miscellaneous
  {
    'c0tsq8sj': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wv1c8fmf': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'tc91fdvj': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'z7zmgtda': {
      'en': 'Need permission',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '95a63nkx': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wm52ljcc': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'jtrctbqe': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '9lnq3780': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'hm6bus30': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '81bis4vx': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xqwif6mn': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pedwut1c': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'i0c5zp0e': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '8ec82pcx': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4wp90auj': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'v33u4snv': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '77crnd83': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'vh9ho4z6': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2pewtdkh': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wgpyhlhc': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'q7yb20h3': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'lsphi2u9': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'w399ruaz': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '8c7x176e': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '55uc1ooc': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'jowhu20k': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'z42ck1ln': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ipb1k80w': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'yy48tspg': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'm9htmqe3': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
].reduce((a, b) => a..addAll(b));
