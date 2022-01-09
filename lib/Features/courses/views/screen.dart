import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/entities/courses.dart';
import 'package:project_neo_knowlage/Features/courses/controller.dart';
import 'package:project_neo_knowlage/Features/courses/views/course_update_bottom_sheet.dart';

class CoursesPage extends StatelessWidget {
  late CoursesController controller;
  late String _couchName;

  CoursesPage({Key? key, required int couchId, required String couchName})
      : controller = Get.put(CoursesController(couchId)),
        _couchName = couchName,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$_couchName's Courses")),
      body: GetBuilder<CoursesController>(
        init: controller,
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.isError) {
            return Center(
              child: Text(controller.message),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, i) {
                Course course = controller.courses[i];
                return ListTile(
                  title: Text(course.name),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.deleteCouch(course);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.bottomSheet(
                              CourseUpdateBottomSheet(
                                controller: controller,
                                couch: course,
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.courses.length,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
            CouchAddBottomSheet(controller: controller),
          );
        },
      ),
    );
  }
}
