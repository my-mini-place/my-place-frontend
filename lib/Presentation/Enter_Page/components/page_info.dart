import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PageInfo extends StatefulWidget {
  const PageInfo({
    super.key,
  });

  @override
  State<PageInfo> createState() => PageInfoState();
}

class PageInfoState extends State<PageInfo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late int blockvalue = 0;
  late int residencevalue = 0;

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 965).animate(controller)
      ..addListener(() {
        setState(() {
          blockvalue = animation.value.toInt();
          residencevalue = (blockvalue * 10.5).toInt();
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.only(top: 20, bottom: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Text("$blockvalue",
                      style: GoogleFonts.montserrat(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  Text(
                    "Bloków ktorymi zarządzamy",
                    style: GoogleFonts.montserrat(fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Text("$residencevalue ",
                      style: GoogleFonts.montserrat(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  Text(
                    "Mieszkań ktorymi zarządzamy",
                    style: GoogleFonts.montserrat(fontSize: 20),
                  )
                ],
              ),
            ),
            const SizedBox(width: 40),
            Flexible(
              flex: 2,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  children: [
                    Center(
                      child: Text("${blockvalue * 1329}",
                          style: GoogleFonts.montserrat(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    Center(
                      child: Text(
                        "mieszkanców",
                        style: GoogleFonts.montserrat(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
