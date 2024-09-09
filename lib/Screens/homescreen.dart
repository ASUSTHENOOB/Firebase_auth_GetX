// lib/views/home_screen.dart
import 'package:firebase_auth_getx/Screens/Signup_page.dart';
import 'package:firebase_auth_getx/Screens/login_page.dart';
import 'package:firebase_auth_getx/components/animated_button.dart';
import 'package:firebase_auth_getx/controllers/animated_button_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ButtonController buttonController = Get.put(ButtonController());

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  "CHOOSE AN OPTION BELOW!!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Divider(
                  thickness: 1,
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 100,
                ),
                AnimatedButton(
                  icon: Icons.login,
                  ontap: () {
                    buttonController.toggleLoginButton();
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Get.to(
                        () => const LoginPage(),
                        transition: Transition.fadeIn,
                      ); // Navigate to Login Page
                    });
                  },
                  text: "L O G I N",
                  isPressed: buttonController.isLoginButtonPressed,
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedButton(
                  icon: Icons.app_registration_sharp,
                  ontap: () {
                    print("Tapped");
                    buttonController.toggleSignupButton();
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Get.to(
                        () => const SignupPage(),
                        transition: Transition.fadeIn,
                      ); // Navigate to Login Page
                    }); // Navigate to Signup Page
                  },
                  text: "S i g n u p".toUpperCase(),
                  isPressed: buttonController.isSignupButtonPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
