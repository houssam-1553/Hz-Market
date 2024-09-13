import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BuildContext getContext() => navigatorKey.currentContext!;

class NavigationManager {
  static Future<void> push(String route, {Object? arguments}) =>
      Navigator.pushNamed(
        getContext(),
        route,
        arguments: arguments,
      );
  static Future<void> pushAndReplacement(
    String route,
  ) =>
      Navigator.pushReplacementNamed(
        getContext(),
        route,
      );
  static Future<void> pushAndRemoveUntil(String route) =>
      Navigator.pushNamedAndRemoveUntil(
        getContext(),
        route,
        (route) => false,
      );

  static popUntil(String route) =>
      Navigator.popUntil(getContext(), ModalRoute.withName(route));

  static pop() => Navigator.pop(getContext());
  static openDrawer() => Scaffold.of(getContext()).openDrawer();
}
