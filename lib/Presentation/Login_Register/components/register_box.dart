import 'package:alert_dialog/alert_dialog.dart';
import 'package:basics/Api/Auth/Login_cubit/login_cubit.dart';

import 'package:basics/Presentation/Login_Register/components/RegisterForm.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:faker/faker.dart';
import 'package:lottie/lottie.dart';

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

  var faker = Faker();
  bool isnotLoading = true;

  late Widget FormWidget = RegisterForm(
      formKey: _formKey,
      nameController: _nameController,
      faker: faker,
      emailController: _emailController,
      passwordController: _passwordController,
      repeatpasswordController: _repeatpasswordController,
      numberController: _numberController,
      surnameController: _surnameController,
      widget: widget);

  late Widget MainWidget = FormWidget;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          setState(() {
            MainWidget = const CircularProgressIndicator();
          });
        }

        if (state is LoginError) {
          alert(context, title: const Text('Alert'));
          setState(() {
            MainWidget = FormWidget;
          });
        }

        if (state is LoginAuthorized) {
          setState(() {
            MainWidget = SizedBox(
                width: 200,
                height: 300,
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/RegisterDone.json',
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Rejestracja powiodła się! Zaloguj się!",
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                  ],
                ));
          });

          Future.delayed(const Duration(seconds: 4), () {
            widget.toggle();
          });
        }
      },
      child: MainWidget,
    );
  }
}
