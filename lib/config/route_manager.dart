import 'package:hzmarket/presentation/screens/auth/auth_screen.dart';
import 'package:hzmarket/presentation/screens/entry/entry_screen.dart';
import 'package:hzmarket/presentation/screens/export.dart';

class RouteManager {
  static const String entryRoute = '/entry';
  static const String sellRoute = '/sell';
  static const String authRoute = '/auth';

  static const String initialRoute = entryRoute;
  // static const String initialRoute = sellRoute;

  static final routes = {
    sellRoute: (context) => const SellScreen(),
    authRoute: (context) => const AuthScreen(),
    entryRoute: (context) => const EntryScreen(),
  };
}
