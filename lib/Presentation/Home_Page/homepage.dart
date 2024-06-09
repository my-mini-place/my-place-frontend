import 'package:basics/Presentation/Home_Page/components/function_icon.dart';
import 'package:basics/Presentation/Site/app_bar_changer.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Site/footer.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:basics/Presentation/Utils/extension.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPageBasics(children: [
      Column(
        children: [
          gapH40,
          if (context.isUser)
            const Text(
                "OCZEKUJESZ NA NADANIE ROLI PRZEZ ADMINISTRATORA PROSZĘ CZEKAĆ"),
          gapH40,
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 35, top: 20),
              child: Text(
                "Aktualności:",
                style: GoogleFonts.montserrat(fontSize: 40),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 500, maxWidth: 600),
            child: Wrap(
              children: [
                FunctionIcon(
                  title: "Profil",
                  icon: Icons.person,
                  navigation: () {
                    context.goNamed("profile");
                  },
                ),
                if (!context.isUser)
                  FunctionIcon(
                    title: "Usterki",
                    icon: Icons.construction,
                    navigation: () {
                      context.go("/home/usterka");
                    },
                  ),
                if (!context.isUser)
                  FunctionIcon(
                    title: "Ogłoszenia",
                    icon: Icons.assignment_late_outlined,
                    navigation: () {
                      context.replaceNamed("posts");
                    },
                  ),
                if (context.isAdmin)
                  FunctionIcon(
                    title: "Panel Administratora",
                    icon: Icons.admin_panel_settings,
                    navigation: () {
                      context.goNamed("admin");
                    },
                  ),
                if (!context.isUser)
                  FunctionIcon(
                    title: "Kalendarz",
                    icon: Icons.calendar_today,
                    navigation: () {
                      context.pushNamed("calendar");
                    },
                  ),
                if (!context.isUser)
                  FunctionIcon(
                    title: "Dokumenty",
                    icon: Icons.edit_document,
                    navigation: () {
                      context.replaceNamed("doc");
                    },
                  ),
              ],
            ),
          ),
          gapH40,
        ],
      ),
    ]);
  }
}
