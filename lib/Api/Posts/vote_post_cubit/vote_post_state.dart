part of 'vote_post_cubit.dart';

abstract class VotePostsState {}

class InitialVotePost extends VotePostsState {}

class VotePostsinProgres extends VotePostsState {}

class ErrorVotePost extends VotePostsState {
  String errorMessage;

  ErrorVotePost(this.errorMessage);
}

class VotePostsSuccess extends VotePostsState {}
