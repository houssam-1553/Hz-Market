import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/theme/theme_controller.dart';
import 'package:hzmarket/custom_text_input.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/features/auth/presentation/widgets/forgotpass.dart';
import 'package:hzmarket/features/auth/presentation/widgets/phone_log.dart';
import 'package:hzmarket/features/auth/presentation/widgets/pin_field.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'signin.dart';
import 'signup.dart';

class LoginSection extends StatefulWidget {
  @override
  _LoginSectionState createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  bool isSignupScreen = false;
  bool isForgetPassword = false;
  bool isLoginWithPhone = false;
  final ScrollController _scrollController = ScrollController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _brandTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController SpasswordTextController = TextEditingController();
  TextEditingController LpasswordTextController = TextEditingController();
  TextEditingController LemailTextController = TextEditingController();

  @override
  void dispose() {
    _nameTextController.dispose();
    _brandTextController.dispose();
    _phoneTextController.dispose();
    SpasswordTextController.dispose();
    LpasswordTextController.dispose();
    LemailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Container(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Obx(() {
              final isDarkMode = themeController.isDarkMode.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = false;
                        isForgetPassword = false;
                        isLoginWithPhone = false;
                        Provider.of<AuthProvider>(context, listen: false)
                            .showPinCodeScreen = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          S.of(context).login,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: !isSignupScreen && !isForgetPassword
                                ? ( ColorManager.primary)
                                : (isDarkMode ? Colors.white : ColorManager.black),
                          ),
                        ),
                        if (!isSignupScreen && !isForgetPassword)
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: ColorManager.primary,
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = true;
                        isForgetPassword = false;
                        isLoginWithPhone = false;
                        Provider.of<AuthProvider>(context, listen: false)
                            .showPinCodeScreen = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          S.of(context).signup,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isSignupScreen
                                ? ( ColorManager.primary)
                                : (isDarkMode ? Colors.white : ColorManager.black),
                          ),
                        ),
                        if (isSignupScreen)
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: ColorManager.primary,
                          )
                      ],
                    ),
                  )
                ],
              );
            }),
            const SizedBox(
              height: 30,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 1500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  if (authProvider.showPinCodeScreen) {
                    return PinCodeScreen();
                  } else if (isSignupScreen) {
                    return SignupScreen();
                  } else if (isLoginWithPhone) {
                    return PhoneLogWidget();
                  } else if (isForgetPassword) {
                    return ForgetPasswordWidget();
                  } else {
                    return Column(
                      children: [
                        SignInSection(
                            loginWithPhoneCallback: loginWithPhoneCallback),
                        const SizedBox(height: 20),
                        if (!isLoginWithPhone)
                          FadeInRightBig(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      handleForgotPassword();
                                    });
                                  },
                                  child: Text(
                                    S.of(context).forgotPassword,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginWithPhoneCallback(bool value) {
    setState(() {
      isLoginWithPhone = value;
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void handleForgotPassword() {
    setState(() {
      isForgetPassword = true;
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
