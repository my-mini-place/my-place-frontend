import 'package:flutter/widgets.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Container(
            width: 400, // Stała szerokość dla Container
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 184, 182, 182),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0), // Dla odstępów wokół tekstu
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(description),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
