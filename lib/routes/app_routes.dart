import 'package:first_demo_project/presentation/units/binding/units_binding.dart';
import 'package:first_demo_project/presentation/units/units.dart';

import '../presentation/add-list/add_list.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/home/binding/home_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initialRoute = '/initialRoute';
  static const String home = '/home';
  static const String addList = '/add-list';
  static const String units = '/units';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/add-list',
      page: () => AddList(),
    ),
    GetPage(name: '/units', page: () => Units(), binding: UnitsBinding()),
  ];
}
