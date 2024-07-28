import 'package:first_demo_project/Theme/Colors.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          // hintStyle: TextStyle(
          //   color: Colors.grey,
          // ),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          //   borderSide: BorderSide(color: Colors.grey, width: 1),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          //   borderSide: BorderSide(color: primaryColor, width: 2),
          // ),
          // contentPadding: EdgeInsets.symmetric(
          //   horizontal: 12,
          // ),
          // constraints: BoxConstraints(
          //   maxHeight: 44,
          // ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
