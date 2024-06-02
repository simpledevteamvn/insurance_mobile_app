import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageProperties {
  final Locale locale;

  // ignore: sort_constructors_first
  LanguageProperties(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static LanguageProperties? of(BuildContext context) {
    return Localizations.of<LanguageProperties>(context, LanguageProperties);
  }

  static const LocalizationsDelegate<LanguageProperties> delegate = _AppLocalizationsDelegate();

  Map<dynamic, dynamic> _localizedValues = new Map();

  // ignore: strict_raw_type
  // Map flattenTranslations(Map<String, dynamic> json, [String prefix = '']) {
  //   final Map<String, String> translations = {};
  //   json.forEach((String key, dynamic value) {
  //       translations['$prefix$key'] = value.toString();
  //   });
  //   return translations;
  // }

  Map flattenTranslations(Map<String, dynamic> json) {
    final Map<String, String> translations = {};
    json.forEach((String key, dynamic value) {
      translations['vn'] = value.toString();
    });
    return translations;
  }

  Future<bool> load() async {
    // Load a language JSON file from the 'i18n' folder
    final value = await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = jsonDecode(value);
    _localizedValues = flattenTranslations(jsonMap);
    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedValues[key] ?? key;
  }

}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<LanguageProperties> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'vi'].contains(locale.languageCode);
  }

  @override
  Future<LanguageProperties> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    final LanguageProperties localizations = LanguageProperties(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}