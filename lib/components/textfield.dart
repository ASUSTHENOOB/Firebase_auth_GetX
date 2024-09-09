import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyTextField2 extends StatelessWidget {
  final String hintName;
  final String labelName;
  final bool obsecuretext;
  final IconData myIcon;
  TextEditingController controller;
  MyTextField2(
      {super.key,
      required this.hintName,
      required this.labelName,
      required this.myIcon,
      required this.controller,
      required this.obsecuretext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextFormField(
            style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.titleLarge),
            obscureText: obsecuretext,
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: Icon(myIcon),
                prefixIconColor: Theme.of(context).primaryColor,
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 1, 159, 174)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 255, 6, 122)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 95, 159, 129)),
                ),
                hintText: hintName,
                filled: true,
                label: Text(
                  labelName,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleLarge),
                ),
                fillColor: Colors.transparent.withOpacity(0.4),
                hintStyle: Theme.of(context).textTheme.titleSmall),
          ),
        ),
        const SizedBox(
          height: 3,
        )
      ],
    );
  }
}
