import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'res/strings/ar.dart';
// import 'res/strings/cn.dart';
// import 'res/strings/de.dart';
import 'res/strings/en.dart';
// import 'res/strings/es.dart';
// import 'res/strings/et.dart';
// import 'res/strings/fr.dart';
// import 'res/strings/gr.dart';
// import 'res/strings/hr.dart';
// import 'res/strings/it.dart';
// import 'res/strings/ku.dart';
// import 'res/strings/lt.dart';
// import 'res/strings/lv.dart';
// import 'res/strings/nb.dart';
// import 'res/strings/nl.dart';
// import 'res/strings/nn.dart';
// import 'res/strings/np.dart';
// import 'res/strings/pl.dart';
// import 'res/strings/pt.dart';
// import 'res/strings/ru.dart';
// import 'res/strings/tr.dart';
// import 'res/strings/tw.dart';
// import 'res/strings/uk.dart';

class CurrencyLocalizations {
  final Locale locale;

  CurrencyLocalizations(this.locale);

  /// The `CurrencyLocalizations` from the closest [Localizations] instance
  /// that encloses the given context.
  ///
  /// This method is just a convenient shorthand for:
  /// `Localizations.of<CurrencyLocalizations>(context, CurrencyLocalizations)`.
  ///
  /// References to the localized resources defined by this class are typically
  /// written in terms of this method. For example:
  ///
  /// ```dart
  /// CurrencyLocalizations.of(context).currencyName(countryCode: country.countryCode),
  /// ```
  static CurrencyLocalizations? of(BuildContext context) {
    return Localizations.of<CurrencyLocalizations>(
      context,
      CurrencyLocalizations,
    );
  }

  /// A [LocalizationsDelegate] that uses [_CountryLocalizationsDelegate.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CurrencyLocalizations> delegate = _CountryLocalizationsDelegate();

  /// The localized country name for the given country code.
  String? currencyName({required String code}) {
    final currencyCode = code.toUpperCase();
    switch (locale.languageCode) {
      // case 'zh':
      //   switch (locale.scriptCode) {
      //     case 'Hant':
      //       return tw[countryCode];
      //     case 'Hans':
      //     default:
      //       return cn[countryCode];
      //   }
      // case 'el':
      //   return gr[countryCode];
      // case 'es':
      //   return es[countryCode];
      // case 'et':
      //   return et[countryCode];
      // case 'pt':
      //   return pt[countryCode];
      // case 'nb':
      //   return nb[countryCode];
      // case 'nn':
      //   return nn[countryCode];
      // case 'uk':
      //   return uk[countryCode];
      // case 'pl':
      //   return pl[countryCode];
      // case 'tr':
      //   return tr[countryCode];
      // case 'ru':
      //   return ru[countryCode];
      // case 'hi':
      // case 'ne':
      //   return np[countryCode];
      case 'ar':
        return ar[currencyCode]?['name'];
      // case 'ku':
      //   return ku[countryCode];
      // case 'hr':
      //   return hr[countryCode];
      // case 'fr':
      //   return fr[countryCode];
      // case 'de':
      //   return de[countryCode];
      // case 'lv':
      //   return lv[countryCode];
      // case 'lt':
      //   return lt[countryCode];
      // case 'nl':
      //   return nl[countryCode];
      // case 'it':
      //   return it[countryCode];
      case 'en':
      default:
        return en[currencyCode]?['name'];
    }
  }
}

class _CountryLocalizationsDelegate extends LocalizationsDelegate<CurrencyLocalizations> {
  const _CountryLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'ar',
      'ku',
      'zh',
      'el',
      'es',
      'et',
      'pl',
      'pt',
      'nb',
      'nn',
      'ru',
      'uk',
      'hi',
      'ne',
      'tr',
      'hr',
      'fr',
      'de',
      'lt',
      'lv',
      'nl',
      'it',
    ].contains(locale.languageCode);
  }

  @override
  Future<CurrencyLocalizations> load(Locale locale) {
    final CurrencyLocalizations localizations = CurrencyLocalizations(locale);
    return Future.value(localizations);
  }

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}