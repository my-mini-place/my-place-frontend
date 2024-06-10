import 'package:flutter/material.dart';

class InfoEditTile extends StatefulWidget {
  const InfoEditTile(
      {super.key,
      required this.title,
      required this.description,
      required this.controller});

  final String title;
  final String description;
  final TextEditingController controller;
  @override
  State<InfoEditTile> createState() => _InfoEditTileState();
}

class _InfoEditTileState extends State<InfoEditTile> {
  late TextEditingController textEditing;

  @override
  void initState() {
    textEditing = widget.controller;
    textEditing.text = widget.description;
    super.initState();
  }

  @override
  void dispose() {
    textEditing.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          SizedBox(
            height: 40,
            child: TextFormField(
              validator: (value) {
                return null;
              },
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
              controller: textEditing,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 184, 182, 182),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
