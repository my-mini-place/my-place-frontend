import 'package:basics/Presentation/Site/app_bar_big.dart';
import 'package:basics/Presentation/Site/app_bar_small.dart';

import 'package:flutter/widgets.dart';

class MyAppBarSwitcher extends StatelessWidget {
  const MyAppBarSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => constraints.maxWidth < 600
            ? const MyAppBarSmall()
            : const MyAppBarBig());
  }
}
