import 'package:get/get.dart';

class ButtonController extends GetxController {
  // Separate observable variables for each button state
  var isLoginButtonPressed = false.obs;
  var isSignupButtonPressed = false.obs;

  // Function to toggle login button state
  void toggleLoginButton() {
    isLoginButtonPressed.value = !isLoginButtonPressed.value;
  }

  // Function to toggle signup button state
  void toggleSignupButton() {
    isSignupButtonPressed.value = !isSignupButtonPressed.value;
  }

  Future resetButtons() async {
    await Future.delayed(const Duration(milliseconds: 10));
    isLoginButtonPressed.value = false;
    isSignupButtonPressed.value = false;
  }
}
