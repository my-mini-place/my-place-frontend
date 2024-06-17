import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> fetchPdf(BuildContext context, int id) async {
  final String apiUrl =
      'https://localhost:7281/getDocumentById$id'; // Zamień na odpowiedni URL API

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String base64Content = responseData['content'];
      final String fileName = responseData['name'];

      // Dekodowanie zawartości PDF z base64
      Uint8List pdfBytes = base64.decode(base64Content);

      // Pobranie ścieżki do katalogu tymczasowego
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/$fileName.pdf';

      // Zapisanie pliku PDF na urządzeniu
      final file = File(filePath);
      await file.writeAsBytes(pdfBytes);

      // Wyświetlenie komunikatu po zapisaniu pliku
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Plik PDF został zapisany: $filePath')),
      );
    } else {
      throw Exception('Failed to load PDF');
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Wystąpił błąd podczas pobierania pliku PDF')),
    );
  }
}
