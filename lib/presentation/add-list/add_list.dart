import 'package:first_demo_project/Theme/Colors.dart';
import 'package:first_demo_project/widgets/CustomDropdown.dart';
import 'package:first_demo_project/widgets/CustomTextField.dart';

import '/widgets/CustomAppbar.dart';
import 'controller/add_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddList extends StatelessWidget {
  // List of items in our dropdown menu
  AddList({super.key});

  final AddListController controller = Get.put(AddListController());

  @override
  Widget build(BuildContext context) {
    final AddListController controller = Get.put(AddListController());
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Add List',
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CustomTextField(
                  value: controller.listName,
                  label: "List name",
                  hintText: "Enter List name",
                  onTextChanged: controller.onListNameChange,
                  autofocus: true,
                ),
              ),
              CustomDropdown(
                items: controller.categoryList
                    .map((e) => DropdownItem(value: e.id, name: e.name))
                    .toList(),
                label: "Category",
                onChanged: controller.onCategoryChange,
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 18, left: 8, right: 8, bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundColor3,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CustomTextField(
                        value: controller.creatorName,
                        label: "Item",
                        hintText: "Enter item name",
                        onTextChanged: controller.onCreatorNameChange,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              value: controller.creatorMobileNumber,
                              label: "Quantity",
                              hintText: "Enter quantity",
                              onTextChanged:
                                  controller.onCreatorMobileNumberChange,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomDropdown(
                              items: controller.categoryList
                                  .map((e) =>
                                      DropdownItem(value: e.id, name: e.name))
                                  .toList(),
                              label: "Unit",
                              onChanged: controller.onCategoryChange,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controller.addListItem,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: backgroundColor3,
                                foregroundColor: darkBlue,
                                minimumSize: const Size(double.infinity, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controller.addListItem,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                foregroundColor: backgroundColor3,
                                minimumSize: const Size(double.infinity, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text('Add Item'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
