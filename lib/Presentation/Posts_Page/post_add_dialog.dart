import 'package:basics/Api/Posts/create_post_cubit/create_post_cubit.dart';
import 'package:basics/Api/Posts/get_posts_cubit/get_posts_cubit.dart';
import 'package:basics/Domain/posts/postcreate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

class AddPostDialog extends StatefulWidget {
  const AddPostDialog({
    required this.resetFunction,
    super.key,
  });

  final Function resetFunction;

  @override
  State<AddPostDialog> createState() => _AddPostDialogState();
}

class _AddPostDialogState extends State<AddPostDialog> {
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

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
                        "Utwórz post",
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
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<CreatePostCubit>().createPost(PostCreate(
                            title: _titleController.text,
                            content: _contentController.text,
                            isSurvey: false));

                        Navigator.pop(context);
                      },
                      child: const Text("Opublikuj"))),
            ],
          ),
        ),
      ),
    );
  }
}
