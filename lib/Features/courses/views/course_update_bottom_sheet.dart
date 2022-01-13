import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';
import 'package:project_neo_knowlage/Database/entities/courses.dart';
import 'package:project_neo_knowlage/Features/courses/controller.dart';
import 'package:project_neo_knowlage/functions/dateFormatter.dart';

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
      padding: EdgeInsets.only(left: 16, right: 16),
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
                  "Edit A ${_course.name}",
                  style: Theme.of(context).textTheme.headline6,
                ),
                GetBuilder<CoursesController>(
                    init: _controller,
                    builder: (controller) {
                      return TextButton(
                        onPressed: () {
                          //TODO: add course
                          controller.updateCourse(_course);
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
                      // controller.courseNameForAdding = value;
                      _course.name = value;
                    },
                    decoration: InputDecoration(label: Text("Course's Name")),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //start date
                GetBuilder<CoursesController>(
                    init: _controller,
                    builder: (controller) {
                      return ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 1),
                              lastDate: DateTime(2030),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.dark(),
                                  child: child!,
                                );
                              },
                            ).then((value) {
                              _course.startDate = dateFormater(value!);
                              _controller.update();
                            });
                          },
                          child: Text("Start Date: ${_course.startDate}"));
                    }),
                //End date
                GetBuilder<CoursesController>(
                    init: _controller,
                    builder: (controller) {
                      return ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 1),
                              lastDate: DateTime(2030),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: ThemeData.dark(),
                                  child: child!,
                                );
                              },
                            ).then((value) {
                              _course.endDate = dateFormater(value!);
                              _controller.update();
                            });
                          },
                          child: Text("End Date: ${_course.endDate}"));
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //start time
                GetBuilder<CoursesController>(
                    init: _controller,
                    builder: (controller) {
                      return ElevatedButton(
                          onPressed: () {
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.dark(),
                                    child: child!,
                                  );
                                }).then((value) {
                              _course.startTime = value!.format(
                                context,
                              );
                              _controller.update();
                            });
                          },
                          child: Text("Start Time: ${_course.startTime}"));
                    }),
                //End time
                GetBuilder<CoursesController>(
                    init: _controller,
                    builder: (controller) {
                      return ElevatedButton(
                          onPressed: () {
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.dark(),
                                    child: child!,
                                  );
                                }).then((value) {
                              _course.endTime = value!.format(
                                context,
                              );
                              _controller.update();
                            });
                          },
                          child: Text("End Time: ${_course.endTime}"));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
