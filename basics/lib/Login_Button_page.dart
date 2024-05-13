//import 'package:beton/widgets/pages/betpage.dart';
import 'package:basics/Calendar/CalendarPage.dart';
import 'package:basics/postpage.dart';
import 'package:flutter/material.dart';
//import 'package:beton/widgets/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      'My',
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Place',
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
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
                decoration: InputDecoration(
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
                        builder: (context) => PostPage(),
                      ),
                    );
                  } else {
                    // Nieprawidłowe hasło
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
                    SnackBar(
                      backgroundColor: Colors.red,
                      content:
                          Text('User not found. Please check your username.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
