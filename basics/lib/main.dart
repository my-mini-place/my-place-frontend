import 'package:basics/DI.dart';
import 'package:flutter/material.dart';
import 'package:basics/Presentation/Enter_Page/Login_Page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.montserrat().fontFamily),
        home: const HomePage()); //HomeView());
  }
}
