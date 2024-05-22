import 'package:basics/Presentation/Site/app_bar_big.dart';
import 'package:basics/Presentation/Site/app_bar_changer.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Site/footer.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
              children: const [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AdminOptionTile(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AdminOptionTile(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AdminOptionTile(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AdminOptionTile(),
                )
              ],
            )),
      ),
    ]);
  }
}

class AdminOptionTile extends StatelessWidget {
  const AdminOptionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed('userslist');
      },
      child: Container(
        decoration: BoxDecoration(
            //  border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            //  color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //   color: Colors.blue,
                  child: const Icon(
                    Icons.person,
                    size: 35,
                  ),
                ),
                Expanded(
                  child: Container(
                    //   color: Colors.red,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapH10,
                        Text(
                          "Użytkownicy",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Zmien role, usuń lub zmień dane użytkownika!",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        gapH10,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
