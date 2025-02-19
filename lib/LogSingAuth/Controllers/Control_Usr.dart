import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_google_auth/LogSingAuth/Module/our_user.dart';
import 'package:firebase_google_auth/LogSingAuth/Screen_View/Home.dart';
import 'package:firebase_google_auth/Services/usrDatabase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController {
  FirebaseAuth auth = FirebaseAuth.instance;
  //
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  Future<bool> regidsterUer(
      BuildContext context, String email, String passCode) async {
    try {
      OurUser user =
          OurUser(email, passCode, "", ""); // Added required parameters
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: email,
        password: passCode,
      );
      User? u = authResult.user;
      //
      if (u != null) {
        Get.put(
          HomeScr(),
        );
        if (authResult.user != null) {
          user.uid = authResult.user!.uid;
          user.email = authResult.user!.email;
          user.passCode = passCode;
        }
      } else {
        return false;
      }
      //
      return false;
    } catch (e) {
      return true;
    }
  }

  /////////

  Future<bool> loginUser(
      BuildContext context, String email, String passCode) async {
    try {
      UserCredential loginResult =
          await auth.signInWithEmailAndPassword(email: email, password: "");
      User? user = loginResult.user;
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
      if (loginResult.user != null) {
        await UsrDataBase().getUserInfo();
      }
      return true;
    } catch (e) {}
    return true;
  }
}

///////
// class UserControllergpt {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<bool> registerUser(
//       BuildContext context, String email, String passCode) async {
//     try {
//       // یوزر رجسٹریشن
//       UserCredential authResult = await auth.createUserWithEmailAndPassword(
//           email: email, password: passCode);

//       User? user = authResult.user;

//       if (user != null) {
//         // Firestore میں یوزر ڈیٹا اسٹور کریں (پاس ورڈ کے بغیر)
//         await firestore.collection('users').doc(user.uid).set({
//           'email': email,
//           'createdAt': FieldValue.serverTimestamp(),
//         });

//         // ہوم اسکرین پر ری ڈائریکٹ کریں
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScr()),
//         );
//         return true;
//       } else {
//         return false; // اگر یوزر نل ہو تو
//       }
//     } on FirebaseAuthException catch (e) {
//       // Firebase کی غلطیاں ہینڈل کریں
//       if (e.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Email already in use')),
//         );
//       } else if (e.code == 'weak-password') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Password is too weak')),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Registration failed: ${e.message}')),
//         );
//       }
//       return false;
//     } catch (e) {
//       // عمومی غلطیاں ہینڈل کریں
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An unexpected error occurred')),
//       );
//       return false;
//     }
//   }
// }
