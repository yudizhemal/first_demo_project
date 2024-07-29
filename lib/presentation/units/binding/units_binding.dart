import 'package:get/get.dart';
import '../controller/units_controller.dart';

class UnitsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UnitsController>(UnitsController(), permanent: true);
  }
}
