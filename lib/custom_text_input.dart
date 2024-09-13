import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hzmarket/generated/l10n.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    required this.textEditController,
    required this.inputType,
    this.enableBorder = true,
    this.prefixIcon,
    this.themeColor = Colors.blue,
    this.cornerRadius = 15,
    this.textColor = Colors.black,
    this.errorMessage = "",
    this.labelText = "",
    this.fieldColor = Colors.white,
    this.height = 50.0, // Add a height property
  });

  final TextEditingController textEditController;
  final InputType inputType;
  final bool enableBorder;
  final Color themeColor;
  final double cornerRadius;
  final Widget? prefixIcon;
  final Color textColor;
  final String errorMessage;
  final String labelText;
  final Color fieldColor;
  final double height; // Field height

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _isValidate = true;
  String validationMessage = "";
  bool _isPasswordVisible = false;
  bool _showPasswordToggle = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: SizedBox(
     //   height:  50, // Set the height of the container
        child: TextField(
          controller: widget.textEditController,
          decoration: InputDecoration(
            errorText: _isValidate ? null : validationMessage,
            contentPadding:
      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            counterText: '',
            border: getBorder(),
            enabledBorder: widget.enableBorder ? getBorder() : InputBorder.none,
            focusedBorder: widget.enableBorder ? getBorder() : InputBorder.none,
            labelText: widget.labelText,
            labelStyle: getTextStyle(),
            prefixIcon: widget.prefixIcon ?? getPrefixIcon(),
            suffixIcon: widget.inputType == InputType.Password && _showPasswordToggle
                ? IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: widget.fieldColor,
          ),
          onChanged: checkValidation,
          keyboardType: getInputType(),
          obscureText: widget.inputType == InputType.Password && !_isPasswordVisible,
          style: TextStyle(color: widget.textColor),
          onTap: () {
            if (widget.inputType == InputType.Password) {
              setState(() {
                _showPasswordToggle = true;
              });
            }
          },
          onSubmitted: (_) {
            setState(() {
              _showPasswordToggle = false;
            });
          },
        ),
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(widget.cornerRadius)),
      borderSide: BorderSide(width: 1, color: widget.themeColor),
      gapPadding: 2,
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(color: widget.themeColor
    ,fontFamily:'Nunito Normal');
  }

  void checkValidation(String textFieldValue) {
    if (widget.inputType == InputType.Default) {
      _isValidate = textFieldValue.isNotEmpty;
      validationMessage = widget.errorMessage;
    } else if (widget.inputType == InputType.Email) {
      _isValidate = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(textFieldValue);
      validationMessage = widget.errorMessage;
    } else if (widget.inputType == InputType.Password) {
      _isValidate = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
          .hasMatch(textFieldValue);
      validationMessage = widget.errorMessage;
    } else if (widget.inputType == InputType.PaymentCard) {
      _isValidate = textFieldValue.length == 19;
      validationMessage = widget.errorMessage;
    }
    setState(() {});
  }

  TextInputType getInputType() {
    switch (widget.inputType) {
      case InputType.Default:
        return TextInputType.text;
      case InputType.Email:
        return TextInputType.emailAddress;
      case InputType.Number:
        return TextInputType.number;
      case InputType.PaymentCard:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  Widget? getPrefixIcon() {
    switch (widget.inputType) {
      case InputType.Default:
        return null;
      case InputType.Email:
        return Icon(
          Icons.email,
          color: widget.themeColor,
        );
      case InputType.Number:
        return Icon(
          Icons.phone,
          color: widget.themeColor,
        );
      case InputType.Password:
        return Icon(
          Icons.lock,
          color: widget.themeColor,
        );
      case InputType.PaymentCard:
        return Icon(
          Icons.credit_card,
          color: widget.themeColor,
        );
      default:
        return SizedBox(width: 0);
    }
  }
}

enum InputType { Default, Email, Number, Password, PaymentCard }
