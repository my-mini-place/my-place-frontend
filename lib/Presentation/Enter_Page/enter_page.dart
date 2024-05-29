import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Domain/value_objects/options.dart';
import 'package:basics/Presentation/Enter_Page/components/categories_title.dart';
import 'package:basics/Presentation/Enter_Page/components/page_info.dart';
import 'package:basics/Presentation/Site/app_bar_changer.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:basics/Presentation/Site/footer.dart';
//import 'package:basics/Presentation/Site/app_bar_big.dart';
//import 'package:basics/Presentation/Enter_Page/components/map.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({
    super.key,
  });

  @override
  State<EnterPage> createState() => _HomePageState();
}

class _HomePageState extends State<EnterPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void loginButtononHover() {
    setState(() {
      loginbuttoncolor = const Color.fromARGB(255, 212, 96, 0);
    });
  }

  void loginButtononExit() {
    setState(() {
      loginbuttoncolor = myOrange;
    });
  }

  Color loginbuttoncolor = myOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyAppBarSwitcher(),
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 500, minHeight: 500),
                child: LayoutBuilder(builder: (context, constraints) {
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
                              onHover: (event) {
                                loginButtononHover();
                              },
                              onExit: (event) {
                                loginButtononExit();
                              },
                              child: GestureDetector(
                                onTap: () => context.go('/login'),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 100,
                                  color: loginbuttoncolor,
                                  child: const Center(
                                      child: Text(
                                    "Zaloguj się",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ]);
                }),
              ),
              gapH40,
              gapH40,
              const PageInfo(),
              gapH40,
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              gapH10,
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 20),
                  child: Text(
                    "Aktualności:",
                    style: GoogleFonts.montserrat(fontSize: 40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    // powoduje jakis prblem z odswiezaniem pewnie cała mapa sie odswieza i na nowo się zdjecia wczytują dziwne zachowanie XDD
                    ...Options.categories.map((e) => Padding(
                          padding: const EdgeInsets.all(0),
                          child: MyCategoryTile(
                              title: e.title,
                              description: e.description,
                              imagepath: e.imagepath),
                        )),
                  ],
                ),
              ),
              gapH40,
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              gapH10,
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 20),
                  child: Text(
                    "Lokalizacja:",
                    style: GoogleFonts.montserrat(fontSize: 40),
                  ),
                ),
              ),
              // Center(
              //     child: SizedBox(
              //         height: 400,
              //         width: width * 0.8,
              //         child: const MapSample())),
              gapH40,
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
