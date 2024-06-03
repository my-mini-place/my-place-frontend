class Option {
  final String text;
  final int? numVotes;

  Option({required this.text, this.numVotes});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      text: json['Text'] as String,
      numVotes: json['NumVotes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'numVotes': numVotes,
    };
  }
}
