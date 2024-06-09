import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 300),
        margin: const EdgeInsets.only(top: 20),
        color: Colors.black,
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gapH10,
            gapH10,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Visit our Facebook Page',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse(
                            'https://www.facebook.com/profile.php?id=100009255945775'));
                      },
                  ),
                ],
              ),
            ),
            gapH10,
            const Text(
              'Address: 123 Happy Street, Happy Town, HT 12345',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            gapH10,
            const Text(
              'Email: contact@myplace.com',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const Flexible(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '© 2024 My Place. All rights reserved.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 189, 181, 181),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
