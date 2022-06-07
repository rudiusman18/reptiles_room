import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reptiles_room/models/user_model.dart';
import 'package:reptiles_room/pages/information_page.dart';
import 'package:reptiles_room/theme.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;
  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController userNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  UserModel userData = UserModel();

  @override
  Widget build(BuildContext context) {
// NOTE: template untuk membuat input
    inputContent({
      required String name,
      required String hintText,
      required TextEditingController controllerInput,
    }) {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 6,
            ),
            TextFormField(
              cursorColor: titleColor,
              controller: controllerInput,
              style: titleTextStyle,
              obscureText: name == 'Password' ? true : false,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: unselectedTextStyle,
                  enabledBorder: OutlineInputBorder(
                    // Digunakan untuk mengatur input border saat tidak aktif
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: unselectedColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: titleColor,
                      width: 1,
                    ),
                  )),
            ),
          ],
        ),
      );
    }

// NOTE: template untuk membuat background putih untuk template input
    Widget inputSection() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(
              18,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Colors.black.withOpacity(
                  0.25,
                ),
              )
            ]),
        child: Column(
          children: [
            inputContent(
              name: 'Full Name',
              hintText: 'Your Full Name',
              controllerInput: fullNameController,
            ),
            inputContent(
              name: 'Username',
              hintText: 'Your username',
              controllerInput: userNameController,
            ),
            inputContent(
              name: 'Email',
              hintText: 'Your Email',
              controllerInput: emailController,
            ),
            inputContent(
              name: 'Password',
              hintText: 'Your password',
              controllerInput: passwordController,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: primaryColor,
              ),
              child: TextButton(
                onPressed: () {
                  if (fullNameController.text == '' ||
                      userNameController.text == '' ||
                      emailController.text == '' ||
                      passwordController.text == '') {
                    // NOTE: Snackbar untuk memberikan error value
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Login Failed: fill each input form',
                          style: whiteTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    // print(fullNameController.text);
                    // print(userNameController.text);
                    // print(emailController.text);
                    // print(passwordController.text);

                    setState(() {
                      isLoading = true;
                      userData = UserModel(
                        fullName: fullNameController.text,
                        userName: userNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    });
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        isLoading = false;
                      });

                      Navigator.push(
                          context,
                          PageTransition(
                            child: InformationPage(userData: userData),
                            type: PageTransitionType.rightToLeft,
                          ));
                    });
                  }
                },
                child: isLoading
                    ? Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: whiteColor,
                          strokeWidth: 4,
                        ),
                      )
                    : Text(
                        'Get Started',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        margin: EdgeInsets.all(24),
        child: ListView(
          children: [
            // NOTE: ini adalah tag line
            Text(
              'Join us and get \nyour favourite reptiles',
              style: titleTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
