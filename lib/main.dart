import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/theme/app_themes.dart';
import 'package:hzmarket/core/theme/theme_controller.dart';
import 'package:hzmarket/features/auth/data/remote_data_source/remote_dta.dart';
import 'package:hzmarket/features/auth/data/repo.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/features/auth/presentation/screens/login_screen.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:hzmarket/features/splash_screen.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hzmarket/core/local.dart';

void main() {
  runApp
  (
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(AuthRepositoryImpl()),
        ),
      ],
      child:MainApp()));
  setupLocator();
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeService = getIt<LocaleService>();
    final ThemeController _themeController = Get.put(ThemeController());
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
     statusBarColor: Colors.transparent,
    

 )
 );
 SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return 
    AnimatedBuilder(
      animation: localeService,
      builder: (context, child) {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual,
          overlays: [
            SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
          ],
        );
return Obx((){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: localeService.locale,
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.darktheme,
            themeMode: _themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
           
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        
      
          home:  LoginScreen(),
        );});
      },
    );
  }
}