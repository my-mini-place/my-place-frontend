import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatelessWidget {
  List<String> items = ['it1', 'it2', 'it3'];

  Future refresh() async {
    //setState(() => items.clear());
    final url = Uri.parse(''); // URL Z kodem json postów wysyłanych z api
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      // setState(() {
      //   items = newItems.map<String>((item) {
      //     final number = item['id'];

      //     return 'Item $number'; // Tutaj zwracamy widok co tam jest w środku
      //   }).toList();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid View Example'),
        ),
        body: GridView.count(
          crossAxisCount: 2, // Jeden element na szerokość
          mainAxisSpacing: 10.0, // Odległość między elementami w pionie
          crossAxisSpacing: 10.0, // Odległość między elementami w poziomie
          children: List.generate(
            15, // Liczba elementów w gridzie
            (index) {
              // Każdy element w gridzie
              return GridItem(index +
                  1); // index + 1, ponieważ indexowanie zaczyna się od 0
            },
          ),
        ),
      ),
    );

    // return Scaffold(
    //     appBar: AppBar(title: const Text('Post Table')),
    //     // body: items.isEmpty
    // ?const Center(child: CircularProgressIndicator(),)
    // :RefreshIndicator(
    //   onRefresh: refresh,
    //   child:,
    // return GridView.count(
    //   primary: false,
    //   padding: const EdgeInsets.all(20),
    //   mainAxisSpacing: 5,
    //   crossAxisCount: 1,
    //   children: <Widget>[
    //     Container(
    //       //padding: const EdgeInsets.all(8),
    //       color: Colors.teal[100],
    //       child: const Text("He'd have you all unravel at the"),
    //     ),
    //     Container(
    //       //padding: const EdgeInsets.all(8),
    //       color: Colors.teal[200],
    //       child: const Text('Heed not the rabble'),
    //     ),
    //     Container(
    //       //padding: const EdgeInsets.all(8),
    //       color: Colors.teal[300],
    //       child: const Text('Sound of screams but the'),
    //     ),
    //     Container(
    //       //padding: const EdgeInsets.all(8),
    //       color: Colors.teal[400],
    //       child: const Text('Who scream'),
    //     ),
    //     Container(
    //       //padding: const EdgeInsets.all(8),
    //       color: Colors.teal[500],
    //       child: const Text('Revolution is coming...'),
    //     ),
    //     Container(
    //       //padding: const EdgeInsets.all(8),
    //       color: Colors.teal[600],
    //       child: const Text('Revolution, they...'),
    //     ),
    //   ],
    // );
  }
}

class GridItem extends StatelessWidget {
  final int index;

  GridItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 83, 174, 86),
      child: Center(
        heightFactor: 40,
        child: Text(
          'Grid $index',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
