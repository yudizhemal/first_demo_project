import 'package:first_demo_project/presentation/add-list/models/listItem_model.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final ListItemModel listItem;

  ListItemWidget({required this.listItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      elevation: 3,
      child: InkWell(
        onTap: () {
          print(listItem.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          title: Text(listItem.item),
          subtitle: Text(listItem.quantity),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
