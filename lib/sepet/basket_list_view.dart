import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepet/sepet/sepet_controller.dart';

class BasketListView extends StatelessWidget {
  const BasketListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SepetController sepetController = Get.find();
    final sepetRowList = sepetController.sepetRowModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet Icerigi'),
      ),
      body: ListView.builder(
        itemCount: sepetRowList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(sepetRowList[index].product.title),
          );
        },
      ),
    );
  }
}
