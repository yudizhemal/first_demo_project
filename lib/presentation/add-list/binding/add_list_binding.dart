import 'package:first_demo_project/presentation/units/controller/units_controller.dart';
import 'package:get/get.dart';
import '../controller/add_list_controller.dart';

class AddListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UnitsController>(UnitsController());
    Get.put<AddListController>(AddListController());
  }
}

