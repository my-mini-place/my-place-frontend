import 'package:basics/Presentation/Login_Register/components/login_box.dart';
import 'package:basics/Presentation/Login_Register/components/register_box.dart';

import 'package:flutter/material.dart';

class LoginRegisterToggle extends StatefulWidget {
  const LoginRegisterToggle({super.key});

  @override
  State<LoginRegisterToggle> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegisterToggle> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      showSignIn == true
          ? LoginBox(toggle: toggleView)
          : RegisterBox(toggle: toggleView),
    ]);
  }
}
