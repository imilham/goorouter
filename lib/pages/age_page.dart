import 'package:flutter/material.dart';

class Agepage extends StatelessWidget {
  final int age;
  const Agepage({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Age Page"),
        ),
        body: Center(
          child: Text("Your age is $age"),
        ));
  }
}
