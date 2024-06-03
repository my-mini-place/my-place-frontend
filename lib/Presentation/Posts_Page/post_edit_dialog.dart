import 'package:basics/Api/Posts/edit_post_cubit/edit_post_cubit.dart';

import 'package:basics/Domain/posts/post.dart';

import 'package:basics/Domain/posts/postedit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPostDialog extends StatefulWidget {
  const EditPostDialog({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  State<EditPostDialog> createState() => _EditPostDialogState();
}

class _EditPostDialogState extends State<EditPostDialog> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    _contentController.text = widget.post.content;
    _titleController.text = widget.post.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.60,
      child: Dialog(
        child: Container(
          width: 600,
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  // Dodajemy tekst wyśrodkowany w kontenerze
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Edytuj post",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                      hintText: "Tytuł postu", border: InputBorder.none),
                  showCursor: true,
                  maxLines: 1,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                      hintText: "O czym myslisz, Adminie?",
                      border: InputBorder.none),
                  showCursor: true,
                  maxLines: 5,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      context.read<EditPostCubit>().EditPost(PostEdit(
                            id: widget.post.id,
                            title: _titleController.text,
                            content: _contentController.text,
                          ));

                      Navigator.pop(context);
                    },
                    child: const Text("Edytuj")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
