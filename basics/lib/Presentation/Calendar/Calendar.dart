import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class Calendar1 extends StatefulWidget {
  @override
  _Calendar1State createState() => _Calendar1State();
}

class _Calendar1State extends State<Calendar1> {
  // late CalendarController _controller;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  CalendarFormat _calendarFormat = CalendarFormat.month;
  // Map<DateTime, List> _events = {};

  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
    // _addEvents();
    _selectedDay = DateTime.now();
    _focusedDay = _selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calendar'),
      ),
      body: Center(
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          // calendarController: _controller,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          eventLoader: (day) {
            return _getEventsForDay(day);
          },
        ),
      ),
    );
  }

  // void _addEvents() {
  //   DateTime today = DateTime.now();
  //   DateTime tomorrow = today.add(Duration(days: 1));

  //   _events[today] = ['Spotkanie 1', 'Spotkanie 2'];
  //   _events[tomorrow] = ['Spotkanie 3', 'Spotkanie 4'];
  // }

  List<String> _getEventsForDay(DateTime day) {
    if (day == DateTime.now().day) {
      return ["Szczur"];
    }
    return [];
  }
}
