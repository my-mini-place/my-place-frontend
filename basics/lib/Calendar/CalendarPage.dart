import 'package:flutter/material.dart';
import 'package:basics/Calendar/Calendar.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Page'),
      ),
      body: Center(
        child: Calendar1(), // Display Calendar1 widget here
      ),
    );
  }
}
