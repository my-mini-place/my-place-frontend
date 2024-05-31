import 'package:basics/Domain/posts/option.dart';

// Definicja klasy Dart dla Post
class Post {
  String id;
  String title;
  String content;
  bool isSurvey;
  DateTime? surveyClosureDateTime;
  DateTime creationDateTime;
  bool surveyClosed;
  List<Option>? optionsWithNumVotes;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.isSurvey,
    this.surveyClosureDateTime,
    required this.creationDateTime,
    required this.surveyClosed,
    this.optionsWithNumVotes,
  });

  factory Post.fromJson(dynamic json) {
    return Post(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      isSurvey: json['isSurvey'] as bool,
      surveyClosureDateTime: json['surveyClosureDateTime'] != null
          ? DateTime.parse(json['surveyClosureDateTime'] as String)
          : null,
      creationDateTime: DateTime.parse(json['creationDateTime'] as String),
      surveyClosed: json['surveyClosed'] as bool,
      optionsWithNumVotes: (json['optionsWithNumVotes'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Title': title,
      'Content': content,
      'IsSurvey': isSurvey,
      'SurveyClosureDateTime': surveyClosureDateTime,
      'CreationDateTime': creationDateTime.toIso8601String(),
      'SurveyClosed': surveyClosed,
      'OptionsWithNumVotes':
          optionsWithNumVotes?.map((e) => e.toJson()).toList(),
    };
  }
}
