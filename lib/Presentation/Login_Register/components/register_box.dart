import 'package:basics/Domain/value_objects/colors.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Rejestracja",
                    style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 123, 121, 121))),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'PleaseEnterText';
                      }
                      return null;
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
                  child: TextField(
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
                    // String username = _usernameController.text;
                    // String enteredPassword = _passwordController.text;
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(myOrange)),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Masz konto? "),
                        InkWell(
                            onTap: () => widget.toggle(),
                            child: const Text(
                              "Zaloguj się teraz.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
