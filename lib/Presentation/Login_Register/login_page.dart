import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Login_Register/components/login_box.dart';
import 'package:basics/Presentation/Login_Register/login_register_toggle.dart';
import 'package:basics/Presentation/Utils/gaps.dart';
import 'package:basics/Presentation/appbar.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
//import 'package:beton/widgets/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 200,
              //   width: 200,
              //   color: Colors.red,
              // ),
              MyAppBar(),

              gapH40,

              SizedBox(height: 20),

              LoginRegisterToggle(),
            ]),
      ),
    );
  }
}
