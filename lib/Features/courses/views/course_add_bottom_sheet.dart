import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Features/couches/controller.dart';

class CourseAddBottomSheet extends StatelessWidget {
  late CouchesController _controller;

  CourseAddBottomSheet({
    Key? key,
    required CouchesController controller,
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
                  "Add A Couch",
                  style: Theme.of(context).textTheme.headline6,
                ),
                GetBuilder<CouchesController>(
                    init: _controller,
                    builder: (controller) {
                      return TextButton(
                        onPressed: () {
                          //TODO: add couch
                          controller.insertCouch();
                          Get.back();
                        },
                        child: const Text("Submit"),
                      );
                    }),
              ],
            ),

            //name
            GetBuilder<CouchesController>(
                init: _controller,
                builder: (controller) {
                  return TextField(
                    onChanged: (value) {
                      //TODO: save name
                      controller.couchNameForAdding = value;
                    },
                    decoration: InputDecoration(label: Text("Couch's Name")),
                  );
                }),
            //username
            GetBuilder<CouchesController>(
                init: _controller,
                builder: (controller) {
                  return TextField(
                    onChanged: (value) {
                      //TODO: save username
                      controller.couchUsernameForAdding = value;
                    },
                    decoration:
                    InputDecoration(label: Text("Couch's Username")),
                  );
                }),
            Row(
              children: [
                //password
                Expanded(
                    child: GetBuilder<CouchesController>(
                        init: _controller,
                        builder: (controller) {
                          return TextField(
                            onChanged: (value) {
                              //TODO: save password
                              controller.couchPasswordForAdding = value;
                            },
                            decoration: InputDecoration(
                              label: Text("Couch's Password"),
                            ),
                            keyboardType: TextInputType.number,
                          );
                        })),
                SizedBox(
                  width: 8,
                ),
                //confirm password
                Expanded(
                    child: GetBuilder<CouchesController>(
                        init: _controller,
                        builder: (controller) {
                          return TextField(
                            onChanged: (value) {
                              //TODO: save confirm password
                              controller.couchConfirmPasswordForAdding = value;
                            },
                            decoration: InputDecoration(
                              label: Text("Confirm Password"),
                            ),
                            keyboardType: TextInputType.number,
                          );
                        })),
              ],
            ),
            GetBuilder<CouchesController>(
              init: _controller,
              builder: (controller) {
                return Row(
                  children: [
                    Expanded(
                        child: RadioListTile<bool>(
                          value: true,
                          groupValue: controller.isAdminForAdding,
                          onChanged: (value) {
                            controller.isAdminForAdding = value!;
                          },
                          title: Text("Admin"),
                        )),
                    Expanded(
                        child: RadioListTile<bool>(
                          value: false,
                          groupValue: controller.isAdminForAdding,
                          onChanged: (value) {
                            controller.isAdminForAdding = value!;
                          },
                          title: Text("Not an Admin"),
                        )),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
