import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product/product_view.dart';
import 'utilities/app_constants.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
