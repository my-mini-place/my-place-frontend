class User {
  String id;
  String email;
  String name;
  String surname;

  DateTime createdAt;
  String role;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.createdAt,
    required this.role,
  });

  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'createdAt': createdAt.toIso8601String(),
      'role': role,
    };
  }
}
