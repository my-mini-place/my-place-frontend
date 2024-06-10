import 'dart:io';

import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/extension.dart';
import 'package:basics/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return const AppPageBasics(children: [
      ExampleApp(),
    ]);
  }
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final List<Actor> actors = [
    Actor(
        id: 12,
        date: DateTime(2023, 6, 30),
        name: 'Leonardo',
        lastName: 'DiCaprio'),
    Actor(
        id: 11, date: DateTime(2023, 6, 30), name: 'Johnny', lastName: 'Depp'),
    Actor(
        id: 10,
        date: DateTime(2023, 6, 30),
        name: 'Robert',
        lastName: 'De Niro'),
    Actor(id: 9, date: DateTime(2023, 6, 30), name: 'Tom', lastName: 'Hardy'),
    Actor(
        id: 8,
        date: DateTime(2023, 6, 30),
        name: 'Denzel',
        lastName: 'Washington'),
    Actor(id: 7, date: DateTime(2023, 6, 30), name: 'Ben', lastName: 'Affleck'),
  ];

  final Map<String, List<Actor>> mapOfActors = {
    'test 1': [
      Actor(
          id: 6,
          date: DateTime(2023, 7, 30),
          name: 'Leonardo',
          lastName: 'DiCaprio'),
      Actor(
          id: 5,
          date: DateTime(2023, 6, 2),
          name: 'Denzel',
          lastName: 'Washington'),
      Actor(
          id: 4,
          date: DateTime(2021, 11, 30),
          name: 'Ben',
          lastName: 'Affleck'),
    ],
    'test 2': [
      Actor(
          id: 1, date: DateTime(2023, 5, 11), name: 'Johnny', lastName: 'Depp'),
      Actor(
          id: 2,
          date: DateTime(2022, 6, 10),
          name: 'Robert',
          lastName: 'De Niro'),
      Actor(id: 3, date: DateTime(2023, 6, 30), name: 'Tom', lastName: 'Hardy'),
    ]
  };

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 1000,
      child: Column(
        children: [
          SizedBox(
            width: 600,
            height: 50,
          ),
          if (context.isAdmin)
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.custom, allowedExtensions: ['pdf']);
                if (result != null) {
                  PlatformFile file = result.files.first;
                  print('Szczur');
                  print(file.path);

                  if (file.path != null) {
                    String path = file.path!;
                    print('Szczur');

                    // Prepare the request
                    var request = http.MultipartRequest(
                      'POST',
                      Uri.parse(
                          'https://localhost:7281/swagger/index.html/AddDocumentToDb'),
                    );
                    print('Szczur');

                    // Add the file to the request
                    request.files.add(await http.MultipartFile.fromPath(
                      'file',
                      path,
                      contentType: MediaType('application', 'pdf'),
                    ));

                    // Add other fields (e.g., name, lastName, date)
                    request.fields['firstName'] = 'John';
                    request.fields['lastName'] = 'Doe';
                    request.fields['date'] = DateTime.now().toString();

                    // Send the request
                    var response = await request.send();

                    if (response.statusCode == 200) {
                      print('File uploaded successfully');
                    }
                  } else {
                    print('File upload failed with status: 1');
                  }

                  // Możesz dodać swoją logikę przetwarzania pliku PDF tutaj
                } else {
                  // Użytkownik anulował wybieranie pliku
                }
                // Akcja po kliknięciu na "Dodaj Nowy Dokument"
                print('Dodaj Nowy Dokument clicked');
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Dodaj Dokument'),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: renderSimpleSearchableList(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: addActor,
              child: const Text('Add actor'),
            ),
          )
        ],
      ),
    );
  }

  void addActor() {
    actors.add(Actor(
      id: 0,
      date: DateTime(2023, 6, 10),
      lastName: 'Ali',
      name: 'ALi',
    ));
    setState(() {});
  }

  Widget simpleSearchWithSort() {
    return SearchableList<Actor>(
      sortPredicate: (a, b) => a.date.compareTo(b.date),
      itemBuilder: (item) {
        return ActorItem(actor: item);
      },
      initialList: actors,
      inputDecoration: InputDecoration(
        labelText: "Search Actor",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget renderSimpleSearchableList() {
    return SearchableList<Actor>(
      seperatorBuilder: (context, index) {
        return const Divider();
      },
      style: const TextStyle(fontSize: 25),
      itemBuilder: (item) {
        return ActorItem(actor: item);
      },
      errorWidget: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Error while fetching actors')
        ],
      ),
      initialList: actors,
      filter: (p0) {
        return actors.where((element) => element.name.contains(p0)).toList();
      },
      emptyWidget: const EmptyView(),
      onRefresh: () async {},
      onItemSelected: (Actor item) {},
      inputDecoration: InputDecoration(
        labelText: "Search Actor",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      closeKeyboardWhenScrolling: true,
    );
  }

  Widget sliverListViewBuilder() {
    return SearchableList<Actor>.sliver(
      initialList: actors,
      inputDecoration: InputDecoration(
        labelText: "Search Actor",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      filter: (query) {
        return actors.where((element) => element.name.contains(query)).toList();
      },
      itemBuilder: (Actor actorItem) {
        return ActorItem(actor: actorItem);
      },
      sortWidget: const Icon(Icons.sort),
      sortPredicate: (a, b) {
        return a.date.compareTo(b.date);
      },
    );
  }

  Widget renderAsynchSearchableListview() {
    return SearchableList<Actor>.async(
      itemBuilder: (Actor item) {
        return ActorItem(actor: item);
      },
      asyncListCallback: () async {
        await Future.delayed(const Duration(seconds: 5));
        return actors;
      },
      asyncListFilter: (query, list) {
        return actors
            .where((element) =>
                element.name.contains(query) ||
                element.lastName.contains(query))
            .toList();
      },
      seperatorBuilder: (context, index) {
        return const Divider();
      },
      style: const TextStyle(fontSize: 25),
      emptyWidget: const EmptyView(),
      inputDecoration: InputDecoration(
        labelText: "Search Actor",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget expansionSearchableList() {
    return SearchableList<Actor>.expansion(
      expansionListData: mapOfActors,
      expansionTitleBuilder: (p0) {
        return Container(
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width * 0.8,
          height: 30,
          child: Center(
            child: Text(p0.toString()),
          ),
        );
      },
      filterExpansionData: (p0) {
        final filteredMap = {
          for (final entry in mapOfActors.entries)
            entry.key: (mapOfActors[entry.key] ?? [])
                .where((element) => element.name.contains(p0))
                .toList()
        };
        return filteredMap;
      },
      style: const TextStyle(fontSize: 25),
      expansionListBuilder: (int index, Actor actor) {
        return ActorItem(
          actor: actor,
        );
      },
      hideEmptyExpansionItems: true,
      emptyWidget: const EmptyView(),
      inputDecoration: InputDecoration(
        labelText: "Search User",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ActorItem extends StatelessWidget {
  final Actor actor;

  const ActorItem({
    super.key,
    required this.actor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Firstname: ${actor.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lastname: ${actor.lastName}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Date of Document: ${actor.date}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 100,
            ),
            GestureDetector(
              onTap: () {
                // Akcja, którą chcesz wykonać po kliknięciu
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  'PDF File',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no actor is found with this name'),
      ],
    );
  }
}

class Actor {
  int id;
  String name;
  String lastName;
  DateTime date;

  Actor({
    required this.id,
    required this.name,
    required this.lastName,
    required this.date,
  });
}
