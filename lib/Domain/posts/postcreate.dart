import 'package:basics/Domain/posts/option.dart';
import 'package:basics/Domain/posts/option_create.dart';

class PostCreate {
  String title;
  String content;
  bool isSurvey;
  DateTime? surveyClosureDateTime;
  List<OptionCreate>? optionsWithNumVotes;

  PostCreate({
    required this.title,
    required this.content,
    required this.isSurvey,
    this.surveyClosureDateTime,
    this.optionsWithNumVotes,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'isSurvey': isSurvey,
      'surveyClosureDateTime': surveyClosureDateTime?.toIso8601String(),
      'optionsWithNumVotes':
          optionsWithNumVotes?.map((option) => option.toJson()).toList(),
    };
  }
}
