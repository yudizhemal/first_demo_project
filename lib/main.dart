import 'package:first_demo_project/Theme/Colors.dart';
import 'package:first_demo_project/presentation/add-list/binding/add_list_binding.dart';
import '../routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: backgroundColor3),
        scaffoldBackgroundColor: backgroundColor3,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: lightTextColor),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      initialBinding:AddListBinding(),
      getPages: AppRoutes.pages,
    );
  }
}
