import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBarButton extends StatefulWidget {
  const MyAppBarButton(
      {super.key,
      required this.navigation,
      required this.text,
      required this.fontcolor});

  final Function navigation;
  final String text;
  final Color fontcolor;

  @override
  State<MyAppBarButton> createState() => _MyAppBarButtonState();
}

class _MyAppBarButtonState extends State<MyAppBarButton> {
  late Color fontcolor = widget.fontcolor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => {
        setState(() {
          fontcolor = const Color.fromARGB(255, 249, 115, 22);
        })
      },
      onExit: (event) => {
        setState(() {
          fontcolor = fontcolor;
        })
      },
      child: GestureDetector(
        onTap: () {
          widget.navigation();
        },
        child: Text(widget.text,
            style: GoogleFonts.montserrat(color: fontcolor, fontSize: 17)),
      ),
    );
  }
}
