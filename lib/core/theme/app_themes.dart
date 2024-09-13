import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primary,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      primaryContainer: ColorManager.lightGrey,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: ColorManager.black,
    ),
     cardTheme: CardTheme(
      color: ColorManager.lightGrey
      
      ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: ColorManager.primary),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(ColorManager.primary),
      ),
    ),
    fontFamily: 'Nunito',
    splashColor: Colors.transparent,
  );

  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      shadow: Colors.white,
      primary: ColorManager.primary,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      primaryContainer: ColorManager.white,
      error: Colors.red,
      onError: Colors.white,
      background: Color.fromARGB(255, 33, 39, 43),
      onBackground: Colors.white,
      surface: Color.fromARGB(255, 33, 39, 43),
      
     
      onSurface: Colors.white,
    ),
   /*  textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
    ), */
   
    cardTheme: CardTheme(
      color: ColorManager.darkGrey, // Light mode card background color
      
      ),
    
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: Colors.red),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(ColorManager.primary),
      ),
    ),
    fontFamily: 'Nunito',
    splashColor: Colors.transparent,
  );
}
