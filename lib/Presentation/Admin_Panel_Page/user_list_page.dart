import 'package:basics/Domain/value_objects/fonts.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return AppPageBasics(children: [
      gapH40,
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Lista Użytkowników", style: HText),
            gapH40,
            Container(
              width: 700,
              height: 30,
              color: const Color.fromARGB(255, 237, 237, 237),
              child: const Stack(
                alignment: Alignment.center,
                //  fit: StackFit.expand,

                children: [
                  Positioned(left: 20, child: Text("Name")),
                  Positioned(left: 180, child: Text("Email")),
                  Positioned(left: 360, child: Text("Date")),
                  Positioned(left: 550, child: Text("Role")),
                ],
              ),
            ),
            SizedBox(
              height: 700,
              width: 700,
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        width: 100,
                        color: index % 2 == 0
                            ? Colors.white
                            : const Color.fromARGB(255, 241, 242, 241),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.person)),
                              SizedBox(
                                //     color: Colors.amber,
                                width: 130,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "Kacper Król ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              Text(
                                "Kacper Król",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Spacer(),
                              Icon(Icons.more_vert)
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        color: Color.fromARGB(255, 217, 216, 216),
                        height: 1,
                      ),
                  itemCount: 3),
            ),
          ],
        ),
      )
    ]);
  }
}
