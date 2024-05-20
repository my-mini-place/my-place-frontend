import 'package:flutter/material.dart';
import 'package:basics/Presentation/Calendar_Page/Calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Calendar1(), // Display Calendar1 widget here
      ),
    );
  }
}
