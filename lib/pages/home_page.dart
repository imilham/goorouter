import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goorouter/data/user_data.dart';
import 'package:goorouter/router/router_names.dart';

class HomePage extends StatelessWidget {
  final double mainGap = 30;
  final double normalGap = 10;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // profile page button
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  // onPressed: () => GoRouter.of(context).go("/profile"),
                  onPressed: () =>
                      GoRouter.of(context).pushNamed(RouterNames.profile),
                  child: const Text("Profile Page")),
            ),
            SizedBox(height: normalGap),
            // profile child page
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => GoRouter.of(context).goNamed("profileChild"),
                  child: const Text("Profile Child Page")),
            ),
            SizedBox(height: mainGap),

            // user page button
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    //String name = "Mohamed Ilham";
                    //String age = "24";
                    // GoRouter.of(context).go("/user/$name/$age");
                    GoRouter.of(context).pushNamed(RouterNames.user,
                        pathParameters: {
                          "name": "Mohamed Ilham from path parameter",
                          "age": "27"
                        });
                  },
                  // GoRouter.of(context).go("/user", extra: "Mohamed Ilham"),
                  // GoRouter.of(context).go("/user", extra: {
                  //   "name": "Mohamed Ilham",
                  //   "age": "24"
                  // }), // passing the values for the extra as a map

                  child: const Text("User Page")),
            ),
            SizedBox(height: mainGap),

            // profile page button
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).goNamed(RouterNames.age,
                        queryParameters: {"age": "27"});
                  },
                  child: const Text("Age Page")),
            ),
            SizedBox(height: mainGap),

            // profile page button
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    UserData.instance.isUserLoggedIn = false;
                  },
                  child: const Text("Logout")),
            ),
            SizedBox(height: mainGap),
          ],
        ),
      ),
    );
  }
}
