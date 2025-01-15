import 'dart:async';

import 'package:firebase_google_auth/CustomWidget/SnackBar.dart';
import 'package:firebase_google_auth/CustomWidget/TextField.dart';
import 'package:firebase_google_auth/CustomWidget/alreadyAccount.dart';
import 'package:firebase_google_auth/LogSingAuth/Controllers/Control_Usr.dart';
import 'package:firebase_google_auth/LogSingAuth/Screen_View/SignUp.dart';
import 'package:firebase_google_auth/Services/loginService.dart';
import 'package:firebase_google_auth/tow_button/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController inPutField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

//////
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();
  final Loginservice loginservice = Loginservice();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Log in',
          style:
              TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
              textController: loginservice.emailController,
              lblText: 'User name',
              hint: 'enter email',
              prefix: Icons.person,
            ),
            //
            CustomTextfield(
              textController: loginservice.passCodeContrler,
              lblText: 'Password',
              hint: 'Password',
              prefix: Icons.visibility_off,
            ),
            // CustmButton(
            //   btnText: 'Log in',
            // ),
            RoundedLoadingButton(
                controller: _buttonController,
                onPressed: () {
                  UserController().loginUser(
                      context,
                      loginservice.emailController.text,
                      loginservice.passCodeContrler.text);

                  Timer(Duration(seconds: 2), () {
                    _buttonController.success();
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Homepage(),
                        ));
                  });
                },
                child: Text('Login')),
            //
            AlreadyAccount(
              comments: 'Already have an account?',
              switchPage: 'Sign Up',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScr(),
                    ));
                //
                SnackbarHelper.showSnackbar(
                  title: 'Sign Up',
                  message: 'Successfully',
                  position: SnackPosition.BOTTOM,
                  icon: Icons.logout_outlined,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
