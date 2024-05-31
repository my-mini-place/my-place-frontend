import 'package:basics/Domain/account_manager/residence.dart';

class UserFullInfo {
  final String id;
  final String email;
  final String name;
  final String surname;
  final String phoneNumber;
  final Residence? residence;
  final Duration? startWorkTime;
  final Duration? endWorkTime;
  final String? blockName;
  final String role;
  final int status;

  UserFullInfo({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    this.residence,
    this.startWorkTime,
    this.endWorkTime,
    this.blockName,
    required this.role,
    required this.status,
  });

  factory UserFullInfo.fromJson(Map<String, dynamic> json) {
    return UserFullInfo(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      surname: json['surname'],
      phoneNumber: json['phoneNumber'],
      residence: json['residence'] != null
          ? Residence.fromJson(json['residence'])
          : null,
      startWorkTime: json['startWorkTime'] != null
          ? Duration(seconds: json['startWorkTime'])
          : null,
      endWorkTime: json['endWorkTime'] != null
          ? Duration(seconds: json['endWorkTime'])
          : null,
      blockName: json['blockName'],
      role: json['role'],
      status: json['status'],
    );
  }
}

UserFullInfo userBasics = UserFullInfo(
  id: '',
  email: '',
  name: '',
  surname: '',
  phoneNumber: '',
  residence: null,
  startWorkTime: null,
  endWorkTime: null,
  blockName: null,
  role: '',
  status: 0,
);
