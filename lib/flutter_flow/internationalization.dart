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
  // LoadingScreen
  {
    'aui0uzts': {
      'en': 'SENSIBLE',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'rhq0w8x3': {
      'en': 'CONNECT',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'u7r6nj5x': {
      'en': 'Remaining Days',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '36ns1dwg': {
      'en': 'Home',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
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
    'tz46iv7q': {
      'en': 'Sub Total :',
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
    'mhpv2zkx': {
      'en': 'Proceed to Razorpay for payment',
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
      'en': 'Proceed to Payment',
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
      'en': 'Cancel Order',
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
    'hbnondbb': {
      'en': 'If bill is not printed click here to print again !',
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
  // DeleteConfirm
  {
    'sgztz001': {
      'en': 'Are you sure you want to Delete this item?',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4deta7q9': {
      'en': 'No',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xzo9ds8p': {
      'en': 'Delete',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // Keyboard
  {
    '6bhkeqbn': {
      'en': '1',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'rlxdchkn': {
      'en': '4',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pwhh7bpk': {
      'en': '7',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xugfozsj': {
      'en': '2',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7da2w1p5': {
      'en': '5',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '8fs43op1': {
      'en': '8',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'zurk51ja': {
      'en': '0',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'dmzym3pv': {
      'en': '3',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '3lvm9ovl': {
      'en': '6',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'j4xwnm5e': {
      'en': '9',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // test
  {
    'hpku1xs0': {
      'en': '1 Year',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2k2rf8ku': {
      'en': '\$300.00',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'tk7ui1l5': {
      'en': 'membership',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'gxf4kntt': {
      'en': 'Get all the features at a discount for yearly membership.',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'am2klcdo': {
      'en': 'Save 20%',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'j2751oqn': {
      'en': 'Buy Now',
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
  // ResetBill
  {
    '1g6zi5mm': {
      'en': 'SET CUSTOMER BILL NUMBER',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'fy3nu436': {
      'en': 'BILL PREFIX',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ft6krf5d': {
      'en': '[Some hint text...]',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'y5j8xwga': {
      'en': 'START BILL NUMBER',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'qb7n1lyt': {
      'en': '[Some hint text...]',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'sy6zxxwm': {
      'en': 'SET',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // CustomerDetails
  {
    'j1baq0eq': {
      'en': 'CUSTOMER DETAILS',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '92wrr1w0': {
      'en': 'Search Customer',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    's3jg9io5': {
      'en': 'Balance: ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'o57dvxsx': {
      'en': 'Allow Credit',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xt7fx90o': {
      'en': 'Balance: ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'bi8z9pt3': {
      'en': 'Allow Credit',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // UnitTypePopup
  {
    'b81gzk0w': {
      'en': 'Search here....',
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
  // Table
  {
    'z81nprjj': {
      'en': 'AC',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ot99c21k': {
      'en': '2',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'u16zvyul': {
      'en': '45',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'f72cc25k': {
      'en': 'Mins',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'laymjlvi': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7y96eeog': {
      'en': '70',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    't3jqscc2': {
      'en': 'Print',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '5uour33o': {
      'en': 'View',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // TableDetails
  {
    '5qa49c1f': {
      'en': 'Details of Table No. :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'oah0xxxc': {
      'en': '2',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'al48ge11': {
      'en': '32',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ujw2gj4r': {
      'en': 'Mins',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'vjiteb9y': {
      'en': 'Assign To :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '99g01u0u': {
      'en': 'Piyush',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'btzh5ydh': {
      'en': 'Item Name',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'h015qil6': {
      'en': 'Qty',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'qqcomv2k': {
      'en': 'Price',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'svf5esi1': {
      'en': 'Total',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '52lv8moe': {
      'en': 'Paneer',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '8h73f9zk': {
      'en': '2',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0vhvfooc': {
      'en': '80',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '16ke8io4': {
      'en': '160',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'kuepccr8': {
      'en': 'Bill No. :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ydtt4sps': {
      'en': '54569883',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'jswwo6ja': {
      'en': 'Total Amount :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ys47yyvb': {
      'en': '₹',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '76ox2o6z': {
      'en': '160',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // HeaderCopy
  {
    'ms6cfw4m': {
      'en': 'Rohit\'s Cafe',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7zv9jgnt': {
      'en': 'Rohit Tamkar',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'emiqy73s': {
      'en': 'Admin',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // DiscountAndDeliveryCopy
  {
    'e86i1m6f': {
      'en': 'Discount Amt',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '873e6pmo': {
      'en': '0',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'br43jg7q': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '696ipxl8': {
      'en': 'Discount %',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wu8v6q4o': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'qcd9i9xl': {
      'en': 'Delivery Charges',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'okpkoouz': {
      'en': '0',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'yatb7c32': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '8l0io74m': {
      'en': 'Tender Cash',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'flrvm21k': {
      'en': '00.00',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'a7mnihhr': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    's6kjr2ay': {
      'en': 'Return Cash',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'uqrygqf3': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'jr5t64qs': {
      'en': 'Bill Amount:',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'sbrdrp69': {
      'en': 'Discount :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'm7xwoen7': {
      'en': 'Tax Amt :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    's9cfnx2a': {
      'en': 'Delivery Chrg :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'z96dsni2': {
      'en': 'Done',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // PowerOff
  {
    'l3s7yuwb': {
      'en': 'Reboot',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'af4dfces': {
      'en': 'Logout',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'yb9sebxc': {
      'en': 'Cancel',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // openingBal
  {
    '3ndgfrm8': {
      'en': 'Enter Opening Balance',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'afwj36gk': {
      'en': 'Enter Amount.....',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'qse1o7lv': {
      'en': 'Shift Time In :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'uuw1285j': {
      'en': 'Cancel',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0bk0pfix': {
      'en': 'Ok',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // CustomDateWidget
  {
    '4n3ttfxx': {
      'en': 'Done',
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
  // NewDigitalOrder
  {
    'nusocc2c': {
      'en': '1 New Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'k6pb1309': {
      'en': 'Mute',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'p1106gl8': {
      'en': 'Item Name',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '88jz8oqi': {
      'en': 'Qty',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ir266wsg': {
      'en': 'Total',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pyvo7gwb': {
      'en': 'Item Name',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'qyllxjdv': {
      'en': '2',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4povjhi8': {
      'en': '300',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pyfs3uwy': {
      'en': '5',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'mvg3tstm': {
      'en': 'Items',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'a9u9b0rx': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'kbzy32pn': {
      'en': '200',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'vju021iq': {
      'en': 'Taxes',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'kvzo4tp0': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'hmr2orqu': {
      'en': '50',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '3dcaa4aa': {
      'en': 'Promo',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xhqnrp3u': {
      'en': '- ₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'v1g7jjjw': {
      'en': '50',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4xel3o32': {
      'en': 'Total Bill',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'yf9rxtg0': {
      'en': 'Paid',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'vekggbup': {
      'en': '₹ ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '5brsrsx3': {
      'en': '50',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'bh9hlaci': {
      'en': 'Set food preparation time',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0qb3ynw9': {
      'en': 'KOT',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'neliz9az': {
      'en': 'Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xjcl1lzz': {
      'en': '15',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'd65lnzoc': {
      'en': 'min.',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'qbd1axzq': {
      'en': 'Reject',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '4fxwwd3m': {
      'en': 'Accept Order',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // paymentMode
  {
    'itmkmxu3': {
      'en': 'Payment Mode',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '13ogxn0c': {
      'en': 'Search for an item...',
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
  // SpplierGro
  {
    'q0iak5qi': {
      'en': 'Supplier Information',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pe819nxc': {
      'en': 'Personal Information',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'w3ss58td': {
      'en': 'GRN No.',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ouu4bhoy': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'yrfpgf8v': {
      'en': 'Acc. Group ID',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7k8isxpn': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'z2lftwvt': {
      'en': 'Remark',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'svl9rcwv': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'j2k1r89t': {
      'en': 'Port ID',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'pzqsbmhw': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    't2fg5bu5': {
      'en': 'Contact Information',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '3ppn54yb': {
      'en': 'Mobile No.',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xidrpzd7': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'amp5j5h0': {
      'en': 'Address 1',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2tqghunk': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'hcmqhiiz': {
      'en': 'Area',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'obbtqyd0': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'kw3k55s0': {
      'en': 'Pincode',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '96zv45zi': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'cb70aril': {
      'en': 'City',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '6zm25zjr': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'duz142xh': {
      'en': 'State',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'olazscxp': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    't5az2o3c': {
      'en': 'Country ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'z9bilzx2': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '76k7jlp2': {
      'en': 'ARNumber',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'n99wqjd8': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'olwopzcr': {
      'en': 'GSTIN',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7djdgzom': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'wnrcnw86': {
      'en': 'GST State Code',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'yeggjpy6': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'm6zehjes': {
      'en': 'Submit',
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
  // mixPaymentMode
  {
    'u5vt3cak': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '0nkg1bkn': {
      'en': '0',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7oxje9yy': {
      'en': '',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'iid9a3zg': {
      'en': '0',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'n4pow71x': {
      'en': 'Payment Mode:',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '30p2qwo3': {
      'en': 'Bill Amt :',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '7jkr2owr': {
      'en': 'Submit',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // reportCalender
  {
    'ubc83p5i': {
      'en': 'cancel',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'up6zlty8': {
      'en': 'Done',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
  },
  // selectlabel
  {
    'w2ecx6kr': {
      'en': 'SELECT  LABEL  SIZE ',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'xpzd4iqs': {
      'en': 'SIZE 50mm,25mm',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'ay4fly8h': {
      'en': 'SIZE 35mm,15mm',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    'dp8dx1n5': {
      'en': 'SIZE 25mm,15mm',
      'hi': '',
      'kn': '',
      'mr': '',
      'ta': '',
    },
    '2gg5i5om': {
      'en': 'Submit',
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
