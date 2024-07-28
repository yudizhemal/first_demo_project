import 'package:first_demo_project/presentation/add-list/models/listItem_model.dart';
import 'package:first_demo_project/presentation/home/controller/home_controller.dart';
import 'package:first_demo_project/widgets/CustomDropdown.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddListController extends GetxController {
  final Uuid uuid = const Uuid();
  late HomeController homeController;
  late List categoryList;
  var listItem = <ListItemModel>[];
  var creatorName = '';
  var creatorMobileNumber = '';
  var listName = '';
  var categoryId = '';
  var isListAdded = false;
  var item = '';
  var quantity = '';
  var unit = '';

  @override
  void onInit() {
    homeController = Get.find();
    categoryList = homeController.categoryList.toList();
    super.onInit();
  }

  void onCategoryChange(DropdownItem item) {
    categoryId = item.value;
  }

  void onCreatorNameChange(String value) {
    creatorName = value;
  }

  void onCreatorMobileNumberChange(String value) {
    creatorMobileNumber = value;
  }

  void onListNameChange(String value) {
    listName = value;
  }

  void addListItem() {
    final id = uuid.v4();
    listItem
        .add(ListItemModel(id: id, item: item, quantity: quantity, unit: unit));
  }

  void cancelAddList() {
    creatorName = '';
    creatorMobileNumber = '';
    listName = '';
    categoryId = '';
    listItem = [];
  }
}
