import 'package:basics/Presentation/Enter_Page/enter_page.dart';
import 'package:basics/Presentation/Login_Register/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'enter',
      builder: (BuildContext context, GoRouterState state) {
        return const EnterPage();
      },
    ),
    GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LoginPage())),
    // builder: (BuildContext context, GoRouterState state) {
    //   return const LoginPage();
  ],
);

class NoTransitionPage<T> extends CustomTransitionPage<T> {
  /// Constructor for a page with no transition functionality.
  const NoTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder,
          transitionDuration: const Duration(microseconds: 1),
        );

  static Widget _transitionsBuilder(
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) =>
      child;
}
