import 'package:flutter/material.dart';

class OpenUser extends StatefulWidget {
  const OpenUser({super.key});

  @override
  State<OpenUser> createState() => _OpenUserState();
}

class _OpenUserState extends State<OpenUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
