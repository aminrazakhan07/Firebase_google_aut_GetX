import 'package:firebase_google_auth/CustomWidget/CustmButton.dart';
import 'package:firebase_google_auth/CustomWidget/SnackBar.dart';
import 'package:firebase_google_auth/CustomWidget/TextField.dart';
import 'package:firebase_google_auth/CustomWidget/alreadyAccount.dart';
import 'package:firebase_google_auth/Services/loginService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  // TextEditingController inPutField = TextEditingController();
  // TextEditingController passwordField = TextEditingController();

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
