import 'package:flutter/material.dart';
import 'package:hzmarket/generated/l10n.dart';

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
    return Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: FloatingActionButton(
      onPressed: () {}, // Placeholder onPressed function
      backgroundColor: backgroundColor,
       // Set background color
      tooltip: 'Switch Language',
      child: PopupMenuButton<Language>(
        tooltip: 'Switch Language',
        elevation: 0.0,
        
        
        icon: Icon(Icons.language),
        color: Color.fromARGB(255, 98, 143, 206),
        onSelected: (Language language) {
          onLanguageChanged(language.isoCode);
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
          PopupMenuItem<Language>(
            value: Languages.english,
            child: Text('English'),
          ),
          PopupMenuItem<Language>(
            value: Languages.french,
            child: Text('French'),
          ),
          PopupMenuItem<Language>(
            value: Languages.arabic,
            child: Text('Arabic'),
          ),
        ],
      ),
            ),
    );
  }
}
