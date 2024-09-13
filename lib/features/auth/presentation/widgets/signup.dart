import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/enums/response_state.dart';
import 'package:hzmarket/custom_text_input.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/home_screen.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _brandTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _nameTextController.dispose();
    _brandTextController.dispose();
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }
   void _showErrorDialog(BuildContext context, String title, String message,bool ischeck) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        icon: ischeck ? Icon(Icons.check_circle, size: 50) : Icon(Icons.warning, size: 50),
        iconColor:ischeck ? Color.fromARGB(255, 54, 227, 69) : ColorManager.red,
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
      children: [
        const SizedBox(height: 10),
        Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextInput(
                      textEditController: _nameTextController,
                      labelText: S.of(context).Name,
                      inputType: InputType.Default,
                      themeColor: ColorManager.black,
                       errorMessage: S.of(context).empty,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CustomTextInput(
                      textEditController: _brandTextController,
                      labelText: S.of(context).Brand,
                      inputType: InputType.Default,
                      themeColor: ColorManager.black,
                       errorMessage: S.of(context).empty,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              CustomTextInput(
                textEditController: _phoneTextController,
                labelText: S.of(context).phoneNumber,
                inputType: InputType.Default,
                prefixIcon: const Icon(Icons.phone, color: ColorManager.black),
                themeColor: ColorManager.black,
                 errorMessage: S.of(context).empty,
              ),
              const SizedBox(height: 5),
              CustomTextInput(
                textEditController: _passwordTextController,
                labelText: S.of(context).password,
                inputType: InputType.Password,
                prefixIcon: const Icon(Icons.lock, color: ColorManager.black),
                themeColor: ColorManager.black,
                errorMessage:  S.of(context).passwordErrorMessage,
              ),
            ],
          ),
        
        const SizedBox(height: 40),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
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
                    S.of(context).signup,
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
                bool signedUp = await Provider.of<AuthProvider>(context, listen: false)
    .signUp(context,
      name: _nameTextController.text,     
      password: _passwordTextController.text,
      phone: _phoneTextController.text,
      brand: _brandTextController.text,
    
    );

setState(() {
  isLoading = false;
});


if (signedUp) {
  _showErrorDialog(context, S.of(context).otpsent, S.of(context).otpsentM,true);
 // Provider.of<AuthProvider>(context, listen: false).showPinCodeScreen = true ;
} else {
  int pay = Provider.of<AuthProvider>(context, listen: false).informationVerification.code!;
  String message;
  String title = "";

  switch (pay) {
    case 200:

   
    case 400:
      message = S.of(context).emptyFields;
      title = S.of(context).wrongE;
      break;
    case 409:
      message = S.of(context).Already;
      title = S.of(context).AlreadyM;
      break;
    default:
      message = S.of(context).checkConnection;
      title = S.of(context).wrongCo;
      break;
  }

  _showErrorDialog(context, title, message,false);
}
               
              },
            ),
          ),
        ),
      ],
    );
  }
}
