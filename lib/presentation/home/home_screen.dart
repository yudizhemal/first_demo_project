import 'package:first_demo_project/widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'widgets/category_item_widget.dart';

class HomeScreen extends StatelessWidget {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
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
        floatingActionButtonLocation: selectedfABLocation,
        floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          mini: mini,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          buttonSize: buttonSize, // it's the SpeedDial size which defaults to 56 itself
          childrenButtonSize: childrenButtonSize,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,
          overlayColor: Colors.black,
          overlayOpacity: 0.1,
          useRotationAnimation: useRAnimation,
          tooltip: 'Action',
          heroTag: 'speed-dial-hero-tag',
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Theme.of(context).colorScheme.error,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          children: [
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.list_alt) : null,
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              label: 'List',
              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.category_outlined) : null,
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              label: 'Category',
              onTap: () => controller.showAddCategoryDialog(context),
            ),
          ],
        ));
  }
}
