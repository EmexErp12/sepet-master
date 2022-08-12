import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/basket_widget.dart';
import '../components/price_widget.dart';
import 'product_controller.dart';
import '../sepet/sepet_controller.dart';
import '../utilities/app_constants.dart';

import 'pruduct_Item_widget.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductConttroller productConttroller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          GetX<SepetController>(
            builder: (controller) => controller.total.value > 0 ? const BasketWidget() : const SizedBox(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isLandscape ? 5 : 3,
                  ),
                  itemCount: productConttroller.list.length,
                  itemBuilder: (context, index) {
                    return PruductItemWidget(index: index);
                  }),
            ),
          ),
          GetX<SepetController>(builder: (controller) {
            return Align(
              alignment: Alignment.centerRight,
              child: controller.total.value > 0
                  ? PriceWidget(price: controller.total.value, liraSize: 30, kurusSize: 16)
                  : const SizedBox(),
            );
          }),
        ],
      ),
    );
  }
}
