import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'product/product_view.dart';
import 'utilities/app_constants.dart';

import 'binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: AppConstants.fontFamily,
        primarySwatch: Colors.red,
      ),
      home: const ProductView(),
    );
  }
}
