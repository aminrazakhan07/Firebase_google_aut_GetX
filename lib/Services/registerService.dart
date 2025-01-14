import 'package:firebase_google_auth/LogSingAuth/Controllers/Control_Usr.dart';
import 'package:flutter/material.dart';

class Registerservice {
  final TextEditingController emaiController = TextEditingController();
  final TextEditingController passwordContrller = TextEditingController();
  final TextEditingController confirmPasswordCont = TextEditingController();

  void upDateController(TextEditingController controller, String value) {
    controller.value = controller.value.copyWith(
        text: value,
        selection: TextSelection(
          baseOffset: value.length,
          extentOffset: value.length,
        ));

    UserController currentUser = UserController();
  }
}
