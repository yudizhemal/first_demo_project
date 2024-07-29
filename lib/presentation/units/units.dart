import 'package:first_demo_project/Theme/Colors.dart';
import 'package:first_demo_project/presentation/units/widgets/unit_item_widget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '/widgets/CustomAppbar.dart';
import 'controller/units_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Units extends StatelessWidget {
  // List of items in our dropdown menu
  Units({super.key});

  final UnitsController controller = Get.find<UnitsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Manage Units',
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.unitList.length,
                itemBuilder: (context, index) {
                  final unit = controller.unitList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: UnitItemWidget(unit: unit),
                  );
                },
              );
            }),
          ),
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          visible: true,
          overlayColor: Colors.black,
          overlayOpacity: 0.1,
          useRotationAnimation: true,
          tooltip: 'Action',
          heroTag: 'speed-dial-hero-tag',
          foregroundColor: lightTextColor,
          backgroundColor: primaryColor,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          onPress: () {
            controller.showAddUnitDialog(context);
          },
        ));
  }
}
