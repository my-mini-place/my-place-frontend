import 'package:basics/Domain/value_objects/options.dart';
import 'package:basics/Presentation/Enter_Page/components/categories_title.dart';
import 'package:basics/Presentation/Enter_Page/components/page_info.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:basics/Presentation/appBar.dart';

import 'package:flutter/material.dart';

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
              const MyAppBar(),
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 600, minHeight: 600),
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
              page_info(blockvalue: blockvalue, residencevalue: residencevalue),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    // powoduje jakis prblem z odswiezaniem pewnie cała mapa sie odswieza i na nowo się zdjecia wczytują dziwne zachowanie XDD
                    // ...Options.categories.map((e) => Padding(
                    //       padding: const EdgeInsets.all(0),
                    //       child: MyCategoryTile(
                    //           title: e.title,
                    //           description: e.description,
                    //           imagepath: e.imagepath),
                    //     )),

                    MyCategoryTile(
                        title: Options.categories[0].title,
                        description: Options.categories[0].description,
                        imagepath: Options.categories[0].imagepath),
                    MyCategoryTile(
                        title: Options.categories[1].title,
                        description: Options.categories[1].description,
                        imagepath: Options.categories[1].imagepath),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: MyCategoryTile(
                    //       title: Options.categories[2].title,
                    //       description: Options.categories[2].description,
                    //       imagepath: Options.categories[2].imagepath),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyCategoryTile(
                          title: Options.categories[3].title,
                          description: Options.categories[3].description,
                          imagepath: Options.categories[3].imagepath),
                    )
                  ],
                ),
              ),
              gapH40,
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
