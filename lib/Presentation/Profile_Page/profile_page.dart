import 'package:basics/Presentation/Profile_Page/components/info_tile.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return AppPageBasics(withfoot: true, children: [
      SizedBox(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH40,
            const Text("Informacje użytkownika",
                style: TextStyle(fontSize: 30)),
            const Divider(),
            gapH10,
            const Text("Podstawowe:", style: TextStyle(fontSize: 20)),
            const InfoTile(
              title: "Imię",
              description: "Stasiek",
            ),
            const InfoTile(
              title: "Nazwisko",
              description: "Gwiazda",
            ),
            const InfoTile(
              title: "Email",
              description: "stasiek@example.com",
            ),
            const InfoTile(
              title: "Pseudonim",
              description: "Stasiu",
            ),
            const InfoTile(
              title: "Numer telefonu",
              description: "+48 123 456 789",
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Edit info",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))),
            ),
            const SizedBox(height: 10),
            const Text("Adres:", style: TextStyle(fontSize: 20)),
            const InfoTile(
              title: "Ulica",
              description: "Kwiatowa",
            ),
            const InfoTile(
              title: "Numer budynku",
              description: "24A",
            ),
            const InfoTile(
              title: "Numer mieszkania",
              description: "5",
            ),
            const InfoTile(
              title: "Piętro",
              description: "2",
            ),
            const SizedBox(height: 10),
            const Text("Informacje o bloku:", style: TextStyle(fontSize: 20)),
            const InfoTile(
              title: "Nazwa bloku",
              description: "Blok Nostalgia",
            ),
            const InfoTile(
              title: "Kod pocztowy",
              description: "00-001",
            ),
            gapH40
          ],
        ),
      )
    ]);
  }
}
