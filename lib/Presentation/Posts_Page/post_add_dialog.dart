import 'package:basics/Api/Posts/create_post_cubit/create_post_cubit.dart';
import 'package:basics/Api/Posts/get_posts_cubit/get_posts_cubit.dart';
import 'package:basics/Domain/posts/option.dart';
import 'package:basics/Domain/posts/option_create.dart';
import 'package:basics/Domain/posts/postcreate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

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
  final TextEditingController _optionController = TextEditingController();
  bool isSurvey = false;
  final textFieldKey = GlobalKey();
  List<OptionCreate> options = [];
  late TextEditingController _controller;
  late DateTime _selectedDate;

  void addOption() {
    if (_optionController.text.isNotEmpty && options.length < 3) {
      setState(() {
        options.add(OptionCreate(text: _optionController.text));
        _optionController.clear();
      });
    }
  }

  void removeOption(int index) {
    setState(() {
      options.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now().add(const Duration(days: 1));
    _controller =
        TextEditingController(text: _selectedDate.toString().split(' ')[0]);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      // heightFactor: 0.60,

      child: Dialog(
        child: Container(
          width: 600,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: const EdgeInsets.all(10.0),
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
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                      hintText: "O czym myslisz, Adminie?",
                      border: InputBorder.none),
                  showCursor: true,
                  maxLines: 6,
                ),
              ),

              Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSurvey,
                        onChanged: (value) => (setState(() {
                          isSurvey = !isSurvey;
                        })),
                      ),
                      const Text("Post z ankietą"),
                    ],
                  )),

              if (isSurvey) ...[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(23.0),
                      child: TextField(
                        key: textFieldKey,
                        controller: _controller,
                        onTap: () async {
                          final pickedDate = await showWebDatePicker(
                            width: 300,

                            context: textFieldKey.currentContext!,
                            initialDate: _selectedDate,
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 7)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 14000)),
                            //width: 300,
                            //withoutActionButtons: true,
                            //weekendDaysColor: Colors.red,
                            //firstDayOfWeekIndex: 1,
                          );
                          if (pickedDate != null) {
                            _selectedDate = pickedDate;
                            _controller.text = DateFormat('yyyy-MM-dd – kk:mm')
                                .format(pickedDate);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _optionController,
                          decoration: InputDecoration(
                            labelText: 'Dodaj opcję ankiety',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: addOption,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.only(top: 20, left: 25, right: 20),
                      title: Text(options[index].text),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () => removeOption(index),
                      ),
                    );
                  },
                ),
              ],
              //   const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<CreatePostCubit>().createPost(PostCreate(
                            surveyClosureDateTime: _selectedDate,
                            optionsWithNumVotes: options,
                            title: _titleController.text,
                            content: _contentController.text,
                            isSurvey: options.isEmpty ? false : true));

                        Navigator.pop(context);
                      },
                      child: const Text("Opublikuj")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
