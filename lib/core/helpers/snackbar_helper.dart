import 'package:flutter/material.dart';

import 'package:hzmarket/core/navigation_manager.dart';

class SnackbarHelper {
  static void showSnackBar({required String text, int ms = 500}) =>
      ScaffoldMessenger.of(getContext()).showSnackBar(
        SnackBar(
          content: Text(text),
          duration: const Duration(milliseconds: 500),
        ),
      );
}
