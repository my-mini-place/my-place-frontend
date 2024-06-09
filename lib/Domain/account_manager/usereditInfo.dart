import 'dart:convert';


class UserEditInfo {
  final String id;
  final String? email;
  final String? name;
  final String? surname;
  final String? phoneNumber;
  UserEditInfo({
    required this.id,
    this.email,
    this.name,
    this.surname,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserEditInfo.fromMap(Map<String, dynamic> map) {
    return UserEditInfo(
      id: map['id'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      surname: map['surname'] != null ? map['surname'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEditInfo.fromJson(String source) =>
      UserEditInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
