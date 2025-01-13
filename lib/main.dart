import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_google_auth/LogSingAuth/LoginScr.dart';
import 'package:firebase_google_auth/change_text/change_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  //
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
//
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeText(),
    );
  }
}
