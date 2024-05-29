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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      createdAt: DateTime.parse(json['createdAt']),
      role: json['role'],
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
