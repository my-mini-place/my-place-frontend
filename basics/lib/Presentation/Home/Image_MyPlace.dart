import 'package:flutter/material.dart';

class FullScreenImagePage extends StatelessWidget {
  const FullScreenImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // Navigate back when the full-screen image is tapped
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.asset('my-place-frontend/Logo.jpg', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
