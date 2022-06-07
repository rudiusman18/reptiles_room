import 'package:flutter/material.dart';
import 'package:reptiles_room/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
      Navigator.pushNamedAndRemoveUntil(
          context, '/sign-in-page', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/splash_screen.png',
              width: 192,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Reptiles Room',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            !isLoading
                ? SizedBox()
                : CircularProgressIndicator(
                    color: whiteColor,
                  ),
          ],
        ),
      ),
    );
  }
}
