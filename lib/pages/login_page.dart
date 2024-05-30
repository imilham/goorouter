import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goorouter/data/user_data.dart';
import 'package:goorouter/router/router_names.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              UserData.instance.isUserLoggedIn = true;
            },
            child: const Text("Login")),
      ),
    );
  }
}
