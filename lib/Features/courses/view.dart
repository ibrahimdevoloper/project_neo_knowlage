import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CoursesPage extends StatelessWidget {
  late CoursesController controller;

  CoursesPage({Key? key, required int couchId})
      : controller = Get.put(CoursesController(couchId)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
