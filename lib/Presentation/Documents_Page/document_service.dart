import 'dart:convert';
import 'package:http/http.dart' as http;
import 'documentclass.dart';

class DocumentService {
  final String apiUrl = 'https://localhost:7281/api/Document/getDocuments';

  Future<List<Document>> fetchDocuments() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Document> documents =
          body.map((dynamic item) => Document.fromJson(item)).toList();
      return documents;
    } else {
      throw Exception('Failed to load documents');
    }
  }
}
