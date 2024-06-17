import 'dart:io';
import 'package:basics/DI.dart';
import 'package:basics/Infrastructure/dio_client.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/extension.dart';
import 'package:basics/app_routing.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:basics/Presentation/Documents_Page/document_service.dart';
import 'package:basics/Presentation/Documents_Page/documentclass.dart';
import 'package:basics/Presentation/Documents_Page/pdf_download.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

DioClient dioClient = getIt.get<DioClient>();

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
  List<Actor> actors = [];
  @override
  void initState() {
    super.initState();
    callFetchDocuments();
  }

  Future<void> callFetchDocuments() async {
    DocumentService documentService = DocumentService();
    try {
      List<Document> documents = await documentService.fetchDocuments();
      for (var document in documents) {
        actors.add(Actor(
            signed: document.signed,
            name: document.name,
            description: document.description,
            date: document.creationDate,
            documentid: document.documentId));
      }
    } catch (e) {
      print('Error fetching documents: $e');
    }
  }
  //   Actor(
  //       id: 12,
  //       date: DateTime(2023, 6, 30),
  //       name: 'Leonardo',
  //       lastName: 'DiCaprio'),
  //   Actor(
  //       id: 11, date: DateTime(2023, 6, 30), name: 'Johnny', lastName: 'Depp'),
  //   Actor(
  //       id: 10,
  //       date: DateTime(2023, 6, 30),
  //       name: 'Robert',
  //       lastName: 'De Niro'),
  //   Actor(id: 9, date: DateTime(2023, 6, 30), name: 'Tom', lastName: 'Hardy'),
  //   Actor(
  //       id: 8,
  //       date: DateTime(2023, 6, 30),
  //       name: 'Denzel',
  //       lastName: 'Washington'),
  //   Actor(id: 7, date: DateTime(2023, 6, 30), name: 'Ben', lastName: 'Affleck'),
  // ];

  // final Map<String, List<Actor>> mapOfActors = {
  //   'test 1': [
  //     Actor(
  //         id: 6,
  //         date: DateTime(2023, 7, 30),
  //         name: 'Leonardo',
  //         lastName: 'DiCaprio'),
  //     Actor(
  //         id: 5,
  //         date: DateTime(2023, 6, 2),
  //         name: 'Denzel',
  //         lastName: 'Washington'),
  //     Actor(
  //         id: 4,
  //         date: DateTime(2021, 11, 30),
  //         name: 'Ben',
  //         lastName: 'Affleck'),
  //   ],
  //   'test 2': [
  //     Actor(
  //         id: 1, date: DateTime(2023, 5, 11), name: 'Johnny', lastName: 'Depp'),
  //     Actor(
  //         id: 2,
  //         date: DateTime(2022, 6, 10),
  //         name: 'Robert',
  //         lastName: 'De Niro'),
  //     Actor(id: 3, date: DateTime(2023, 6, 30), name: 'Tom', lastName: 'Hardy'),
  //   ]
  //};

  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 1000,
      child: Column(
        children: [
          const SizedBox(
            width: 600,
            height: 50,
          ),
          if (context.isAdmin)
            GestureDetector(
              onTap: () async {
                var result = (await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                  withData: true,
                  compressionQuality: 30,
                  onFileLoading: (FilePickerStatus status) => print(status),
                ));
                if (result != null) {
                  PlatformFile file = result.files.first;
                  //    file.bytes

                  // Encode the file content to UTF-8

                  // Prepare the payload
                  final payload = {
                    "documentId": 100, // adjust as necessary
                    "userId": -4, // adjust as necessary
                    "content": base64Encode(file.bytes!),
                    "name": file.name,
                    "signed": true, // adjust as necessary
                    "description":
                        "Uploaded through app", // adjust as necessary
                    "creation_date": DateTime.now().toIso8601String()
                  };

                  try {
                    final response = await dioClient.dio.post(
                      'https://localhost:7281/AddDocumentToDb',
                      data: jsonEncode(payload),
                      options: Options(
                          headers: {'Content-Type': 'application/json'}),
                    );
                    print('Upload successful: ${response.data}');
                  } catch (e) {
                    print('Error uploading file: $e');
                  }

                  //  print(file.path);
                } else {
                  // User canceled the picker
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text('Dodaj Dokument'),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: renderSimpleSearchableList(),
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: ElevatedButton(
          //     onPressed: addActor,
          //     child: const Text('Add actor'),
          //   ),
          // )
        ],
      ),
    );
  }

  void addActor(
      bool signed, String name, DateTime date, String description, int id) {
    actors.add(Actor(
      documentid: id,
      signed: signed,
      date: date,
      description: description,
      name: name,
    ));
    setState(() {});
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
                  'Name: ${actor.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Description: ${actor.description}',
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
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Akcja, którą chcesz wykonać po kliknięciu
                fetchPdf(context, actor.documentid);
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
  bool signed;
  int documentid;
  String name;
  String description;
  DateTime date;

  Actor({
    required this.documentid,
    required this.signed,
    required this.name,
    required this.description,
    required this.date,
  });
}
