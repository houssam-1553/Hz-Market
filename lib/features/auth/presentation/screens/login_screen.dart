import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch_dark_light/flutter_switch_dark_light.dart';
import 'package:get/get.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/local.dart';
import 'package:hzmarket/core/theme/theme_controller.dart';
import 'package:hzmarket/features/auth/presentation/widgets/login_section.dart';
import 'package:hzmarket/features/auth/presentation/widgets/floating_button.dart';
import 'package:hzmarket/features/auth/presentation/widgets/mode_switcher.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/profile_tea.dart';
import 'package:language_picker/languages.dart';


import 'package:hzmarket/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Language _selectedLanguage = Languages.english;
  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ThemeController themeController = Get.find();
    double height = size.height;
    return Scaffold(
      body: 
       
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipPath(
              clipper: Curved(),
              child:
              
              Obx(() {
              final isDarkMode = themeController.isDarkMode.value;
              return Container(
               color: isDarkMode ? Color.fromARGB(198, 19, 24, 38) : Color.fromARGB(197, 242, 243, 245),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      FadeInUp(
                        duration: Duration(milliseconds: 2000),
                        child: Image.asset(
                          'assets/images/logoH.png',
                          height: height * 0.35,
                        ),
                      ),
                    ],
                  ),
                ),
              
             );
            }),
            ),
            
            Expanded(
              child: LoginSection(),
            ),
          ],
        ),
      
      ),
      floatingActionButton: Obx(() {
        return Row(
          children: [
            CustomFloatingButton(
              backgroundColor: Colors.transparent,
              onLanguageChanged: (String languageCode) {
                setState(() {
                  _selectedLanguage = _languageFromString(languageCode);
                });
                _changeLanguage(languageCode);
              },
            ),
            SizedBox(width: size.width*0.6,),
            IconCircularSwitch(
              isOn: _themeController.isDarkMode.value,
              onChanged: (value) {
                _themeController.toggleTheme(); // Toggle the theme
              },
              iconOn: Icons.nightlight_round,
              activeIconColor: ColorManager.black,
              iconOff: Icons.wb_sunny,
            ),
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );  
  }

  Language _languageFromString(String languageCode) {
    switch (languageCode) {
      case 'en':
        return Languages.english;
      case 'fr':
        return Languages.french;
      case 'ar':
        return Languages.arabic;
      default:
        return Languages.english;
    }
  }

  void _changeLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    Get.updateLocale(locale);
  }
}
