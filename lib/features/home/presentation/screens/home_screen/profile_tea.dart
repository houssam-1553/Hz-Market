import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/config/styles_manager.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/tabs/profile_tab.dart';
import 'package:hzmarket/features/home/presentation/widgets/settings_tile.dart';
import 'package:iconsax/iconsax.dart';
import 'package:profile_photo/profile_photo.dart';
import 'package:hzmarket/core/theme/theme_controller.dart';

class ProfileTea extends StatelessWidget {
  const ProfileTea({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController _themeController = Get.find();
    return Scaffold(
      body: Column(
        children: [
          // Profile Header Section
          ClipPath(
            clipper: Curved(),
            child: Container(
              padding: EdgeInsets.only(bottom: 30, top: 10),
             decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 103, 165, 203), ColorManager.primary],
          ),),
              child: Stack(
                children: [
                  ListTile(
                    leading: ProfilePhoto(
                      onTap: () {},
                      totalWidth: 50,
                      cornerRadius: 80,
                      color: Colors.blue,
                      image: const AssetImage('assets/images/pro.png'),
                    ),
                    title: Text(
                      "Houssam Zitoune",
                      style: TextStyle(color: Colors.white, fontSize: 20,fontFamily:"inter bold"),
                    ),
                    subtitle: Text(
                      "Owner of BrandName",
                      style: TextStyle(color: Colors.white, fontWeight: light),
                    ),
                    trailing: IconButton(
                      onPressed: () => Get.to(()=> ProfileTab()) ,
                      icon: Icon(
                        Iconsax.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Scrollable Content
          Expanded(
            child:Obx((){
              return
             SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    SettingsTile(
                      icon: Icons.person_outline_outlined,
                      title: "Full name",
                      subtitle: "zitoune houssam",
                    ),
                    SettingsTile(
                      icon: Icons.email_outlined,
                      title: "Email",
                      subtitle: "example@example.com",
                    ),
                    SettingsTile(
                      icon: Icons.phone_outlined,
                      title: "Phone number",
                      subtitle: "+123 456 7890",
                    ),
                    SettingsTile(
                      icon: Icons.location_on_outlined,
                      title: "Address",
                      subtitle: "123 Main Street, City",
                    ),
                    SettingsTile(
                      icon: Icons.lock_outline,
                      title: "Password",
                      subtitle: "********",
                    ),
                    SettingsTile(
                      icon: Icons.notifications_outlined,
                      title: "Notifications",
                      subtitle: "Enabled",
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                    SettingsTile(
                      icon: Icons.language_outlined,
                      title: "Language",
                      subtitle: "English",
                    ),
                     SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: "Dark mode",
            subtitle: _themeController.isDarkMode.value ? "Enabled" : "Disabled",
            trailing: Obx(() {
              return Switch(
                value: _themeController.isDarkMode.value,
                onChanged: (value) {
                  _themeController.toggleTheme(); // Toggle the theme
                },
              );
            }),
          ),
                    SettingsTile(
                      icon: Icons.help_outline,
                      title: "Help & Support",
                      subtitle: "FAQ",
                    ),
                    SettingsTile(
                      icon: Icons.info_outline,
                      title: "About",
                      subtitle: "App version 1.0",
                    ),
                  ],
                ),
              ),
            );})
          ),
        ],
      ),
    );
  }
}

class Curved extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstC = Offset(0, size.height - 20);
    final lastC = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstC.dx, firstC.dy, lastC.dx, lastC.dy);

    final secondFirstC = Offset(0, size.height - 20);
    final secondLastC = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstC.dx, secondFirstC.dy, secondLastC.dx, secondLastC.dy);

    final thirdFirstC = Offset(size.width, size.height - 20);
    final thirdLastC = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstC.dx, thirdFirstC.dy, thirdLastC.dx, thirdLastC.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
