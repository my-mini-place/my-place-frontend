class Option {
  final String id;
  final String text;
  final int? numVotes;

  Option({required this.id, required this.text, this.numVotes});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] as String,
      text: json['text'] as String,
      numVotes: json['numVotes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'numVotes': numVotes,
    };
  }
}
