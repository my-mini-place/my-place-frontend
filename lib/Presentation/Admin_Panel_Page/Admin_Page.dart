import 'package:basics/Presentation/Admin_Panel_Page/components/admin_option_tile.dart';
import 'package:basics/Presentation/Site/app_page.dart';

import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class AdminPanelPage extends StatefulWidget {
  const AdminPanelPage({super.key});

  @override
  State<AdminPanelPage> createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends State<AdminPanelPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageBasics(children: [
      gapH40,
      const SizedBox(
        width: 900 - 16,
        child: Text(
          "Panel Sterowania",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      gapH40,
      Center(
        child: SizedBox(
            height: 900,
            width: 900,
            child: GridView.count(
              childAspectRatio: 16 / 8,
              crossAxisCount: 3,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OptionTile(
                      icon: Icons.person,
                      title: "Użytkownicy",
                      description: "Edytuj, usuń, zmień role użytkownikowi!",
                      navigation: () {
                        context.goNamed("userslist");
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OptionTile(
                    icon: Icons.house,
                    title: "Mieszkania",
                    description: "Edytuj, usuń, zmień mieszkanie!",
                    navigation: () {
                      context.goNamed("Residence");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OptionTile(
                    icon: Icons.house,
                    title: "Bloki",
                    description: "Edytuj, usuń, zmień Bloki!",
                    navigation: () {
                      context.goNamed("Blocks");
                    },
                  ),
                ),
              ],
            )),
      ),
    ]);
  }
}
