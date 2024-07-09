import 'package:get/get.dart';
import '../models/category_model.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var categoryList = <CategoryModel>[].obs;
  final Uuid uuid = Uuid();

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
                  Text('Add Category',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close,
                          color: Theme.of(context).colorScheme.error))
                ],
              ),
              Divider(
                color: Theme.of(context).colorScheme.error,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  onChanged: (value) {
                    categoryName = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  onChanged: (value) {
                    categoryDescription = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Category Description',
                  ),
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
