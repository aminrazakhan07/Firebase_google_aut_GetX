import 'package:firebase_google_auth/LogSingAuth/CustormWidget/CustmButton.dart';
import 'package:firebase_google_auth/LogSingAuth/CustormWidget/SnackBar.dart';
import 'package:firebase_google_auth/LogSingAuth/CustormWidget/TextField.dart';
import 'package:firebase_google_auth/LogSingAuth/CustormWidget/alreadyAccount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController inPutField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('data'),
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
