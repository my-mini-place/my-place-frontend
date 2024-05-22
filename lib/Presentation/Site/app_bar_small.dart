import 'package:basics/Api/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Enter_Page/components/logo_widget.dart';
import 'package:basics/Presentation/Site/app_bar_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class MyAppBarSmall extends StatelessWidget {
  const MyAppBarSmall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 40,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone),
                  InkWell(
                      onTap: () =>
                          launchUrl(Uri.parse('https://www.google.com')),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "796 075 232",
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.email),
                  InkWell(
                      onTap: () =>
                          launchUrl(Uri.parse('https://www.google.com')),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "my-place@gmail.com",
                        ),
                      ))
                ],
              ),
            ),
            AppBar(
              leadingWidth: 400,
              backgroundColor: Colors.black,
              toolbarHeight: 70,
              leading: const Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: LogoWidget(fontSize: 30)),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: PopupMenuButton(
                      iconColor: myOrange,
                      surfaceTintColor: Colors.white,
                      icon: const Icon(Icons.menu),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: MyAppBarButton(
                                    fontcolor: Colors.black,
                                    text: "Home",
                                    navigation: () => {},
                                  )),
                            )
                          ]),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

// Padding(
//                   padding: const EdgeInsets.only(right: 30),
//                   child: MyAppBarButton(
//                     text: "Stara",
//                     navigation: () => {},
//                   )),
//               Padding(
//                   padding = const EdgeInsets.only(right: 30),
//                   child = MyAppBarButton(
//                     text: "Home",
//                     navigation: () => {},
//                   )),
// //               Padding(
// //                   padding: const EdgeInsets.only(right: 30),
// //                   child: MyAppBarButton(
// //                     text: "Home",
// //                     navigation: () => {},
// //                   )),
//               if (state is AuthorizationInitial)
//                 Padding(
//                     padding: const EdgeInsets.only(right: 30),
//                     child: MyAppBarButton(
//                       text: "Login",
//                       navigation: () => {context.go('/login')},
//                     )),
//               const Padding(
//                 padding: EdgeInsets.only(right: 40),
//                 child: Center(
//                   child: CircleAvatar(
//                     radius: 25,
//                     backgroundImage: AssetImage('assets/icon.jpg'),
//                   ),
//                 ),
//               ),
