import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileChildPage extends StatelessWidget {
  const ProfileChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Child Page'),
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
                  onPressed: () => GoRouter.of(context).go("/"),
                  child: const Text("Home Page")),
            ),
          ],
        ),
      ),
    );
  }
}
