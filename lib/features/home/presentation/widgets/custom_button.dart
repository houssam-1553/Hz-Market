import 'package:flutter/material.dart';

class CustomLoginButton extends StatefulWidget {
  final VoidCallback onPressed;

  const CustomLoginButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _CustomLoginButtonState createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Material(
        color: Colors.transparent,
        child: ElevatedButton(
          onPressed: isLoading ? null : () {
            setState(() {
              isLoading = true;
            });
            widget.onPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Background color
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Rounded corners
            ),
            padding: EdgeInsets.symmetric(vertical: 12.0), // Padding
          ),
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  "Login ",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
        ),
      ),
    );
  }
}
