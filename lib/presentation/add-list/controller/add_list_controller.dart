import 'package:first_demo_project/presentation/home/controller/home_controller.dart';
import 'package:get/get.dart';

class AddListController extends GetxController {
  late HomeController homeController;
  late List categoryList;

  @override
  void onInit() {
    homeController = Get.find();
    categoryList = homeController.categoryList.toList();
    super.onInit();
  }
}
