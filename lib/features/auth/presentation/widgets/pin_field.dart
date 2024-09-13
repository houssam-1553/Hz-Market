import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/enums/response_state.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  TextEditingController otpController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  String currentText = "";

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorController.close();
    otpController.dispose();
    super.dispose();
  }

  void _showErrorDialog(BuildContext context, String title, String message, bool isCheck) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          icon: isCheck ? Icon(Icons.check_circle, size: 50) : Icon(Icons.warning, size: 50),
          iconColor: isCheck ? Color.fromARGB(255, 54, 227, 69) : ColorManager.red,
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).ret, style: TextStyle(fontSize: 16, color: ColorManager.primary)),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text(S.of(context).OTP)],
        ),
        const SizedBox(height: 20,),
        PinCodeTextField(
          length: 6,
          autoDisposeControllers: false,
          appContext: context,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(5),
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            inactiveColor: ColorManager.primary,
          ),
          animationDuration: const Duration(milliseconds: 200),
          enableActiveFill: true,
          errorAnimationController: errorController,
          controller: otpController,
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            print(value);
            setState(() {
              currentText = value;
            });
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            return true;
          },
        ),
        SizedBox(height: 20,),
        SizedBox(
          width: 140,
          child: MaterialButton(
            onPressed: () async {
              bool isOtp = await Provider.of<AuthProvider>(context, listen: false).verifyOtpCode(otpController.text);

              if (isOtp) {
                // Provider.of<AuthProvider>(context, listen: false).showPinCodeScreen = true;
              } else {
                int pay = await Provider.of<AuthProvider>(context, listen: false).informationVerification.code!;
                String message;
                String title = "";

                print(pay);

                switch (pay) {
                  case 200:
                  case 400:
                    message = S.of(context).emptyFields;
                    title = S.of(context).wrongE;
                    break;
                  case 401:
                    message = S.of(context).invalidM;
                    title = S.of(context).invalid;
                    break;
                  case 405:
                    message = S.of(context).otpexM;
                    title = S.of(context).otpex;
                    break;
                  default:
                    message = S.of(context).checkConnection;
                    title = S.of(context).wrongCo;
                    break;
                }

                _showErrorDialog(context, title, message, false);
              }
            },
            height: 45,
            color: ColorManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).verify, style: TextStyle(color: ColorManager.white, fontSize: 18),),
                Container(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        switch (authProvider.otpSending.status) {
                          case Status.loading:
                            print(authProvider.otpSending);
                            return const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(color: ColorManager.white,),
                            );
                          case Status.completed:
                            return SizedBox(
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
          ),
        ),
      ],
    );
  }
}
