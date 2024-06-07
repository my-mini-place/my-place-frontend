class PostEdit {
  String id;
  String? title;
  String? content;

  PostEdit({
    required this.id,
    this.title,
    this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Title': title,
      'Content': content,
    };
  }
}
