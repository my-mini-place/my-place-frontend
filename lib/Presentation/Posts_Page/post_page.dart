import 'package:basics/Presentation/Posts_Page/post_add_dialog.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return AppPageBasics(children: [
      FractionallySizedBox(
        widthFactor: 0.40,
        child: Column(
          children: [
            gapH10,
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 194, 194, 194),
                        blurRadius: 3,
                        blurStyle: BlurStyle.inner,
                        spreadRadius: 1)
                  ]),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                            minRadius: 20,
                            backgroundImage: AssetImage('assets/icon.jpg'))),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const AddPostDialog());
                      },
                      decoration: const InputDecoration(
                          hintText: "O czym myślisz adminie? Dodaj posta!",
                          filled: true,
                          fillColor: Color.fromARGB(255, 241, 239, 239),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                  )),
                ],
              ),
            ),

            // jesli ktos jest adminem
            gapH10,
            ...List.generate(
              10,
              (index) => Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 194, 194, 194),
                          blurRadius: 3,
                          blurStyle: BlurStyle.inner,
                          spreadRadius: 1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/icon.jpg'))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Administrator"),
                              Text("24.01.2024"),
                            ],
                          )
                        ],
                      ),
                      gapH10,
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            "ROLE oin Trilogy! Top talents in AI application development are needed. Required skills include Python, SQL, Software Development, Java, JavaScript, C++, Linux, MySQL, and C#. For more details, please visit the job page. "),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck,
                              onChanged: (loool) {
                                setState(() {
                                  isCheck = !isCheck;
                                });
                              }),
                          const Text("option 1"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck,
                              onChanged: (loool) {
                                setState(() {
                                  isCheck = !isCheck;
                                });
                              }),
                          const Text("option 2"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class PostPage extends StatelessWidget {
//   final List<String> items = ['it1', 'it2', 'it3'];

//   PostPage({super.key});

//   Future refresh() async {
//     //setState(() => items.clear());
//     final url = Uri.parse(''); // URL Z kodem json postów wysyłanych z api
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final List newItems = json.decode(response.body);

//       // setState(() {
//       //   items = newItems.map<String>((item) {
//       //     final number = item['id'];

//       //     return 'Item $number'; // Tutaj zwracamy widok co tam jest w środku
//       //   }).toList();
//       // });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Grid View Example'),
//         ),
//         body: GridView.count(
//           crossAxisCount: 2, // Jeden element na szerokość
//           mainAxisSpacing: 10.0, // Odległość między elementami w pionie
//           crossAxisSpacing: 10.0, // Odległość między elementami w poziomie
//           children: List.generate(
//             15, // Liczba elementów w gridzie
//             (index) {
//               // Każdy element w gridzie
//               return GridItem(index +
//                   1); // index + 1, ponieważ indexowanie zaczyna się od 0
//             },
//           ),
//         ),
//       ),
//     );

//     // return Scaffold(
//     //     appBar: AppBar(title: const Text('Post Table')),
//     //     // body: items.isEmpty
//     // ?const Center(child: CircularProgressIndicator(),)
//     // :RefreshIndicator(
//     //   onRefresh: refresh,
//     //   child:,
//     // return GridView.count(
//     //   primary: false,
//     //   padding: const EdgeInsets.all(20),
//     //   mainAxisSpacing: 5,
//     //   crossAxisCount: 1,
//     //   children: <Widget>[
//     //     Container(
//     //       //padding: const EdgeInsets.all(8),
//     //       color: Colors.teal[100],
//     //       child: const Text("He'd have you all unravel at the"),
//     //     ),
//     //     Container(
//     //       //padding: const EdgeInsets.all(8),
//     //       color: Colors.teal[200],
//     //       child: const Text('Heed not the rabble'),
//     //     ),
//     //     Container(
//     //       //padding: const EdgeInsets.all(8),
//     //       color: Colors.teal[300],
//     //       child: const Text('Sound of screams but the'),
//     //     ),
//     //     Container(
//     //       //padding: const EdgeInsets.all(8),
//     //       color: Colors.teal[400],
//     //       child: const Text('Who scream'),
//     //     ),
//     //     Container(
//     //       //padding: const EdgeInsets.all(8),
//     //       color: Colors.teal[500],
//     //       child: const Text('Revolution is coming...'),
//     //     ),
//     //     Container(
//     //       //padding: const EdgeInsets.all(8),
//     //       color: Colors.teal[600],
//     //       child: const Text('Revolution, they...'),
//     //     ),
//     //   ],
//     // );
//   }
// }

// class GridItem extends StatelessWidget {
//   final int index;

//   const GridItem(this.index, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: const Color.fromARGB(255, 83, 174, 86),
//       child: Center(
//         heightFactor: 40,
//         child: Text(
//           'Grid $index',
//           style: const TextStyle(fontSize: 20.0),
//         ),
//       ),
//     );
//   }
// }
