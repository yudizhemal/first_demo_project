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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Creator Name',
                  ),
                  autofocus: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Creator Mobile Number',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter List Name',
                  ),
                ),
              ),
              CustomDropdown(
                items: controller.categoryList.map((e) {
                  return DropdownItem(value: e.id, name: e.name);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
