import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reptiles_room/pages/homepage/main_page.dart';
import 'package:reptiles_room/pages/sign_in_page.dart';
import 'package:reptiles_room/pages/splash_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/sign-in-page':
            return PageTransition(
              child: SignInPage(),
              type: PageTransitionType.bottomToTop,
            );

          case '/home-page':
            return PageTransition(
              child: MainPage(),
              type: PageTransitionType.rightToLeft,
            );
        }
      },
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
