class Option {
  final String id;
  final String text;
  final int? numVotes;

  Option({required this.id, required this.text, this.numVotes});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['Id'] as String,
      text: json['Text'] as String,
      numVotes: json['NumVotes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Text': text,
      'NumVotes': numVotes,
    };
  }
}
