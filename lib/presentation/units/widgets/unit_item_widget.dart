import 'package:first_demo_project/presentation/units/models/unit_model.dart';
import 'package:flutter/material.dart';

class UnitItemWidget extends StatelessWidget {
  final UnitModel unit;

  UnitItemWidget({required this.unit});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onPrimary,
      elevation: 3,
      child: InkWell(
        onTap: () {
          print(unit.id);
        },
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          title: Text(unit.name),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueGrey),
        ),
      ),
    );
  }
}
