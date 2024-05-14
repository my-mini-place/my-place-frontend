import 'package:basics/Calendar/CalendarPage.dart';
import 'package:basics/navigationbar/navigation_bar.dart';
import 'package:basics/postpage.dart';
import 'package:flutter/material.dart';
import 'package:basics/Image_MyPlace.dart';
import 'package:basics/Login_Button_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Bar Example'),
        ),
        body: Center(
          child: Text('Main Content'),
        ),
        bottomNavigationBar: Container(
          height: 300.0, // Adjust the height as needed
          color: Colors.green, // Background color of the bottom bar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPage()),
                  );
                  // Action when calendar icon is tapped
                  print('Calendar tapped');
                },
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostPage()),
                  );
                  // Action when newspaper icon is tapped
                  print('Newspaper tapped');
                },
                child: Icon(
                  Icons.newspaper,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Action when documents icon is tapped
                  print('Documents tapped');
                },
                child: Icon(
                  Icons.description,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Action when hammer icon is tapped
                  print('Hammer tapped');
                },
                child: Icon(
                  Icons.build,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
