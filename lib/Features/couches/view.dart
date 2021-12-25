import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CouchesPage extends StatelessWidget {
  final CouchesController controller = Get.put(CouchesController());

  CouchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Couches")
      ),
      body: ListView.builder(itemBuilder: (context,i){
        return ListTile(
          title: Text("$i"),
        );
      }),
    );
  }
}
