import 'package:basics/Infrastructure/posts_repo.dart';
import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

part 'vote_post_state.dart';

@LazySingleton()
class VotePostCubit extends Cubit<VotePostsState> {
  final PostsRepo postsRepo;

  VotePostCubit({
    required this.postsRepo,
  }) : super(InitialVotePost());

  Future<void> votePost(String postId, String optionId) async {
    emit(VotePostsinProgres());

    final result = await postsRepo.postVote(postId, optionId);
    result.fold(
      (error) => emit(ErrorVotePost(error)),
      (posts) => emit(VotePostsSuccess()),
    );
  }
}
