import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Features/couches/controller.dart';
import 'package:project_neo_knowlage/Features/courses/controller.dart';
import 'package:project_neo_knowlage/functions/dateFormatter.dart';

class CourseAddBottomSheet extends StatelessWidget {
  late CoursesController _controller;

  CourseAddBottomSheet({
    Key? key,
    required CoursesController controller,
  })  : _controller = controller,
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
                  "Add A Course",
                  style: Theme.of(context).textTheme.headline6,
                ),
                GetBuilder<CoursesController>(
                    init: _controller,
                    builder: (controller) {
                      return TextButton(
                        onPressed: () {
                          //TODO: add course
                          controller.insertCourse();
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
                    onChanged: (value) {
                      //TODO: save name
                      controller.courseNameForAdding = value;
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
                              controller.courseStartDateForAdding = dateFormater(value!);
                            });
                          },
                          child: Text(controller.courseStartDateForAdding==null?"Start Date":"Start Date: ${controller.courseStartDateForAdding}"));
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
                              controller.courseEndDateForAdding = dateFormater(value!);                            });
                          },
                          child: Text(controller.courseEndDateForAdding==null?"End Date":"End Date: ${controller.courseEndDateForAdding}"));
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //start date
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
                              controller.courseStartTimeForAdding = value!.format(context,);
                            });
                          },
                          child: Text(controller.courseStartTimeForAdding==null?"Start Time":"Start Time: ${controller.courseStartTimeForAdding}"));
                    }),
                //End date
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
                              controller.courseEndTimeForAdding = value!.format(context);
                            });
                          },
                          child: Text(controller.courseEndTimeForAdding==null?"End Time":"End Time: ${controller.courseEndTimeForAdding}"));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
