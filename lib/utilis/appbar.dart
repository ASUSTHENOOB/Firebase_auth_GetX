import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(55);
  final String title;
  MyAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: true,
      title: Text(
        title,
        style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.titleLarge),
      ),
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
    );
  }
}
