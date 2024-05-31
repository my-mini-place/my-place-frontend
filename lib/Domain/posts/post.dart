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

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['Id'] as String,
      title: json['Title'] as String,
      content: json['Content'] as String,
      isSurvey: json['IsSurvey'] as bool,
      surveyClosureDateTime: json['SurveyClosureDateTime'] != null
          ? DateTime.parse(json['SurveyClosurePublicDateTime'] as String)
          : null,
      creationDateTime: DateTime.parse(json['CreationDateTime'] as String),
      surveyClosed: json['SurveyClosed'] as bool,
      optionsWithNumVotes: (json['OptionsWithNumVotes'] as List<dynamic>?)
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
