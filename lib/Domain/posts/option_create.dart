class OptionCreate {
  final String text;
  final int? numVotes;

  OptionCreate({required this.text, this.numVotes});

  factory OptionCreate.fromJson(Map<String, dynamic> json) {
    return OptionCreate(
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
