import 'package:basics/Presentation/Calendar/CalendarPage.dart';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Main Content'),
      ),
      bottomNavigationBar: Container(
        height: 120.0, // Adjust the height as needed
        color: Colors.green, // Background color of the bottom bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalendarPage()),
                );
                // Action when calendar icon is tapped
                //print('Calendar tapped');
              },
              child: const Icon(
                Icons.calendar_today,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => PostPage()),
                // );
                // Action when newspaper icon is tapped
                // print('Newspaper tapped');
              },
              child: const Icon(
                Icons.newspaper,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Action when documents icon is tapped
                //  print('Documents tapped');
              },
              child: const Icon(
                Icons.description,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Action when hammer icon is tapped
                // print('Hammer tapped');
              },
              child: const Icon(
                Icons.build,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
