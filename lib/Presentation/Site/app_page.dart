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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: constraints.maxHeight - 200),
                child: Column(
                  children: [
                    const MyAppBarSwitcher(),
                    ...children,
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        );
      }),
    );
  }
}
