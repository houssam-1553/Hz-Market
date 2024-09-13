import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/widgets.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/config/styles_manager.dart';
import 'package:hzmarket/core/enums/response_state.dart';
import 'package:hzmarket/core/locator.dart';
import 'package:hzmarket/features/auth/data/remote_data_source/remote_dta.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:hzmarket/features/auth/domain/repos/repo.dart';
import 'package:hzmarket/features/auth/data/repo.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

// Define the callback function signature
typedef void LoginWithPhoneCallback();

class SignInSection extends StatefulWidget {
  final void Function(bool) loginWithPhoneCallback;

  const SignInSection({
    required this.loginWithPhoneCallback,
    Key? key,
  }) : super(key: key);

  @override
  _SignInSectionState createState() => _SignInSectionState();
}

class _SignInSectionState extends State<SignInSection> {
  bool isLoading = false;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          icon: const Icon(Icons.warning, size: 50),
          iconColor: ColorManager.red,
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).ret,
                style: const TextStyle(fontSize: 16, color: ColorManager.primary),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthRepositoryImpl authRepository = AuthRepositoryImpl();

    return Column(
      children: <Widget>[
        TextFormField(
          controller: _phoneController, 
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.phone, ),
            labelText: S.of(context).phoneNumber,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          
          decoration: InputDecoration(
            
            prefixIcon: const Icon(Icons.lock,),
            labelText: S.of(context).password,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(style: BorderStyle.none)
              
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
               
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: Column(
            children: [
              SizedBox(
                width: 250,
                child: MaterialButton(
                  height: 45,
                  color: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).login,
                        style: const TextStyle(color: ColorManager.white, fontSize: 18),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Consumer<AuthProvider>(
                            builder: (context, authProvider, child) {
                              switch (authProvider.informationVerification.status) {
                                case Status.loading:
                                  return const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(color: ColorManager.white),
                                  );
                                case Status.completed:
                                  return const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Icon(
                                      Icons.check,
                                      color: ColorManager.white,
                                    ),
                                  );
                                default:
                                  return const SizedBox(
                                    width: 1,
                                    height: 1,
                                  );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    bool loggedIn = await Provider.of<AuthProvider>(context, listen: false)
                        .loginWithPassword(context, phone: _phoneController.text, password: _passwordController.text);

                    setState(() {
                      isLoading = false;
                    });

                    if (loggedIn) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    } else {
                      int pay = Provider.of<AuthProvider>(context, listen: false).informationVerification.code!;
                      String message;
                      String title = "";

                      switch (pay) {
                        case 401:
                          message = S.of(context).credentilasCheck;
                          title = S.of(context).wrongC;
                          break;
                        case 404:
                          message = S.of(context).credentilasCheck;
                          title = S.of(context).wrongC;
                          break;
                        case 400:
                          message = S.of(context).emptyFields;
                          title = S.of(context).wrongE;
                          break;
                        case 402:
                          message = S.of(context).suspendedAccount;
                          title = S.of(context).wrongS;
                          break;
                        default:
                          message = S.of(context).checkConnection;
                          title = S.of(context).wrongCo;
                          break;
                      }

                      _showErrorDialog(context, title, message);
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(),
                  ),
                  Text(S.of(context).or),
                  const Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  widget.loginWithPhoneCallback(true);
                },
                height: 45,
                color: const Color.fromARGB(255, 32, 168, 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        S.of(context).loginWithPhone,
                        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 15),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.phone, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
