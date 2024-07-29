  import 'package:first_demo_project/Theme/Colors.dart';
  import 'package:first_demo_project/routes/app_routes.dart';
  import 'package:first_demo_project/widgets/CustomAppbar.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_speed_dial/flutter_speed_dial.dart';
  import 'package:get/get.dart';
  import 'controller/home_controller.dart';
  import 'widgets/category_item_widget.dart';

  class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final HomeController controller = Get.put(HomeController());

      return Scaffold(
          appBar: CustomAppBar(
            title: 'Dashboard',
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    final category = controller.categoryList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: CategoryItemWidget(category: category),
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
            children: [
              SpeedDialChild(
                child: const Icon(Icons.list_alt) ,
                backgroundColor: Colors.orange,
                foregroundColor: lightTextColor,
                label: 'List',
                onTap: () => Get.toNamed(AppRoutes.addList),
              ),
              SpeedDialChild(
                child: const Icon(Icons.category_outlined),
                backgroundColor: Colors.blueAccent,
                foregroundColor: lightTextColor,
                label: 'Category',
                onTap: () => controller.showAddCategoryDialog(context),
              ),
            ],
          ));
    }
  }
