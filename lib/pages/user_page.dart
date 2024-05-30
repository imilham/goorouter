import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String userName;
  final String age;
  const UserPage({
    super.key,
    required this.userName,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User name is : $userName'),
            const SizedBox(height: 10),
            Text('User age is : $age'),
          ],
        ),
      ),
    );
  }
}
