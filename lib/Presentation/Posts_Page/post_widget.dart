import 'package:basics/Api/Posts/delete_post_cubit/delete_post_cubit.dart';
import 'package:basics/Domain/posts/post.dart';
import 'package:basics/Presentation/Utils/extension.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Menu { preview, share, getLink, remove, download }

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});

  final Post post;

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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Administrator"),
                  Text("24.01.2024"),
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
                                        .deletePost(post.id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('TAK'),
                                ),
                              ],
                            ),
                          );
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
              child: Text(post.content),
            ),
          ],
        ),
      ),
    );
  }
}
