import 'package:basics/Presentation/Profile_Page/components/info_tile.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const AppPageBasics(children: [
      SizedBox(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH40,
            Text("Informacje użytkownika", style: TextStyle(fontSize: 30)),
            Divider(),
            InfoTile(
              title: "Imię",
              description: "Stasiek",
            ),
            InfoTile(
              title: "Nazwisko",
              description: "Gwiazda",
            ),
            InfoTile(
              title: "Email",
              description: "stasiek@example.com",
            ),
            InfoTile(
              title: "Pseudonim",
              description: "Stasiu",
            ),
            InfoTile(
              title: "Numer telefonu",
              description: "+48 123 456 789",
            ),
            gapH10,
            Divider(),
          ],
        ),
      )
    ]);
  }
}
