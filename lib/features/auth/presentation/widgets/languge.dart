/* import 'package:flutter/material.dart';
import 'package:language_picker/languages.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:hzmarket/widgets/floating_button.dart';

class LanguageChangeableScreen extends StatefulWidget {
   LanguageChangeableScreen({Key? key}) : super(key: key);
  @override
  _LanguageChangeableScreenState createState() => _LanguageChangeableScreenState();

  Language _selectedLanguage = Languages.english;

  Language _languageFromString(String languageCode) {
    // Convert language code string to Language enum
    switch (languageCode) {
      case 'en':
        return Languages.english;
      case 'fr':
        return Languages.french;
      case 'ar':
        return Languages.arabic;
      default:
        return Languages.english; // Default to English
    }
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    Locale newLocale = Locale(languageCode, '');
    S.load(newLocale);
  }

  
}

class _LanguageChangeableScreenState extends State<LanguageChangeableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingButton(
        onLanguageChanged: (String languageCode) {
          setState(() {
            // Convert language code string to Language enum
            widget._selectedLanguage = widget._languageFromString(languageCode);
          });
          widget._changeLanguage(context, languageCode);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: widget.build(context),
    );
  }
}
 */