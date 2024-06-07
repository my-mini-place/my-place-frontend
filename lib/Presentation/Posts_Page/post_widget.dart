import 'package:basics/Api/Posts/delete_post_cubit/delete_post_cubit.dart';
import 'package:basics/Api/Posts/vote_post_cubit/vote_post_cubit.dart';
import 'package:basics/Domain/logoutevent.dart';
import 'package:basics/Domain/posts/post.dart';
import 'package:basics/Presentation/Posts_Page/post_edit_dialog.dart';
import 'package:basics/Presentation/Utils/extension.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

enum Menu { preview, share, getLink, remove, download }

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.post});

  final Post post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  String chooseId = "";
  late List<bool> optionsvalues;

  String? uservote;

  @override
  void initState() {
    optionsvalues = widget.post.isSurvey
        ? widget.post.optionsWithNumVotes!.map((e) => false).toList()
        : List.empty();

    if (context.isResident) {
      uservote =
          widget.post.UserVote != "don't vote" ? widget.post.UserVote : null;

      if (uservote != null) {
        for (int i = 0; i < widget.post.optionsWithNumVotes!.length; i++) {
          if (widget.post.optionsWithNumVotes![i].id == uservote) {
            optionsvalues[i] = true;
            break;
          }
        }
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 194, 194, 194),
                blurRadius: 3,
                blurStyle: BlurStyle.inner,
                spreadRadius: 1)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                        backgroundImage: AssetImage('assets/icon.jpg'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Administrator"),
                  Text(DateFormat('yyyy-MM-dd – kk:mm')
                      .format(widget.post.creationDateTime)),
                ],
              ),
              const Spacer(),
              if (context.isAdmin)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        popupMenuTheme:
                            const PopupMenuThemeData(color: Colors.white)),
                    child: PopupMenuButton<Menu>(
                      icon: const Icon(Icons.more_vert),
                      onSelected: (Menu item) {
                        if (item == Menu.remove) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Usuwanie posta'), //
                              content:
                                  const Text('Na pewno chcesz usunąc post?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // wziete z flutter widget catalog
                                  }, // function used to perform after pressing the button
                                  child: const Text('NIE'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<DeletePostCubit>()
                                        .deletePost(widget.post.id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('TAK'),
                                ),
                              ],
                            ),
                          );
                        }

                        if (item == Menu.preview) {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  EditPostDialog(post: widget.post));
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Menu>>[
                        const PopupMenuItem<Menu>(
                          value: Menu.preview,
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                          ),
                        ),
                        const PopupMenuDivider(),
                        const PopupMenuItem<Menu>(
                          value: Menu.remove,
                          child: ListTile(
                            leading: Icon(Icons.delete_outline),
                            title: Text('Remove'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ]),
            gapH10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.post.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.post.content,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            if (widget.post.isSurvey)
              Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.post.optionsWithNumVotes!.length,
                      itemBuilder: (context, index) => CheckboxListTile(
                            enabled: context.isResident ? true : false,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: const EdgeInsets.only(
                                top: 20, left: 25, right: 20),
                            title: Text(
                                widget.post.optionsWithNumVotes![index].text),
                            secondary: context.isAdmin
                                ? Text(
                                    " Votes: ${widget.post.optionsWithNumVotes![index].numVotes}")
                                : null,
                            value: optionsvalues[index],
                            onChanged: (value) {
                              setState(() {
                                optionsvalues[index] = !optionsvalues[index];

                                if (optionsvalues[index] == true) {
                                  chooseId = widget
                                      .post.optionsWithNumVotes![index].id;
                                }

                                for (int i = 0; i < optionsvalues.length; i++) {
                                  if (i != index) {
                                    optionsvalues[i] = false;
                                  }
                                }
                              });
                            },
                          )),
                  if (context.isResident)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<VotePostCubit>()
                                .votePost(widget.post.id, chooseId);
                          },
                          child: const Text("Prześlij Glos")),
                    ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
