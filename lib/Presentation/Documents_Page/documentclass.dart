import 'package:json_annotation/json_annotation.dart';

part 'Jsonfile.dart';

@JsonSerializable()
class Document {
  @JsonKey(name: 'DocumentId')
  final int documentId;
  final String name;
  final bool signed;
  final String description;
  @JsonKey(name: 'creation_date')
  final DateTime creationDate;

  Document({
    required this.documentId,
    required this.name,
    required this.signed,
    required this.description,
    required this.creationDate,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
