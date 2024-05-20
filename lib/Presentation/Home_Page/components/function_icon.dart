import 'package:basics/Presentation/Calendar_Page/CalendarPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FunctionIcon extends StatelessWidget {
  const FunctionIcon({
    required this.title,
    required this.navigation,
    required this.icon,
    super.key,
  });

  final String title;
  final Function navigation;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AnimatedContainer(
        width: 160,
        duration: const Duration(seconds: 1),
        //color: Colors.amber,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => navigation(),
              // Action when calendar icon is tapped
              //print('Calendar tapped');

              child: Icon(
                icon,
                size: 140,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
