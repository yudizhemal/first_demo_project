import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;

  CategoryItemWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      elevation: 3,
      child: InkWell(
        onTap: () {
          print(category.id);
          Get.toNamed('/add-list', arguments: { "id": category.id});
        },
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          title: Text(category.name),
          subtitle: Text(category.description),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
