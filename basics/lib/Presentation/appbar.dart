import 'package:basics/Presentation/Enter_Page/components/logo_widget.dart';
import 'package:basics/Presentation/Utils/app_bar_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 400,
      backgroundColor: Colors.black,
      toolbarHeight: 70,
      leading: const Padding(
          padding: EdgeInsets.only(left: 30), child: LogoWidget(fontSize: 30)),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 30),
            child: MyAppBarButton(
              text: "Home",
              navigation: () => {},
            )),
        Padding(
            padding: const EdgeInsets.only(right: 30),
            child: MyAppBarButton(
              text: "Login",
              navigation: () => {},
            )),
        const Padding(
          padding: EdgeInsets.only(right: 40),
          child: Center(
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/icon.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}
