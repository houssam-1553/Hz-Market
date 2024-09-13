import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hzmarket/features/auth/presentation/providers.dart';
import 'package:hzmarket/features/auth/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  void _startSplashScreen() async {
    // Ensure splash screen is shown for at least 4 seconds
    await Future.delayed(Duration(seconds: 4));
    // Test the connection after the delay
    await testConnection();
  }

  Future<void> testConnection() async {
    bool isConnected = await Provider.of<AuthProvider>(context, listen: false).testConnection();
    if (isConnected) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      // Handle the connection error (e.g., show a dialog)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Connection Error'),
          content: Text('Failed to connect to the server. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInUp(
              duration: Duration(milliseconds: 2000),
              child: Image.asset(
                'assets/images/logo.png',
                height: 280,
              ),
            ),
            SizedBox(height: 80),
            SpinKitRing(
              color: Color.fromARGB(255, 41,128,185),
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
