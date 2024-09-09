import 'package:firebase_auth_getx/components/button.dart';
import 'package:firebase_auth_getx/components/textfield.dart';
import 'package:firebase_auth_getx/controllers/animated_button_controller.dart';
import 'package:firebase_auth_getx/controllers/logincontroller.dart';
import 'package:firebase_auth_getx/utilis/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ButtonController buttonController = Get.put(ButtonController());
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        buttonController.resetButtons();
      },
      child: Scaffold(
        appBar: MyAppbar(title: "L O G I N"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  const Align(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Good to see you again! Let's get you logged in",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 159, 174),
                      Color.fromARGB(255, 255, 6, 122),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5),
                      MyTextField2(
                        myIcon: Icons.email,
                        hintName: "Enter Email",
                        controller: loginController.email,
                        obsecuretext: false,
                        labelName: 'Email',
                      ),
                      const SizedBox(height: 5),
                      MyTextField2(
                        myIcon: Icons.password,
                        hintName: "Enter Password",
                        controller: loginController.password,
                        obsecuretext: true,
                        labelName: 'Password',
                      ),
                      const SizedBox(height: 5),
                      const SizedBox(height: 20),
                      Mybutton(
                        text: "L O G I N",
                        ontap: () {
                          loginController.onLogin();
                          // Check if any field is empty
                          if (loginController.email.text.isEmpty ||
                              loginController.password.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("All fields are required!"),
                                duration: Duration(seconds: 1),
                                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                              ),
                            );
                          }
                          // Check if passwords do not match
                        },
                        icon: Icons.login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
