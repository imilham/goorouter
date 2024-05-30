import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goorouter/router/router_names.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () =>
                      GoRouter.of(context).goNamed(RouterNames.home),

                  // GoRouter.of(context).go("/"),
                  child: const Text("Home Page")),
            ),
          ],
        ),
      ),
    );
  }
}
