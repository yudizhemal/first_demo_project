import '/widgets/CustomAppbar.dart';
import 'controller/add_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddList extends StatelessWidget {
  final String id = Get.arguments['id'] ?? '';

  @override
  Widget build(BuildContext context) {
    final AddListController controller = Get.put(AddListController());
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Lists',
      ),
      body: Center(
        child: Column(
          children: [
            Text('Add List'),
            Text('ID: $id'),
          ],
        ),
      ),
    );
  }
}
