import 'package:basics/Presentation/Login_Register/LogoWidget.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late int blockvalue = 0;
  late int residencevalue = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 30).animate(controller)
      ..addListener(() {
        setState(() {
          blockvalue = animation.value.toInt();
          residencevalue = (blockvalue * 22.23).toInt();
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                leadingWidth: 400,
                backgroundColor: Colors.black,
                toolbarHeight: 70,
                leading: const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: LogoWidget(fontSize: 30)),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("Login",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 17)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("Home",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 17)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Center(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/icon.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 600, minHeight: 600),
                child: // You might adjust this to fit the aspect ratio of your image

                    LayoutBuilder(builder: (context, constraints) {
                  return Stack(children: [
                    Image.asset(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                      'assets/enter.jpg',
                    ),
                    Positioned(
                      left: constraints.maxWidth / 8,
                      top: 4 * constraints.maxHeight / 9,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Witamy w My Place!",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 35)),
                            gapH10,
                            gapH10,
                            const Text("Twoja spółdzielnia mieszkaniowa online",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            gapH10,
                            MouseRegion(
                              onHover: (event) => {},
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 100,
                                color: const Color.fromARGB(255, 249, 115, 22),
                                child: const Center(
                                    child: Text(
                                  "Zaloguj się",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ),
                          ]),
                    ),
                  ]);
                }),
              ),
              const SizedBox(height: 20),
              Container(
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
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
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
                  )),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    MyCategoryTile(),
                    MyCategoryTile(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                color: Colors.black,
                height: 150,
                child: const Column(
                  children: [
                    gapH10,
                    gapH10,
                    gapH10,
                    Text(
                      'MyPlace is an app that makes living in society from your flat easier and happier',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            '© 2024 My Place. Wszelkie prawa zastrzeżone.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 189, 181, 181),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCategoryTile extends StatefulWidget {
  const MyCategoryTile({
    super.key,
  });

  @override
  State<MyCategoryTile> createState() => _MyCategoryTileState();
}

class _MyCategoryTileState extends State<MyCategoryTile> {
  double _scale = 1.0;

  void _onHover(PointerEvent details) {
    setState(() {
      _scale = 1.05; // Skala powiększenia
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _scale = 1.0; // Skala normalna
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  color: Colors.amber,
      width: 600,
      height: 200,
      child: Row(children: [
        MouseRegion(
          onHover: _onHover,
          onExit: _onExit,
          child: AnimatedContainer(
            transform: Matrix4.identity()..scale(_scale, _scale),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/categories/calendar.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            //   padding: const EdgeInsets.all(10.0),
            width: 250,
            height: 200,
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Calendarz",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                gapH10,
                const Text(
                  "Najnowsze wydarzenia w twojej okolicy ",

                  //  softWrap: true,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
