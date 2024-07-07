import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String path;
  const ErrorPage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("The Path: '$path' is wrong"),
          TextButton(
              onPressed: () {
                context.go("/");
              },
              child: const Text("Go to Home"))
        ],
      )),
    );
  }
}
