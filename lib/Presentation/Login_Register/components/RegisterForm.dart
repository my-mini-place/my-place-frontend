import 'package:basics/Api/Auth/Login_cubit/login_cubit.dart';
import 'package:basics/Domain/auth_entities/register.dart';
import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Login_Register/components/register_box.dart';
import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required this.faker,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController repeatpasswordController,
    required TextEditingController numberController,
    required TextEditingController surnameController,
    required this.widget,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _repeatpasswordController = repeatpasswordController,
        _numberController = numberController,
        _surnameController = surnameController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final Faker faker;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _repeatpasswordController;
  final TextEditingController _numberController;
  final TextEditingController _surnameController;
  final RegisterBox widget;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: FractionallySizedBox(
          widthFactor: 0.35,
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    _nameController.text = faker.animal.name();
                    _emailController.text = faker.internet.email();
                    _passwordController.text =
                        "${faker.internet.password()}1K@";
                    _repeatpasswordController.text = _passwordController.text;
                    _numberController.text = faker.phoneNumber.us();
                    _nameController.text = faker.person.name();
                    _surnameController.text = faker.person.lastName();
                  },
                  child: const Text("LOSOWE DANE")),
              Text("Rejestracja",
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 123, 121, 121))),
              gapH10,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    var errorMessage = '';
                    if (value == null || !value.isNotEmpty) {
                      errorMessage += 'Please enter email';

                      return errorMessage;
                    }

                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value);

                    if (!emailValid) {
                      errorMessage += 'Please enter correct email. \n';
                    }

                    if (errorMessage == '') {
                      return null;
                    }

                    return errorMessage;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onSaved: (String? value) {
                    // password = value;
                  },
                  validator: (value) {
                    var errorMessage = '';

                    if (value == null || value.isEmpty) {
                      errorMessage += ' Please enter password\n';
                      return errorMessage;
                    }

                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      errorMessage += '• Uppercase letter is missing.\n';
                    }

                    if (errorMessage == '') return null;
                    return errorMessage;
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onSaved: (String? value) {
                    // password = value;
                  },
                  validator: (value) {
                    var errorMessage = '';

                    if (value == null || value.isEmpty) {
                      errorMessage += ' Please enter password\n';
                      return errorMessage;
                    }

                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      errorMessage += '• Uppercase letter is missing.\n';
                    }

                    if (errorMessage == '') return null;
                    return errorMessage;
                  },
                  controller: _repeatpasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Repeat Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    var errorMessage = '';
                    if (value == null || !value.isNotEmpty) {
                      errorMessage += 'Please enter name';

                      return errorMessage;
                    }

                    if (errorMessage == '') {
                      return null;
                    }

                    return errorMessage;
                  },
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onSaved: (String? value) {
                    // password = value;
                  },
                  validator: (value) {
                    var errorMessage = '';

                    if (value == null || value.isEmpty) {
                      errorMessage += ' Please enter surname\n';
                      return errorMessage;
                    }

                    if (errorMessage == '') return null;
                    return errorMessage;
                  },
                  controller: _surnameController,
                  //  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  child: TextFormField(
                    onSaved: (String? value) {
                      // password = value;
                    },
                    validator: (value) {
                      var errorMessage = '';

                      if (value == null || value.isEmpty) {
                        errorMessage += ' Please enter number\n';
                        return errorMessage;
                      }

                      if (errorMessage == '') return null;
                      return errorMessage;
                    },
                    controller: _numberController,
                    //  obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text;
                  String enteredPassword = _passwordController.text;
                  String secondPassword = _repeatpasswordController.text;
                  String name = _nameController.text;
                  String surname = _surnameController.text;
                  String number = _numberController.text;

                  if (!_formKey.currentState!.validate() ||
                      secondPassword != enteredPassword) {
                    return;
                  }
                  await context.read<LoginCubit>().register(Register(
                      Email: email,
                      Password: enteredPassword,
                      Name: name,
                      Surname: surname,
                      PhoneNumber: number));
                },
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.only(
                        top: 15, left: 30, right: 30, bottom: 15)),
                    backgroundColor: MaterialStatePropertyAll(myOrange)),
                child: const Text('Register',
                    style: TextStyle(color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Masz konto? "),
                          InkWell(
                              onTap: () => widget.toggle(),
                              child: const Text(
                                "Zaloguj się teraz.",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            context.goNamed("forgot");
                          },
                          child: const Text(
                            "Odzyskaj hasło",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
