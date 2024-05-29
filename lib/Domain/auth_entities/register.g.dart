// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterImpl _$$RegisterImplFromJson(Map<String, dynamic> json) =>
    _$RegisterImpl(
      Email: json['Email'] as String,
      Password: json['Password'] as String,
      Name: json['Name'] as String,
      Surname: json['Surname'] as String,
      PhoneNumber: json['PhoneNumber'] as String,
    );

Map<String, dynamic> _$$RegisterImplToJson(_$RegisterImpl instance) =>
    <String, dynamic>{
      'Email': instance.Email,
      'Password': instance.Password,
      'Name': instance.Name,
      'Surname': instance.Surname,
      'PhoneNumber': instance.PhoneNumber,
    };
