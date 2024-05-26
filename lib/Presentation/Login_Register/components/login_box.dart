import 'package:basics/Api/Login_cubit/login_cubit.dart';
import 'package:basics/Domain/auth_entities/login.dart';
import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBox extends StatefulWidget {
  const LoginBox({
    required this.toggle,
    super.key,
  });

  final Function toggle;

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    //String? password;

    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case LoginLoading:
              setState(() {
                isLoading = true;
              });

              break;

            case LoginError:
              {
                if (isLoading == true) {
                  setState(() {
                    isLoading = false;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: const Color.fromARGB(255, 250, 135, 127),
                      content: Container(
                        color: const Color.fromARGB(255, 250, 135, 127),
                        child: const Text("Nie udało się zalogować"),
                      )));

                  context.goNamed('home');
                }
              }
              break;

            case LoginAuthorized:
              context.goNamed('home');
              break;
          }
        },
        child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: isLoading
                ? const Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : FormWidget(
                    formKey: _formKey,
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    widget: widget)));
  }
}

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
    required this.widget,
  })  : _formKey = formKey,
        _usernameController = usernameController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _usernameController;
  final TextEditingController _passwordController;
  final LoginBox widget;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () async {
                  await context
                      .read<LoginCubit>()
                      .login(Login("Admin123@gmail.com", "Admin123"));
                },
                child: const Text("Zaloguj jako admin")),
          ),
          Text("Logowanie",
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
              controller: _usernameController,
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
          ElevatedButton(
            onPressed: () async {
              String username = _usernameController.text;
              String enteredPassword = _passwordController.text;
              if (!_formKey.currentState!.validate()) {
                return;
              }
              await context
                  .read<LoginCubit>()
                  .login(Login(username, enteredPassword));
            },
            style: const ButtonStyle(
                padding: MaterialStatePropertyAll(
                    EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 15)),
                backgroundColor: MaterialStatePropertyAll(myOrange)),
            child: const Text('Login', style: TextStyle(color: Colors.white)),
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
                            "Zarejestruj się teraz.",
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
    );
  }
}
