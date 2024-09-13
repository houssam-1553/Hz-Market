import 'package:country_flags/country_flags.dart';
import 'package:country_icons/country_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/local.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/profile_tea.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/tabs/coming_soon.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/tabs/dashboard_page.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/tabs/profile_tab.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:language_picker/languages.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:profile_photo/profile_photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
   final _advancedDrawerController = AdvancedDrawerController();
  MotionTabBarController? _motionTabBarController;
  Language _selectedLanguage = Languages.english;
  int _currentIndex = 1;
  final controller = Get.put(NavigationController()); // Initial index

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: _currentIndex,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      openRatio: 0.6,
      openScale: 0.8,
        drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ListTile(
  onTap: () {
    controller.selectedIndex.value = 0; // Set the index for "Home"
    _advancedDrawerController.toggleDrawer(); // Close the drawer
  },
  leading: const Icon(Icons.home),
  title: const Text('Home'),
),
ListTile(
  onTap: () {
    controller.selectedIndex.value = 1; // Set the index for "Profile"
    _advancedDrawerController.toggleDrawer(); // Close the drawer
  },
  leading: const Icon(Icons.account_circle_rounded),
  title: const Text('Profile'),
),
ListTile(
  onTap: () {
    controller.selectedIndex.value = 2; // Set the index for "Favourites"
   _advancedDrawerController.toggleDrawer(); // Close the drawer
  },
  leading: const Icon(Icons.favorite),
  title: const Text('Favourites'),
),
ListTile(
  onTap: () {
    controller.selectedIndex.value = 3; // Set the index for "Settings"
    _advancedDrawerController.toggleDrawer(); // Close the drawer
  },
  leading: const Icon(Icons.settings),
  title: const Text('Settings'),
),

                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: const Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorManager.primary, const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ), child : Scaffold(
      backgroundColor: ColorManager.lightPrimary,
      bottomNavigationBar:Directionality(
        textDirection: ui.TextDirection.ltr, // Set the text direction to left-to-right
        child: Obx (() => 
BottomNavigationBar(

 /*  type:BottomNavigationBarType.fixed , */
  
  
  currentIndex: controller.selectedIndex.value,
  onTap: (index) {
    controller.selectedIndex.value = index;
  },
  items: [
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.element_4),
      label: "Dashboard",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.home_24),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.profile_circle),
      label: "Profile",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Iconsax.setting),
      label: "Settings",
    ),
  ],
  selectedItemColor: ColorManager.primary,  // Color for selected icon
  unselectedItemColor: Colors.grey, // Color for unselected icon
  backgroundColor: Colors.white,
  iconSize: 28,
  
       
        

)

),),
      /* Directionality(
        textDirection: ui.TextDirection.ltr, // Set the text direction to left-to-right
        child: MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: "Home",
          useSafeArea: true,
          labels: const ["Dashboard", "Home", "Profile", "Settings"],
          icons: const [
            Icons.dashboard,
            Icons.home,
            Icons.people_alt,
            Icons.settings
          ],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: ColorManager.primary,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: ColorManager.primary,
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
          onTabItemSelected: (int value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ), */
      appBar: AppBar(
        shadowColor: Colors.black,
        scrolledUnderElevation: 2.5,
        surfaceTintColor: Colors.transparent,
        bottomOpacity: 0.65,
        
        centerTitle: true,
       /* GestureDetector(
          child: const Icon(
            Icons.menu,
            color: ColorManager.primary,size: 32,
          ),
          onTap: () {
            // Open menu
            _openMenu(context);
          },
        ), */  leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                    size: 26,
                  ),
                );
              },
            ),
          ),
          title:Container(
            padding: EdgeInsets.only(right: 30),
            child: 
              Image.asset(
                'assets/images/logoH.png',
                height: 70,
              ),),
             
          
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            child: ProfilePhoto(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              totalWidth: 33,
              cornerRadius: 80,
              color: ColorManager.primary,
              image: const AssetImage('assets/images/pro.png'),
            ),
          ),
         
          PopupMenuButton<Language>(
            icon: const Icon(Icons.language, color: ColorManager.primary,size: 33,),
            
            onSelected: (Language language) {
              setState(() {
                _selectedLanguage = language;
              });
              _changeLanguage(context, language.isoCode);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Language>>[
              PopupMenuItem<Language>(
                value: Languages.english,
                child: Text(S.of(context).en),
              ),
              PopupMenuItem<Language>(
                value: Languages.french,
                child: Row(
                  children: [
                    Text(S.of(context).fr),
                  ],
                ),
              ),
              PopupMenuItem<Language>(
                value: Languages.arabic,
                child: Text(S.of(context).ar),
              ),
            ],
          ),
        ],
      ),
      /* IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          HomePage(),
          ProfileTab(),
          HomePage(),
        ],
      ), */
      
      body: Obx(() => controller.tabs[controller.selectedIndex.value]),
     

      
      
     
      ),
    );
  }
  

  Language _languageFromString(String languageCode) {
    // Convert language code string to Language enum
    switch (languageCode) {
      case 'en':
        return Languages.english;
      case 'fr':
        return Languages.french;
      case 'ar':
        return Languages.arabic;
      default:
        return Languages.english; // Default to English
    }
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    final LocaleService _localeService = Get.find(); 
   // Default to English
  }

  void _openMenu(BuildContext context) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final Offset target = bar.localToGlobal(Offset.zero) + const Offset(0.0, kToolbarHeight);

    final bool isArabic = Intl.getCurrentLocale() == 'ar';

    final double dx = isArabic ? bar.size.width : 0.0;
    final double endDx = isArabic ? 0.0 : bar.size.width;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(dx, target.dy, endDx, target.dy + 50),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Iconsax.element_4),
            title: Text(S.of(context).dashboard), // Localized Dashboard
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.home),
            title: Text(S.of(context).home), // Localized Home
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.people_alt),
            title: Text(S.of(context).profile), // Localized Profile
            onTap: () {
              setState(() {
                _currentIndex = 2;
              });
              Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: Text(S.of(context).settings), // Localized Settings
            onTap: () {
              setState(() {
                _currentIndex = 3;
              });
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
    void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
class NavigationController extends GetxController {

  final Rx<int> selectedIndex = 0.obs;
  final tabs = [
          
         HomePage(),
         ComingSoon(),
           ComingSoon(),
        
          ProfileTea(),
         
        ];
  
}
