import 'package:basics/Api/Auth/Auth_token_cubit/auth_cubit.dart';
import 'package:basics/Api/Auth/Login_cubit/login_cubit.dart';
import 'package:basics/DI.dart';
import 'package:basics/Domain/eventbus.dart';
import 'package:basics/Domain/logoutevent.dart';
import 'package:basics/Presentation/Enter_Page/components/logo_widget.dart';
import 'package:basics/Presentation/Site/app_bar_button.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBarBig extends StatelessWidget {
  const MyAppBarBig({
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
                if (state is AuthorizationState)
                  Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: MyAppBarButton(
                        fontcolor: Colors.white,
                        text: "Logout",
                        navigation: () {
                          context.read<LoginCubit>().logout();

                          getIt
                              .get<EventBusManager>()
                              .eventBus
                              .fire(UserLogoutEvent());

                          context.goNamed('enter');
                        },
                      )),
                if (state is AuthorizationState)
                  Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: MyAppBarButton(
                        fontcolor: Colors.white,
                        text: "Home",
                        navigation: () => {context.go("/home")},
                      )),
                if (state is AuthorizationInitial)
                  Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: MyAppBarButton(
                        fontcolor: Colors.white,
                        text: "Login",
                        navigation: () => {context.go('/login')},
                      )),
                if (state is AuthorizationState)
                  const Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Center(
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/icon.jpg'),
                      ),
                    ),
                  ),
                if (state is AuthorizationInitial)
                  const Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Center(
                      child: CircleAvatar(
                        radius: 23,
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
