
import 'package:currency_picker/src/currencies.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import 'res/country_codes.dart';
import '../currency_picker.dart';
import 'currency_localizations.dart';
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

/// Used to parse simple string representations of countries, commonly used in
/// databases and other forms of storage, to a Country object.
class CurrencyParser {
  /// Returns a single country if [country] matches a country code or name.
  ///
  /// Throws an [ArgumentError] if no matching element is found.
  static Currency parse(String currencyCode) {
    return tryParseCurrencyCode(currencyCode) ?? Currency.from(json: currencies[0]);
  }

  /// Returns a single country if [country] matches a country code or name.
  ///
  /// returns null if no matching element is found.
  static Currency? tryParse(String currencyCode) {
    return tryParseCurrencyCode(currencyCode) ?? Currency.from(json: currencies[0]);
  }

  /// Returns a single country if it matches the given [countryCode] (iso2_cc).
  ///
  /// Throws a [StateError] if no matching element is found.
  static Currency parseCurrencyCode(String currencyCode) {
    return _getFromCode(currencyCode.toUpperCase());
  }

  /// Returns a single country that matches the given [countryCode] (iso2_cc).
  ///
  /// Returns null if no matching element is found.
  static Currency? tryParseCurrencyCode(String countryCode) {
    try {
      return parseCurrencyCode(countryCode);
    } catch (_) {
      return null;
    }
  }

  /// Returns a currency that matches the [code].
  static Currency _getFromCode(String currencyCode) {
    return Currency.from(
      json: currencies.singleWhere(
            (Map<String, dynamic> c) => c['code'] == currencyCode,
      ),
    );
  }

  /// Returns a country code that matches a country with the given [name] for
  /// any language, or the ones given by [locales]. If no locale list is given,
  /// the language for the [locale] is prioritized, followed by the default
  /// language, english.
  static String _anyLocalizedNameToCode(
      String name,
      Locale? locale,
      List<Locale>? locales,
      ) {
    String? code;

    if (locale != null) code = _localizedNameToCode(name, locale);
    if (code == null && locales == null) {
      code = _localizedNameToCode(name, const Locale('en'));
    }
    if (code != null) return code;

    final List<Locale> localeList = locales ?? <Locale>[];

    if (locales == null) {
      final List<Locale> exclude = <Locale>[const Locale('en')];
      if (locale != null) exclude.add(locale);
      localeList.addAll(_supportedLanguages(exclude: exclude));
    }

    return _nameToCodeFromGivenLocales(name, localeList);
  }

  /// Returns the country code that matches the given [name] for any of the
  /// [locales].
  ///
  /// Throws an [ArgumentError] if no matching element is found.
  static String _nameToCodeFromGivenLocales(String name, List<Locale> locales) {
    String? code;

    for (int i = 0; i < locales.length && code == null; i++) {
      code = _localizedNameToCode(name, locales[i]);
    }

    if (code == null) {
      throw ArgumentError.value('No country found');
    }

    return code;
  }

  /// Returns the code for the country that matches the given [name] in the
  /// language given by the [locale]. Defaults to english.
  ///
  /// Returns null if no match is found.
  static String? _localizedNameToCode(String name, Locale locale) {
    final Map<String, String> translation = _getTranslation(locale);

    String? code;

    translation.forEach((key, value) {
      if (value.toLowerCase() == name) code = key;
    });

    return code;
  }

  // ToDo: solution to prevent manual update on adding new localizations?
  /// Returns a translation for the given [locale]. Defaults to english.
  static Map<String, String> _getTranslation(Locale locale) {

    final format = NumberFormat.simpleCurrency(
      locale: locale.toString(),
    );
    final currencyCode = format.currencyName;
    switch (locale.languageCode) {
      // case 'zh':
      //   switch (locale.scriptCode) {
      //     case 'Hant':
      //       return tw;
      //     case 'Hans':
      //     default:
      //       return cn;
      //   }
      // case 'el':
      //   return gr;
      case 'ar':
        return ar[currencyCode]!;
      // case 'ku':
      //   return ku;
      // case 'es':
      //   return es;
      // case 'et':
      //   return et;
      // case 'pt':
      //   return pt;
      // case 'nb':
      //   return nb;
      // case 'nn':
      //   return nn;
      // case 'uk':
      //   return uk;
      // case 'pl':
      //   return pl;
      // case 'tr':
      //   return tr;
      // case 'hr':
      //   return hr;
      // case 'ru':
      //   return ru;
      // case 'hi':
      // case 'ne':
      //   return np;
      // case 'fr':
      //   return fr;
      // case 'de':
      //   return de;
      // case 'lv':
      //   return lv;
      // case 'lt':
      //   return lt;
      // case 'nl':
      //   return nl;
      // case 'it':
      //   return it;
      case 'en':
      default:
        return en[currencyCode]!;
    }
  }

  // ToDo: solution to prevent manual update on adding new localizations?
  /// A list of the supported locales, except those included in the [exclude]
  /// list.
  static List<Locale> _supportedLanguages({
    List<Locale> exclude = const <Locale>[],
  }) {
    return <Locale>[
      const Locale('en'),
      const Locale('ar'),
      // const Locale('ku'),
      // const Locale('es'),
      // const Locale('el'),
      // const Locale('et'),
      // const Locale('fr'),
      // const Locale('nb'),
      // const Locale('nn'),
      // const Locale('pl'),
      // const Locale('pt'),
      // const Locale('ru'),
      // const Locale('hi'),
      // const Locale('ne'),
      // const Locale('uk'),
      // const Locale('tr'),
      // const Locale('hr'),
      // const Locale('de'),
      // const Locale('lv'),
      // const Locale('lv'),
      // const Locale('nl'),
      // const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      // const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ]..removeWhere((Locale l) => exclude.contains(l));
  }
}
