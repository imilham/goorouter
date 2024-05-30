import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goorouter/data/user_data.dart';
import 'package:goorouter/pages/age_page.dart';
import 'package:goorouter/pages/home_page.dart';
import 'package:goorouter/pages/login_page.dart';
import 'package:goorouter/pages/profile_child_page.dart';
import 'package:goorouter/pages/profile_page.dart';
import 'package:goorouter/pages/user_page.dart';
import 'package:goorouter/router/router_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    refreshListenable: UserData.instance,
    // error page custom made
    errorPageBuilder: (context, state) {
      return MaterialPage<dynamic>(
          child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('This Page is not found'),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    // onPressed: () => GoRouter.of(context).go("/"),
                    onPressed: () =>
                        GoRouter.of(context).goNamed(RouterNames.home),
                    child: const Text("Home Page")),
              ),
            ],
          ),
        ),
      ));
    },

    // redirecting to login page if user is not logged in
    redirect: (context, state) {
      bool isUserLoggedIn = UserData.instance.isUserLoggedIn;
      bool isGoingToLogin = state.matchedLocation == '/login';

      if (!isUserLoggedIn && !isGoingToLogin) {
        return '/login';
      } else if (isUserLoggedIn && isGoingToLogin) {
        return '/';
      }
      return null;
    },

    routes: [
      // home page route
      GoRoute(
        path: "/",
        name: RouterNames.home,
        builder: (context, state) {
          return const HomePage();
        },
      ),

      // profile page route
      GoRoute(
          path: "/profile",
          name: RouterNames.profile,
          builder: (context, state) {
            return const ProfilePage();
          },

          // route for the profile child pages
          routes: [
            GoRoute(
                path: "child",
                name: RouterNames.profileChild,
                builder: (context, state) {
                  return const ProfileChildPage();
                })
          ]),

      // user page route
      // passing parameters as the path parameter

      // GoRoute(
      //   path: "/user",
      //   name: "user",
      //   builder: (context, state) {
      //     // final name = state.extra as String;
      //     final name = (state.extra as Map<String, dynamic>)['name'] as String;
      //     final age = (state.extra as Map<String, dynamic>)['age'] as int;
      //     return UserPage(
      //       userName: name,
      //       age: age,
      //     );
      //   },
      // ),

      // passing parameters as the path parameter
      GoRoute(
        path: "/user/:name/:age",
        name: RouterNames.user,
        builder: (context, state) {
          return UserPage(
            userName: state.pathParameters["name"]!,
            age: state.pathParameters["age"]!,
          );
        },
      ),

      // age page > Query parameters
      GoRoute(
        path: "/age",
        name: RouterNames.age,
        builder: (context, state) {
          final int age = state.uri.queryParameters["age"] == null
              ? 0
              : int.parse(state.uri.queryParameters["age"]!);
          return Agepage(age: age);
        },
      ),

      // login page route
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return const LoginPage();
        },
      )
    ],
  );
}
