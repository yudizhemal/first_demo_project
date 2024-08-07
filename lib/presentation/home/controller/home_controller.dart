import 'package:first_demo_project/Theme/Colors.dart';
import 'package:first_demo_project/widgets/CustomTextField.dart';
import 'package:get/get.dart';
import '../models/category_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var categoryList = <CategoryModel>[].obs;
  final Uuid uuid = const Uuid();

  void addCategory(String name, String description) {
    final id = uuid.v4();
    categoryList
        .add(CategoryModel(id: id, name: name, description: description));
  }

  void showAddCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String categoryName = '';
        String categoryDescription = '';
        return AlertDialog(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add Category',
                      style: TextStyle(
                        color: grey1,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close, color: grey1))
                ],
              ),
              const Divider(
                color: grey1,
              ),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                    value: categoryName,
                    label: 'Category',
                    hintText: 'Category Name',
                    onTextChanged: (value) {
                      categoryName = value;
                    }),
                const SizedBox(height: 10),
                CustomTextField(
                    value: categoryDescription,
                    label: 'Description',
                    hintText: 'Category Description',
                    onTextChanged: (value) {
                      categoryDescription = value;
                    }),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (categoryName.isEmpty || categoryDescription.isEmpty) {
                  return;
                }
                addCategory(categoryName, categoryDescription);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: backgroundColor3,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Save',
              ),
            ),
          ],
        );
      },
    );
  }
}
