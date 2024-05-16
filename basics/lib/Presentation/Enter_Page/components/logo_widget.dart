import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Flexible(
            child: Text(
              'My',
              style: GoogleFonts.montserrat(
                  color: const Color.fromARGB(255, 249, 115, 22),
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Text('Place',
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontSize: fontSize)),
          ),
        ],
      ),
    );
  }
}
