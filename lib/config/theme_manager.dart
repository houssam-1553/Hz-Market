/* import 'package:easylocalization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hz_market/config/color_manager.dart';
import 'package:hz_market/config/styles_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  String lc = context.locale.languageCode;
  Map<String, String> fontFamilies = {'ar': 'IBMPlexSansArabic', 'en': 'Inter'};
  String fontFamily = fontFamilies[lc]!;

  return ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    textTheme: TextTheme(
      headlineSmall: getRegularStyle(
        fontSize: 16.sp,
        color: ColorManager.black,
      ).copyWith(fontFamily: fontFamily),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: ColorManager.primary,
      dividerColor: Colors.black12,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: getSemiBoldStyle(
        fontSize: 18.0,
      ).copyWith(fontFamily: fontFamily),
      labelColor: ColorManager.primary,
      unselectedLabelColor: ColorManager.subtitleColor,
      unselectedLabelStyle: getRegularStyle(
        fontSize: 16.0,
      ).copyWith(fontFamily: fontFamily),
    ),
    //appbar theme
    appBarTheme: AppBarTheme(
      surfaceTintColor: ColorManager.white,
      centerTitle: true,
      elevation: 0,
      backgroundColor: ColorManager.white,
      iconTheme: const IconThemeData(
        color: ColorManager.black,
      ),
      shadowColor: ColorManager.lightGrey,
      titleTextStyle: getSemiBoldStyle(
        fontSize: 17,
        color: ColorManager.black,
      ).copyWith(
        fontFamily: fontFamily,
      ),
    ),
    //bottom navbar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
      selectedItemColor: ColorManager.primary,
      selectedLabelStyle: getMediumStyle(
        fontSize: 13.0,
        color: ColorManager.primary,
      ),
      unselectedItemColor: ColorManager.black,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        disabledBackgroundColor: ColorManager.lightGrey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        textStyle: getBoldStyle(
          color: ColorManager.white,
          fontSize: 20.0,
        ).copyWith(fontFamily: fontFamily),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      //  overlayColor:  ColorManager.red,
      splashColor: ColorManager.lightGrey,
    ),

    sliderTheme: SliderThemeData(
      overlayColor: ColorManager.black.withOpacity(0.2),
      activeTrackColor: ColorManager.black,
      activeTickMarkColor: ColorManager.black,
      thumbColor: ColorManager.black,
      inactiveTrackColor: const Color(0xFFDAD8D9),
    ),
    //input decoration theme
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorManager.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      border: MaterialStateOutlineInputBorder.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorManager.primary,
            ),
            borderRadius: BorderRadius.circular(9.0),
          );
        }

        return OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(9.0),
        );
      }),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.primary,
        ),
        borderRadius: BorderRadius.circular(9.0),
      ),
      fillColor: ColorManager.lightPrimary,
      focusColor: ColorManager.white,
      prefixIconColor: ColorManager.black,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(9.0),
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: Color(0xFFDAD8D9),
      space: 1.5,
    ),

    switchTheme: const SwitchThemeData(
      trackColor: MaterialStatePropertyAll(ColorManager.lightGrey),
    ),
    scaffoldBackgroundColor: ColorManager.lavender,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.black,
      primary: ColorManager.primary,
    ),
  );
}
 */