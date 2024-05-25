import 'package:alert_dialog/alert_dialog.dart';
import 'package:basics/Api/Login_cubit/login_cubit.dart';
import 'package:basics/Domain/auth_entities/register.dart';

import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterBox extends StatefulWidget {
  const RegisterBox({
    required this.toggle,
    super.key,
  });

  final Function toggle;

  @override
  State<RegisterBox> createState() => _RegisterBoxState();
}

class _RegisterBoxState extends State<RegisterBox> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _repeatpasswordController =
      TextEditingController();

  bool isnotLoading = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          setState(() {
            isnotLoading = false;
          });
        }

        if (state is LoginError) {
          alert(context, title: const Text('Alert'));
          setState(() {
            isnotLoading = true;
          });
        }

        if (state is LoginAuthorized) {}
      },
      child: isnotLoading
          ? Form(
              key: _formKey,
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: Column(
                  children: [
                    Text("Rejestracja",
                        style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 123, 121, 121))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              gapH10,
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SizedBox(
                                  height: 80,
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
                                        errorMessage +=
                                            'Please enter correct email. \n';
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SizedBox(
                                  height: 80,
                                  child: TextFormField(
                                    onSaved: (String? value) {
                                      // password = value;
                                    },
                                    validator: (value) {
                                      var errorMessage = '';

                                      if (value == null || value.isEmpty) {
                                        errorMessage +=
                                            ' Please enter password\n';
                                        return errorMessage;
                                      }

                                      if (!value.contains(RegExp(r'[A-Z]'))) {
                                        errorMessage +=
                                            '• Uppercase letter is missing.\n';
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
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SizedBox(
                                  height: 80,
                                  child: TextFormField(
                                    onSaved: (String? value) {
                                      // password = value;
                                    },
                                    validator: (value) {
                                      var errorMessage = '';

                                      if (value == null || value.isEmpty) {
                                        errorMessage +=
                                            ' Please enter password\n';
                                        return errorMessage;
                                      }

                                      if (!value.contains(RegExp(r'[A-Z]'))) {
                                        errorMessage +=
                                            '• Uppercase letter is missing.\n';
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
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Container(
                            //  width: 600,
                            // color: Colors.blueAccent,
                            child: Column(
                              children: [
                                gapH10,
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    height: 80,
                                    child: TextFormField(
                                      validator: (value) {
                                        var errorMessage = '';
                                        if (value == null ||
                                            !value.isNotEmpty) {
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    height: 80,
                                    child: TextFormField(
                                      onSaved: (String? value) {
                                        // password = value;
                                      },
                                      validator: (value) {
                                        var errorMessage = '';

                                        if (value == null || value.isEmpty) {
                                          errorMessage +=
                                              ' Please enter surname\n';
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    height: 80,
                                    child: TextFormField(
                                      onSaved: (String? value) {
                                        // password = value;
                                      },
                                      validator: (value) {
                                        var errorMessage = '';

                                        if (value == null || value.isEmpty) {
                                          errorMessage +=
                                              ' Please enter number\n';
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String email = _emailController.text;
                        String enteredPassword = _passwordController.text;
                        String secondPassword = _repeatpasswordController.text;
                        String name = _nameController.text;
                        String surname = _surnameController.text;
                        String number = _numberController.text;

                        if (!_formKey.currentState!.validate()) {
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
                                const Text("Nie masz konta? "),
                                InkWell(
                                    onTap: () => widget.toggle(),
                                    child: const Text(
                                      "Rejestruj się teraz.",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () => widget.toggle(),
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
              ))
          : const CircularProgressIndicator(),
    );
  }
}
