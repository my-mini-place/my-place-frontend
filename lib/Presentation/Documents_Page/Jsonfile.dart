part of "documentclass.dart";

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return Document(
    documentId: json['documentId'] as int,
    name: json['name'] as String,
    signed: json['signed'] as bool,
    description: json['description'] as String,
    creationDate: DateTime.parse(json['creation_date'] as String),
  );
}

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'signed': instance.signed,
      'description': instance.description,
      'creation_date': instance.creationDate.toIso8601String(),
    };
