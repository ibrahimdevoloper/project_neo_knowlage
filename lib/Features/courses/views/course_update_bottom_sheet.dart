import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';
import 'package:project_neo_knowlage/Database/entities/courses.dart';
import 'package:project_neo_knowlage/Features/courses/controller.dart';

class CourseUpdateBottomSheet extends StatelessWidget {
  late CoursesController _controller;
  late Course _course;

  CourseUpdateBottomSheet({
    Key? key,
    required CoursesController controller,
    required Course course,
  })  : _controller = controller,
        _course = course,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 3 / 4,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Cancel"),
                ),
                Text(
                  "Editing ${_course.name}",
                  style: Theme.of(context).textTheme.headline6,
                ),
                GetBuilder<CoursesController>(
                    init: _controller,
                    builder: (controller) {
                      return TextButton(
                        onPressed: () {
                          //TODO: update couch
                          // _controller.updateCouch(_couch);
                          Get.back();
                        },
                        child: const Text("Submit"),
                      );
                    }),
              ],
            ),
            //name
            GetBuilder<CoursesController>(
                init: _controller,
                builder: (controller) {
                  return TextField(
                    controller: TextEditingController(text: _course.name),
                    onChanged: (value) {
                      //TODO: save name
                      // _course.name = value;
                    },
                    decoration: const InputDecoration(label: Text("Couch's Name")),
                  );
                }),
            //username
            GetBuilder<CoursesController>(
                init: _controller,
                builder: (controller) {
                  return TextField(
                    controller: TextEditingController(text: _course.username),

                    onChanged: (value) {
                      //TODO: save username
                      // _course.username = value;
                    },
                    decoration:
                    const InputDecoration(label: Text("Couch's Username")),
                  );
                }),
            //password
            GetBuilder<CoursesController>(
                init: _controller,
                builder: (controller) {
                  return TextField(
                    controller: TextEditingController(text: _course.password),

                    onChanged: (value) {
                      //TODO: save password
                      // _course.password = value;
                    },
                    decoration: const InputDecoration(
                      label: Text("Couch's Password"),
                    ),
                    keyboardType: TextInputType.number,
                  );
                }),
            //isAdmin
            // GetBuilder<CoursesController>(
            //   init: _controller,
            //   builder: (controller) {
            //     return Row(
            //       children: [
            //         Expanded(
            //             child: RadioListTile<bool>(
            //               value: true,
            //               groupValue: _course.isAdmin,
            //               onChanged: (value) {
            //                 _course.isAdmin = value!;
            //                 controller.isAdminForAdding = value;
            //               },
            //               title: const Text("Admin"),
            //             )),
            //         Expanded(
            //             child: RadioListTile<bool>(
            //               value: false,
            //               groupValue: _course.isAdmin,
            //               onChanged: (value) {
            //                 _course.isAdmin = value!;
            //                 controller.isAdminForAdding = value;
            //               },
            //               title: const Text("Not an Admin"),
            //             )),
            //       ],
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
