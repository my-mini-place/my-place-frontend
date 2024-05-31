import 'package:basics/DI.dart';
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
}
