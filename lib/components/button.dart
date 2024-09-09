import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? ontap;

  const Mybutton({
    super.key,
    required this.text,
    required this.ontap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center the button on the screen
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 80,
          width: 320, // Adjust width to fit the button properly
          padding: const EdgeInsets.symmetric(
              vertical: 20), // Adjust padding for better layout
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: const Color.fromARGB(255, 255, 6, 122),
                offset: Offset(0.0, 5.0), //(x,y)
                blurRadius: 8.0,
              ),
            ],
            color: const Color.fromARGB(255, 1, 159, 174),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center content
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context)
                      .textTheme
                      .displaySmall, // Change text color to match your design
                ),
              ),
              const SizedBox(width: 8), // Space between text and icon
              Icon(
                icon,
                color: Colors.black, // Ensure icon color matches your design
              ),
            ],
          ),
        ),
      ),
    );
  }
}
