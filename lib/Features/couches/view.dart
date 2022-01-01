import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            return ListView.builder(itemBuilder: (context, i) {
              return ListTile(
                title: Text("$i"),
              );
            });
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
                TextButton(
                  onPressed: () {
                    //TODO: add couch
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),

            //name
            TextField(
              onChanged: (value){
                //TODO: save name
              },
              decoration: InputDecoration(label: Text("Couch's Name")),
            ),
            //username
            TextField(
              onChanged: (value){
                //TODO: save username
              },
              decoration: InputDecoration(label: Text("Couch's Username")),
            ),
            Row(
              children: [
                //password
                Expanded(
                    child: TextField(
                      onChanged: (value){
                        //TODO: save password
                      },
                  decoration: InputDecoration(
                    label: Text("Couch's Password"),
                  ),
                  keyboardType: TextInputType.number,
                )),
                SizedBox(
                  width: 8,
                ),
                //confirm password
                Expanded(
                    child: TextField(
                      onChanged: (value){
                        //TODO: save confirm password
                      },
                  decoration: InputDecoration(
                    label: Text("Confirm Password"),
                  ),
                  keyboardType: TextInputType.number,
                )),
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
                      groupValue: _controller.isAdminForAdding,
                      onChanged: (value) {
                        _controller.isAdminForAdding=value!;
                      },
                      title: Text("Admin"),
                    )),
                    Expanded(
                        child: RadioListTile<bool>(
                      value: false,
                      groupValue: _controller.isAdminForAdding,
                      onChanged: (value) {
                        _controller.isAdminForAdding=value!;
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
