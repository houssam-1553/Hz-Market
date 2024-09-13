import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/core/enums/response_state.dart';
import 'package:hzmarket/custom_text_input.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/generated/l10n.dart';
import 'package:provider/provider.dart';

class ForgetPasswordWidget extends StatefulWidget {
  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  TextEditingController _phoneTextController = TextEditingController();
   

  @override
  void dispose() {
    _phoneTextController.dispose();
     // Save a reference to the ancestor widget
   

    
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

  Column buildForgetPasswordSection(BuildContext context) {
    return Column(
      
      children: [
         SizedBox(height: 30),

        FadeInUp(
          child:  CustomTextInput(
                  textEditController:
                      _phoneTextController, // Pass the text controlle
                  labelText: S.of(context).phoneNumber,
                  inputType: InputType.Default,
                  prefixIcon: Icon(Icons.phone,color: ColorManager.black,),

                  themeColor: ColorManager.black,
                ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 140,
          child: MaterialButton(
            onPressed: () async {
              
              // Add functionality to send verification code
            bool isotp = await  Provider.of<AuthProvider>(context, listen: false).sendOtpCode(_phoneTextController.text);
              

if (isotp) {
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

   
    case 404:
      message = S.of(context).existM;
      title = S.of(context).exist;
      break;

    default:
      message = S.of(context).checkConnection;
      title = S.of(context).wrongCo;
      break;
  }

  _showErrorDialog(context, title, message,false);
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
                      Text(S.of(context).send , style: TextStyle(color: ColorManager.white ,  fontSize: 18),),
                      Container(
                        padding: EdgeInsets.all(10),
                        // height: 60.w,
                        // width: 60.w,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Consumer<AuthProvider>(
                            builder: (context, authProvider, child) {
                              switch (
                                  authProvider.otpSending.status) {
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

  @override
  Widget build(BuildContext context) {
    return buildForgetPasswordSection(context);
  }
}
