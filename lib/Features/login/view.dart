import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text("username")),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("password")),
            ),
            TextButton(onPressed: (){

            }, child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}
