import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:get/get.dart';
import 'package:hzmarket/config/styles_manager.dart';

import 'package:hzmarket/custom_text_input.dart';
import 'package:hzmarket/features/home/presentation/widgets/profile_top.dart';
import 'package:hzmarket/generated/l10n.dart'; // Import the generated localization file
import 'package:hzmarket/config/color_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:profile_photo/profile_photo.dart';

class ComingSoon extends StatefulWidget {
  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        Text(
          "Comming Soon ",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
