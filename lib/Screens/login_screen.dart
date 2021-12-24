import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(label: Text("username")),
            ),
            TextFormField(
              decoration: InputDecoration(label: Text("password")),
            ),
            TextButton(onPressed: (){}, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
