import 'package:first_demo_project/Theme/Colors.dart';
import 'package:first_demo_project/widgets/CustomDropdown.dart';

import '/widgets/CustomAppbar.dart';
import 'controller/add_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddList extends StatelessWidget {
  // List of items in our dropdown menu
  final AddListController controller = Get.put(AddListController());

  @override
  Widget build(BuildContext context) {
    final AddListController controller = Get.put(AddListController());
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Add List',
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Text('Category: '),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            controller.onCategoryChange(value);
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
