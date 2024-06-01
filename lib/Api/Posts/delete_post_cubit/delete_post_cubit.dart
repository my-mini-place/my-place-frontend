import 'package:basics/Infrastructure/posts_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'delete_post_state.dart';

@LazySingleton()
class DeletePostCubit extends Cubit<DeletePostState> {
  final PostsRepo postsRepo;

  DeletePostCubit({
    required this.postsRepo,
  }) : super(DeletePostInitial());

  Future<void> deletePost(String postId) async {
    emit(DeletePostLoading());

    final result = await postsRepo.deletePost(postId);
    result.fold(
      (error) => emit(DeletePostError(error)),
      (posts) => emit(DeletePostSucces()),
    );
  }
}
