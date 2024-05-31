import 'package:basics/Infrastructure/posts_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_post_state.dart';

@LazySingleton()
class CreatePostCubit extends Cubit<CreatePostState> {
  final PostsRepo postsRepo;

  CreatePostCubit({
    required this.postsRepo,
  }) : super(InitialCreatePost());
}
