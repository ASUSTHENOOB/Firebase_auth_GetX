// lib/widgets/animated_button.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AnimatedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? ontap;
  final RxBool isPressed; // Accepting the specific button's observable state

  const AnimatedButton({
    super.key,
    required this.text,
    required this.ontap,
    required this.icon,
    required this.isPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          if (ontap != null) {
            ontap!();
          }
        },
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            height: isPressed.value ? 70 : 80,
            width: isPressed.value
                ? 210
                : 320, // Use the specific button's observable
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 6, 122),
                  offset: Offset(0.0, 5.0),
                  blurRadius: 8.0,
                ),
              ],
              color: const Color.fromARGB(255, 1, 159, 174),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  isPressed.value ? Icons.check_circle : icon,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
