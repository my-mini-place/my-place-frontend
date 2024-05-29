import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPostDialog extends StatelessWidget {
  const AddPostDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.35,
      child: Dialog(
        child: Container(
          width: 500,
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  // Dodajemy tekst wyśrodkowany w kontenerze
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Utwórz post",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      iconSize: 25,
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "O czym myslisz, Adminie?",
                      border: InputBorder.none),
                  showCursor: true,
                  maxLines: 5,
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Opublikuj"))),
            ],
          ),
        ),
      ),
    );
  }
}
