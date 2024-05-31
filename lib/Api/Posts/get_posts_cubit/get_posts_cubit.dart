import 'package:basics/DI.dart';
import 'package:basics/Domain/posts/post.dart';
import 'package:basics/Infrastructure/paged_list.dart';
import 'package:basics/Infrastructure/posts_repo.dart';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'get_posts_state.dart';

@LazySingleton()
class GetPostsCubit extends Cubit<GetPostsState> {
  final PostsRepo postsRepo;

  GetPostsCubit({
    required this.postsRepo,
  }) : super(InitialGetPosts());

  Future<void> getAllPosts(int page, int pageSize) async {
    emit(LoadingGetPosts());

    final result = await postsRepo.getAllPosts(page, pageSize);
    result.fold(
      (error) => emit(ErrorGetPosts(error)),
      (posts) => emit(LoadedGetPosts(posts)),
    );
  }
}
