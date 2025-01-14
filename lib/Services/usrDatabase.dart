import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class UsrDataBase {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RoundedLoadingButtonController _buttonController =
      RoundedLoadingButtonController();

  //
  Future<bool> createUserInbd(user) async {
    try {
      await firestore.collection('users').add({
        "uid": user.uid,
        "userName": user.userName,
        "email": user.email,
        "passcode": user.passCode,
      });
      return true;
      //
    } catch (e) {
      return false;
    }
  }

  Future<void> setUserInfo(displayName, email) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      //
      if (user != null) {
        CollectionReference userCollection =
            FirebaseFirestore.instance.collection('user');
        await userCollection.doc(user.uid).set({
          'uid': user.uid,
          'display': displayName,
          'email': email,
        });
      } else {
        print('No user is currently signed in');
      }
    } catch (e) {
      print('Errore: $e');
    }
  }

  ///
  Future<void> getUserInfo() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      _buttonController.start();
      if (user != null) {
        CollectionReference userCallection =
            FirebaseFirestore.instance.collection('users');
        DocumentSnapshot userDoc = await userCallection.doc(user.uid).get();
        if (userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data() as Map<String, Symbol>;
          print('Usr info $userData');
        } else {
          print('user not found');
        }
      } else {
        print('No user is currently signed in');
      }
    } catch (e) {
      print('Error gettin user info $e');
    } finally {
      _buttonController.stop();
    }
  }
}
