import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(label: Text("username")),
          ),
          TextFormField(
            decoration: InputDecoration(label: Text("password")),
          ),

        ],
      ),
    );
  }
}
