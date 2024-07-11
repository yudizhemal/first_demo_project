import 'package:first_demo_project/Theme/Colors.dart';
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
                        color: primaryColor,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close,
                          color: primaryColor))
                ],
              ),
              const Divider(
                color: primaryColor,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  onChanged: (value) {
                    categoryName = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Category Name',
                  ),
                ),
              ),
              TextField(
                  onChanged: (value) {
                    categoryDescription = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Category Description',
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (categoryName.isEmpty || categoryDescription.isEmpty) {
                  return;
                }
                addCategory(categoryName, categoryDescription);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
