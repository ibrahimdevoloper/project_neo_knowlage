import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_neo_knowlage/Database/entities/couches.dart';
import 'package:project_neo_knowlage/Features/couches/controller.dart';
import 'package:project_neo_knowlage/Features/couches/views/couch_add_bottom_sheet.dart';
import 'package:project_neo_knowlage/Features/couches/views/couch_update_bottom_sheet.dart';

import '../controller.dart';

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
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.bottomSheet(
                              CouchUpdateBottomSheet(controller: controller, couch: couch,),
                            );
                          },
                          icon: const Icon(Icons.edit),
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

