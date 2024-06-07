import 'package:basics/Api/Posts/create_post_cubit/create_post_cubit.dart';
import 'package:basics/Api/Posts/delete_post_cubit/delete_post_cubit.dart';
import 'package:basics/Api/Posts/edit_post_cubit/edit_post_cubit.dart';
import 'package:basics/Api/Posts/get_posts_cubit/get_posts_cubit.dart';
import 'package:basics/Api/Posts/vote_post_cubit/vote_post_cubit.dart';
import 'package:basics/Domain/posts/post.dart';
import 'package:basics/Domain/value_objects/notification.dart';
import 'package:basics/Presentation/Posts_Page/post_add_dialog.dart';
import 'package:basics/Presentation/Posts_Page/post_skeleton.dart';
import 'package:basics/Presentation/Posts_Page/post_widget.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/extension.dart';
import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  bool isCheck = true;

  @override
  void initState() {
    context.read<GetPostsCubit>().getAllPosts(page, pageSize);
    scrollController.addListener(isEnd);
    super.initState();
  }

  List<Post> posts = [];
  int page = 1;
  int pageSize = 5;

  bool isLoading = false;
  bool isNext = true;

  ScrollController scrollController = ScrollController();
  void isEnd() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<GetPostsCubit>().getAllPosts(page, pageSize);
    }
  }

  void reset() {
    posts = [];
    page = 1;
    pageSize = 5;
    isLoading = true;
    isNext = false;
    context.read<GetPostsCubit>().getAllPosts(page, pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return AppPageBasics(children: [
      MultiBlocListener(
          listeners: [
            BlocListener<EditPostCubit, EditPostState>(
                listener: (context, state) async {
              if (state is EditPostSucces) {
                NotificationManager.showSuccess(
                    context, 'Edit post', 'Your post has been edited!');

                reset();
              }

              if (state is Error) {
                NotificationManager.showError(
                    context, 'Edit post', 'EDIT POST ERROR!!! ! ! ');
              }
            }),
            BlocListener<CreatePostCubit, CreatePostState>(
                listener: (context, state) async {
              if (state is CreatePostSucces) {
                NotificationManager.showSuccess(
                    context, 'Create post', 'Your post has been created!');

                reset();
              }
            }),
            BlocListener<VotePostCubit, VotePostsState>(
                listener: (context, state) async {
              if (state is VotePostsSuccess) {
                NotificationManager.showSuccess(
                    context, 'Glosowanie', 'Zaglosowałeś właśnie w ankiecie!');
              }

              if (state is ErrorVotePost) {
                NotificationManager.showError(
                    context, 'Glosowanie', 'Zaglosowałeś nie udało się!');
              }
            }),
            BlocListener<DeletePostCubit, DeletePostState>(
                listener: (context, state) {
              if (state is DeletePostSucces) {
                reset();

                NotificationManager.showSuccess(
                    context, 'Delete', 'Your post has been deleted!');
              } else if (state is DeletePostError) {
                NotificationManager.showError(
                    context, 'Error', 'Error while deleting!');
              }
            }),
          ],
          child: BlocBuilder<GetPostsCubit, GetPostsState>(
            builder: (context, state) {
              if (state is LoadedGetPosts) {
                // posts = state.posts.items;

                isNext = state.posts.hasNextPage;
                isLoading = false;
                posts.addAll(state.posts.items);
                page++;
              }
              if (state is LoadingGetPosts) {
                isLoading = true;
              }

              if (state is ErrorGetPosts) {
                isLoading = false;
              }

              return FractionallySizedBox(
                widthFactor: 0.40,
                child: Column(
                  children: [
                    gapH10,
                    if (context.isAdmin)
                      Container(
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
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                      minRadius: 20,
                                      backgroundImage:
                                          AssetImage('assets/icon.jpg'))),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextField(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AddPostDialog(
                                            resetFunction: (context) {},
                                          ));
                                },
                                decoration: const InputDecoration(
                                    hintText:
                                        "O czym myślisz adminie? Dodaj posta!",
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 241, 239, 239),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                              ),
                            )),
                          ],
                        ),
                      ),

                    // jesli ktos jest adminem
                    gapH10,

                    !isLoading
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: posts.length,
                            itemBuilder: ((context, index) =>
                                PostWidget(post: posts[index])))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: ((context, index) =>
                                const PostSkeleton())),
                    if (!isLoading)
                      isNext
                          ? ElevatedButton(
                              onPressed: () {
                                context
                                    .read<GetPostsCubit>()
                                    .getAllPosts(page, pageSize);
                              },
                              child: const Text("Load More"))
                          : const Text("Nie ma więcej postów :(")
                  ],
                ),
              );
            },
          ))
    ]);
  }
}
