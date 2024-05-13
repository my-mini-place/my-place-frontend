import 'package:basics/navigationbar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:basics/Image_MyPlace.dart';
import 'package:basics/Login_Button_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle the tap on the CircleAvatar
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreenImagePage()),
                        );

                        // Add your navigation logic or any other action you want to perform
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('my-place-frontend/Logo.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'My',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.green, // Color for "Bet"
                          ),
                        ),
                        Text(
                          'Place',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Color for "ON"
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/icon.jpg'),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Not Logged In',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to the login page when the login button is tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Container(
              color: Colors
                  .green, // Specify the desired color for the GestureDetector
              padding:
                  EdgeInsets.all(8.0), // Optional: Adjust padding as needed
              child: NavBarItem('Login'), // Specify the desired text color
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // GestureDetector(
          //   onTap: () {
          //     // Navigate to the login page when the login button is tapped
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => RegisterPage()),
          //     );
          //   },
          //   child: Container(
          //     color: Colors
          //         .green, // Specify the desired color for the GestureDetector
          //     padding:
          //         EdgeInsets.all(8.0), // Optional: Adjust padding as needed
          //     child: NavBarItem('Register'), // Specify the desired text color
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 600,
            padding: EdgeInsets.all(20),
            child: Text(
              'MyPlace is an app that makes living in society from your flat easier and happier',
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
