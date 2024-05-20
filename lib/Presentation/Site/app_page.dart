import 'package:basics/Presentation/Site/app_bar_changer.dart';
import 'package:basics/Presentation/Site/footer.dart';
import 'package:flutter/material.dart';

class AppPageBasics extends StatelessWidget {
  const AppPageBasics({
    super.key,
    required this.children,
    bool? withfoot,
  }) : withfooter = withfoot ?? false;

  final List<Widget> children;

  final bool withfooter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: const Footer(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyAppBarSwitcher(),
            ...children,
            if (withfooter) const Footer(),
          ],
        ),
      ),
      //  bottomSheet: const Footer(),
    );
  }
}
