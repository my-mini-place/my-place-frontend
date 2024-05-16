import 'package:basics/Domain/value_objects/options.dart';
import 'package:basics/Presentation/Enter_Page/components/categories_title.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class page_info extends StatelessWidget {
  const page_info({
    super.key,
    required this.blockvalue,
    required this.residencevalue,
  });

  final int blockvalue;
  final int residencevalue;

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
