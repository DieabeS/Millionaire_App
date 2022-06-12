import 'package:flutter/cupertino.dart';

class LocaleProvider {
  static LocaleProvider? _instance;
  Directions _direction = Directions.ltr;

  static Directions get direction => _instance!._direction;
  String _local = 'en';
  String Function(String)? _apiLocal;

  static Locale get locale => Locale(_instance!._local);

  static LocaleProvider? createInstance(
      {String? locale = 'en', List<Locale>? supportedLocals, String Function(String)? apiLocal}) {
    if (supportedLocals != null && supportedLocals.isNotEmpty) {
      var languageCode;
      var scriptCode;
      var countyCode;
      var isLocaleSupported = false;
      var checkSupportedLocaleLevel = 1;

      var localeConfiguration;
      if (locale!.contains('_')) {
        localeConfiguration = locale.split('_');
      } else {
        localeConfiguration = locale.split('-');
      }

      languageCode = localeConfiguration[0];

      if (localeConfiguration.length == 2) {
        countyCode = localeConfiguration[1];
        checkSupportedLocaleLevel = 2;
      }

      if (localeConfiguration.length == 3) {
        scriptCode = localeConfiguration[1];
        countyCode = localeConfiguration[2];
        checkSupportedLocaleLevel = 3;
      }

      if (checkSupportedLocaleLevel == 3) {
        for (var supportedLocal in supportedLocals) {
          if (supportedLocal.languageCode == languageCode &&
              supportedLocal.scriptCode == scriptCode &&
              supportedLocal.countryCode == countyCode) {
            isLocaleSupported = true;
            break;
          }
        }
      }

      if (checkSupportedLocaleLevel == 2 || (checkSupportedLocaleLevel == 3 && !isLocaleSupported)) {
        for (var supportedLocal in supportedLocals) {
          if (supportedLocal.languageCode == languageCode && supportedLocal.countryCode == countyCode) {
            isLocaleSupported = true;
            break;
          }
        }
      }

      if (checkSupportedLocaleLevel == 1 || (checkSupportedLocaleLevel != 1 && !isLocaleSupported)) {
        for (var supportedLocal in supportedLocals) {
          if (supportedLocal.languageCode == languageCode) {
            isLocaleSupported = true;
            break;
          }
        }
      }

      if (!isLocaleSupported) {
        locale = 'en';
      }
    }

    if (_instance == null) {
      _instance = LocaleProvider._internal(locale: locale!.toLowerCase(), apiLocal: apiLocal);
    } else {
      _instance!._local = locale!.toLowerCase();
      _instance!._apiLocal ??= apiLocal;
      _instance!._direction = locale.toLowerCase().contains('ar') ? Directions.rtl : Directions.ltr;
    }

    return _instance;
  }

  static LocaleProvider? get instance => _instance;

  LocaleProvider._internal({locale = 'en', apiLocal}) {
    _local = locale;
    _apiLocal = apiLocal;
    _direction = locale.toLowerCase().contains('ar') ? Directions.rtl : Directions.ltr;
  }

  static String get currentLocal => _instance!._local.substring(0, 2);
  static String get fullCurrentLocal => _instance!._local;
  static String get apiLocal => _instance!._apiLocal != null ? _instance!._apiLocal!(_instance!._local) : currentLocal;
  static double get scaleFactor => LocaleProvider._instance!._direction == Directions.ltr ? 1.0 : -1.0;

  static bool get isrtl => LocaleProvider._instance!._direction == Directions.rtl;
}

enum Directions {
  rtl,
  ltr,
}
