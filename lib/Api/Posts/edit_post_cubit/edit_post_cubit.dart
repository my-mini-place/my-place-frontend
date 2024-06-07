import 'package:basics/Domain/posts/postedit.dart';
import 'package:basics/Infrastructure/posts_repo.dart';
import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

part 'edit_post_state.dart';

@LazySingleton()
class EditPostCubit extends Cubit<EditPostState> {
  final PostsRepo postsRepo;

  EditPostCubit({
    required this.postsRepo,
  }) : super(EditPostInitial());

  Future<void> EditPost(PostEdit postEdit) async {
    emit(EditPostLoading());

    final result = await postsRepo.editPost(postEdit);
    result.fold(
      (error) => emit(EditPostError(error)),
      (posts) => emit(EditPostSucces()),
    );
  }
}
