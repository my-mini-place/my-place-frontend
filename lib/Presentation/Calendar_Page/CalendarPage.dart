// import 'package:basics/Presentation/Site/app_bar_changer.dart';
// import 'package:flutter/material.dart';

// import 'package:table_calendar/table_calendar.dart';

// class CalendarPage extends StatefulWidget {
//   const CalendarPage({super.key});

//   @override
//   _Calendar1State createState() => _Calendar1State();
// }

// class _Calendar1State extends State<CalendarPage> {
//   // late CalendarController _controller;
//   late DateTime _selectedDay;
//   late DateTime _focusedDay;

//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   // Map<DateTime, List> _events = {};

//   @override
//   void initState() {
//     super.initState();
//     // _controller = CalendarController();
//     // _addEvents();
//     _selectedDay = DateTime.now();
//     _focusedDay = _selectedDay;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const MyAppBarSwitcher(),
//             TableCalendar(
//               firstDay: DateTime.utc(2010, 10, 16),
//               lastDay: DateTime.utc(2030, 3, 14),
//               focusedDay: _focusedDay,
//               // calendarController: _controller,
//               selectedDayPredicate: (day) {
//                 return isSameDay(_selectedDay, day);
//               },
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _focusedDay = focusedDay; // update `_focusedDay` here as well
//                 });
//               },
//               calendarFormat: _calendarFormat,
//               onFormatChanged: (format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               },
//               onPageChanged: (focusedDay) {
//                 _focusedDay = focusedDay;
//               },
//               eventLoader: (day) {
//                 return _getEventsForDay(day);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // void _addEvents() {
//   //   DateTime today = DateTime.now();
//   //   DateTime tomorrow = today.add(Duration(days: 1));

//   //   _events[today] = ['Spotkanie 1', 'Spotkanie 2'];
//   //   _events[tomorrow] = ['Spotkanie 3', 'Spotkanie 4'];
//   // }

//   List<String> _getEventsForDay(DateTime day) {
//     if (day == DateTime.now().day) {
//       return ["Szczur"];
//     }
//     return [];
//   }
// }

// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:basics/Domain/calendar/event_simple.dart';
import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<CalendarPage> {
  // zamien pozniej na bloca
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPageBasics(
      children: [
        gapH40,
        const Text("Kalendarz", style: TextStyle(fontSize: 30)),
        gapH10,
        SizedBox(
          width: 600,
          height: 900,
          child: Column(
            children: [
              TableCalendar<Event>(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: const CalendarStyle(
                  tableBorder: TableBorder(),

                  selectedDecoration: BoxDecoration(
                    color: myOrange,
                    shape: BoxShape.circle,
                  ),
                  // Use `CalendarStyle` to  customize the UI
                  markerMargin: EdgeInsets.only(top: 0),
                  outsideDaysVisible: false,
                ),
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 255, 251, 255),
                    child: const Icon(Icons.add),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 251, 255),
                              scrollable: true,
                              title: const Text('Event'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  child: Column(
                                    children: <Widget>[
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText: 'title',
                                          icon: Icon(Icons.account_box),
                                        ),
                                      ),
                                      TextFormField(
                                        //  controller: ,
                                        decoration: const InputDecoration(
                                          labelText: 'date',
                                          icon: Icon(Icons.calendar_month),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    child: const Text("Submit"),
                                    onPressed: () {})
                              ],
                            );
                          });
                    }),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 197, 196, 196)),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () => print('${value[index]}'),
                            title: Text('${value[index]}'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

bool isSameDay(DateTime? a, DateTime? b) {
  if (a == null || b == null) {
    return false;
  }

  return a.year == b.year && a.month == b.month && a.day == b.day;
}
