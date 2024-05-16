import 'package:basics/Presentation/Enter_Page/components/logo_widget.dart';
import 'package:basics/Presentation/Home/homepage.dart';

import 'package:flutter/material.dart';
//import 'package:beton/widgets/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const LogoWidget(
        fontSize: 35,
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
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
                String username = _usernameController.text;
                String enteredPassword = _passwordController.text;
                if ("" == username) {
                  if ("" == enteredPassword) {
                    //double balance = userData['balance'];
                    // Poprawne hasło - logowanie udane
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        //builder: (context) => CreateBetPage(),
                        builder: (context) => const MainPage(),
                      ),
                    );
                  } else {
                    // Nieprawidłowe hasło
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content:
                            Text('Authentication failed. Incorrect password.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                } else {
                  // Użytkownik o podanej nazwie nie istnieje
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content:
                          Text('User not found. Please check your username.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
