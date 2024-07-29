import 'package:first_demo_project/Theme/Colors.dart';
import 'package:first_demo_project/presentation/units/models/unit_model.dart';
import 'package:first_demo_project/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class UnitsController extends GetxController {
  var unitList = <UnitModel>[].obs;
  final Uuid uuid = const Uuid();

  void addUnit(String name) {
    final id = uuid.v4();
    unitList
        .add(UnitModel(id: id, name: name));
  }

  void showAddUnitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String unitName = '';
        return AlertDialog(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add Unit',
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
                    value: unitName,
                    label: 'Unit',
                    hintText: 'Unit Name',
                    onTextChanged: (value) {
                      unitName = value;
                    }),
                const SizedBox(height: 10),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (unitName.isEmpty) {
                  return;
                }
                addUnit(unitName);
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
