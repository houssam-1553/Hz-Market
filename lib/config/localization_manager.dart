import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService extends GetxController {
  // Locale wrapped in an observable
  var locale = Rx<Locale>(const Locale('en'));

  @override
  void onInit() {
    super.onInit();
    _loadSavedLocale();
  }

  Future<void> changeLocale(String languageCode) async {
    Locale newLocale = Locale(languageCode);
    locale.value = newLocale; // Update the locale
    Get.updateLocale(newLocale);

    // Save the locale to persistent storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', languageCode);
  }

  Future<void> _loadSavedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLocale = prefs.getString('locale');
    if (savedLocale != null) {
      locale.value = Locale(savedLocale); // Load the saved locale
      Get.updateLocale(locale.value); // Update locale in GetX
    }
  }
}
