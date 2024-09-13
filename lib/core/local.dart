import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class LocaleService extends ChangeNotifier {
  Locale _locale = Locale(Intl.getCurrentLocale());

  Locale get locale => _locale;

  void changeLocale(String languageCode) {
    if (languageCode == 'ar') {
      _locale = Locale(languageCode, ''); // Arabic text direction
    } else if (languageCode == 'fr') {
      _locale = Locale(languageCode, ''); // Default text direction
    }else
    {_locale = Locale(languageCode, '');}
    notifyListeners(); // Notify listeners to rebuild the UI
  }
  
}

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<LocaleService>(LocaleService());
  
}
