import 'package:basics/Presentation/Login_Register/login_register_toggle.dart';

import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/gaps.dart';

import 'package:flutter/material.dart';

//import 'package:beton/widgets/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final TextEditingController _passwordController = TextEditingController();

  // final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const AppPageBasics(children: [
      gapH40,
      gapH40,
      SizedBox(height: 20),
      LoginRegisterToggle(),
      SizedBox(
        height: 100,
      )
    ]);
  }
}
