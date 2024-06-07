class Vote {
  String postId;
  String optionId;
  String userId;

  Vote(this.optionId, this.userId, this.postId);

  Map<String, dynamic> toJson() {
    return {'postId': postId, 'optionId': optionId, 'userId': userId};
  }
}
