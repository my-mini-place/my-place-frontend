import 'package:basics/Domain/posts/option.dart';

class PostCreate {
  String title;
  String content;
  bool isSurvey;
  DateTime surveyClosureDateTime;
  List<Option>? optionsWithNumVotes;

  PostCreate({
    required this.title,
    required this.content,
    required this.isSurvey,
    required this.surveyClosureDateTime,
    this.optionsWithNumVotes,
  });

  factory PostCreate.fromJson(Map<String, dynamic> json) {
    return PostCreate(
      title: json['Title'] as String,
      content: json['Content'] as String,
      isSurvey: json['IsSurvey'] as bool,
      surveyClosureDateTime:
          DateTime.parse(json['SurveyClosureDateTime'] as String),
      optionsWithNumVotes: (json['OptionsWithNumVotes'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
