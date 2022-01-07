import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';

import 'controller.dart';

class CouchesPage extends StatelessWidget {
  final CouchesController controller = Get.put(CouchesController());

  CouchesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Couches")),
      body: GetBuilder<CouchesController>(
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
                Couch couch = controller.couches[i];
                print(couch.id);
                return ListTile(
                  title: Text(couch.name),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.deleteCouch(couch);
                          },
                          icon: Icon(Icons.delete),
                        ),IconButton(
                          onPressed: () {
                            controller.deleteCouch(couch);
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.couches.length,
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

class CouchAddBottomSheet extends StatelessWidget {
  late CouchesController _controller;

  CouchAddBottomSheet({
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
