import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/local.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';

class CustomFloatingButton extends StatelessWidget {
  final void Function(String) onLanguageChanged;
  final Color? backgroundColor; // Define backgroundColor parameter

  const CustomFloatingButton({
    Key? key,
    required this.onLanguageChanged,
    this.backgroundColor, // Initialize backgroundColor parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localeService = getIt<LocaleService>();
    return Padding(
            
            padding: const EdgeInsets.only(bottom: 30.0),
            
            child: FloatingActionButton(
              elevation: 0.0,
            
            
      onPressed: () {
        
      }, // Placeholder onPressed function
      backgroundColor: backgroundColor,
       // Set background color
      tooltip: 'Switch Language',
      child: PopupMenuButton<Language>(
        tooltip: 'Switch Language',
       
        
        
        icon: Icon(Icons.language ,color: ColorManager.primary,),
        color: Color.fromARGB(255, 255, 255, 255),
        onSelected: (Language language) {
          onLanguageChanged(language.isoCode);
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
          PopupMenuItem<Language>(
            value: Languages.english,
            child: Text(S.of(context).en),
          ),
          PopupMenuItem<Language>(
            value: Languages.french,
            child: Text(S.of(context).fr),
          ),
          PopupMenuItem<Language>(
            value: Languages.arabic,
            child: Text(S.of(context).ar),
          ),
        ],
      ),
            ),
    );
  }
}
