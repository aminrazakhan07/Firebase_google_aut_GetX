import 'package:firebase_google_auth/CustomWidget/CustmButton.dart';
import 'package:firebase_google_auth/CustomWidget/SnackBar.dart';
import 'package:firebase_google_auth/CustomWidget/TextField.dart';
import 'package:firebase_google_auth/CustomWidget/alreadyAccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class SignupScr extends StatefulWidget {
  const SignupScr({super.key});

  @override
  State<SignupScr> createState() => _SignupScrState();
}

class _SignupScrState extends State<SignupScr> {
  TextEditingController inPutField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

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
              textController: inPutField,
              lblText: 'User name',
              hint: 'enter email',
              prefix: Icons.person,
            ),
            //
            CustomTextfield(
              textController: passwordField,
              lblText: 'Password',
              hint: 'Password',
              prefix: Icons.visibility_off,
            ),
            CustmButton(
              btnText: 'Log in',
            ),
            //
            AlreadyAccount(
              comments: 'Already have an account?',
              switchPage: 'Sign Up',
              onTap: () {
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
