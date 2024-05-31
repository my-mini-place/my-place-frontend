import 'package:basics/Infrastructure/posts_repo.dart';
import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';

part 'vote_post_state.dart';

@LazySingleton()
class VotePostCubit extends Cubit<VotePostState> {
  final PostsRepo postsRepo;

  VotePostCubit({
    required this.postsRepo,
  }) : super(InitialVotePost());
}
