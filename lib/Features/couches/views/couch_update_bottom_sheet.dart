import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';
import 'package:project_neo_knowlage/Features/couches/controller.dart';

class CouchUpdateBottomSheet extends StatelessWidget {
  late CouchesController _controller;
  late Couch _couch;

  CouchUpdateBottomSheet({
    Key? key,
    required CouchesController controller,
    required Couch couch,
  })  : _controller = controller,
        _couch = couch,
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
                  "Editing ${_couch.name}",
                  style: Theme.of(context).textTheme.headline6,
                ),
                GetBuilder<CouchesController>(
                    init: _controller,
                    builder: (controller) {
                      return TextButton(
                        onPressed: () {
                          //TODO: update couch
                          _controller.updateCouch(_couch);
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
                    controller: TextEditingController(text: _couch.name),
                    onChanged: (value) {
                      //TODO: save name
                      _couch.name = value;
                    },
                    decoration: const InputDecoration(label: Text("Couch's Name")),
                  );
                }),
            //username
            GetBuilder<CouchesController>(
                init: _controller,
                builder: (controller) {
                  return TextField(
                    controller: TextEditingController(text: _couch.username),

                    onChanged: (value) {
                      //TODO: save username
                      _couch.username = value;
                    },
                    decoration:
                    const InputDecoration(label: Text("Couch's Username")),
                  );
                }),
            //password
            GetBuilder<CouchesController>(
                init: _controller,
                builder: (controller) {
                  return TextField(
                    controller: TextEditingController(text: _couch.password),

                    onChanged: (value) {
                      //TODO: save password
                      _couch.password = value;
                    },
                    decoration: const InputDecoration(
                      label: Text("Couch's Password"),
                    ),
                    keyboardType: TextInputType.number,
                  );
                }),
            //isAdmin
            GetBuilder<CouchesController>(
              init: _controller,
              builder: (controller) {
                return Row(
                  children: [
                    Expanded(
                        child: RadioListTile<bool>(
                          value: true,
                          groupValue: _couch.isAdmin,
                          onChanged: (value) {
                            _couch.isAdmin = value!;
                            controller.isAdminForAdding = value;
                          },
                          title: const Text("Admin"),
                        )),
                    Expanded(
                        child: RadioListTile<bool>(
                          value: false,
                          groupValue: _couch.isAdmin,
                          onChanged: (value) {
                            _couch.isAdmin = value!;
                            controller.isAdminForAdding = value;
                          },
                          title: const Text("Not an Admin"),
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
