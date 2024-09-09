// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_getx/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  void onSignUp() {
    print("Name : " + name.text);
    print("Email : " + email.text);
    print("Number : " + password.text);
    print("Password : " + confirmPass.text);
    createAccount(email.text, password.text);
  }

  Future<void> createAccount(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (true) {
        Get.to(() => LoginPage());
        print("Account Created");
        Fluttertoast.showToast(
          msg: "Account Created",
          backgroundColor: Colors.green[600],
        );
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
        Fluttertoast.showToast(
          msg: "Week Password",
          backgroundColor: Colors.orange[400],
        );
        print("Weak Password");
      } else if (ex.code == "email-already-in-use") {
        Fluttertoast.showToast(
          msg: "Email Already exists",
          backgroundColor: Colors.red[400],
        );
        print("Email Already exists Login Please !");
      }
    } catch (ex) {
      print(ex);
    }
  }
}
