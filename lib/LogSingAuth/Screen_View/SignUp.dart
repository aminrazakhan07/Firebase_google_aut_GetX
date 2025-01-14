import 'package:achievement_view/achievement_view.dart';
import 'package:firebase_google_auth/CustomWidget/CustmButton.dart';
import 'package:firebase_google_auth/CustomWidget/SnackBar.dart';
import 'package:firebase_google_auth/CustomWidget/TextField.dart';
import 'package:firebase_google_auth/CustomWidget/alreadyAccount.dart';
import 'package:firebase_google_auth/LogSingAuth/Controllers/Control_Usr.dart';
import 'package:firebase_google_auth/LogSingAuth/Screen_View/LoginScr.dart';
import 'package:firebase_google_auth/Services/registerService.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class SignupScr extends StatelessWidget {
  SignupScr({super.key});
  //
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  final Registerservice registerservice = Registerservice();
//
  TextEditingController inPutField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
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
            TextFormField(
              keyboardAppearance: Brightness.dark,
              controller: registerservice.emaiController,
              onChanged: (value) => registerservice.upDateController(
                  registerservice.emaiController, value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
            ),
            //
            CustomTextfield(
              textController: registerservice.passwordContrller,
              onChange: (value) => registerservice.upDateController(
                  registerservice.passwordContrller, value),
              lblText: 'Password',
              hint: 'Password',
              prefix: Icons.visibility_off,
            ),
            //
            CustomTextfield(
              textController: registerservice.confirmPasswordCont,
              onChange: (value) => registerservice.upDateController(
                  registerservice.confirmPasswordCont, value),
              lblText: 'Confirm PassCode',
              hint: 'Password',
              prefix: Icons.visibility_off,
            ),
            //
            CustmButton(
              btnText: 'Log in',
            ),
            //
            RoundedLoadingButton(
              controller: _buttonController,
              onPressed: () {
                if (registerservice.passwordContrller.text ==
                    registerservice.confirmPasswordCont.text) {
                  UserController().regidsterUer(
                      context,
                      registerservice.emaiController.text,
                      registerservice.passwordContrller.text);
                } else {
                  AchievementView(
                          title: 'Error',
                          subTitle: 'PassCode does not match',
                          duration: Duration(microseconds: 200))
                      .show(context);
                }
              },
              child: Text('data'),
            ),
            //
            AlreadyAccount(
              comments: 'Already have an account?',
              switchPage: 'Sign Up',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
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
