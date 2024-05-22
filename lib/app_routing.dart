import 'package:basics/Presentation/Admin_Panel_Page/Admin_Page.dart';
import 'package:basics/Presentation/Admin_Panel_Page/user_list_page.dart';
import 'package:basics/Presentation/Calendar_Page/CalendarPage.dart';

import 'package:basics/Presentation/Documents_Page/documents_page.dart';
import 'package:basics/Presentation/Enter_Page/enter_page.dart';
import 'package:basics/Presentation/Home_Page/homepage.dart';
import 'package:basics/Presentation/Login_Register/login_page.dart';
import 'package:basics/Presentation/Posts_Page/post_page.dart';
import 'package:basics/Presentation/Profile_Page/profile_page.dart';
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
    GoRoute(
        path: '/home/calendar',
        name: 'calendar',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: CalendarPage())),

    GoRoute(
        path: '/home/profile',
        name: 'profile',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ProfilePage())),
    GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomePage())),
    GoRoute(
        path: '/home/documents',
        name: 'doc',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: DocumentsPage())),

    GoRoute(
        path: '/home/admin-panel',
        name: 'admin',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: AdminPanelPage())),

    GoRoute(
        path: '/home/posts',
        name: 'posts',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: PostPage())),
    // builder: (BuildContext context, GoRouterState state) {

    GoRoute(
        path: '/home/users-list',
        name: 'userslist',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: UserListPage())),

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
