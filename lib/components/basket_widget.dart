import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sepet/basket_list_view.dart';
import 'price_widget.dart';
import '../sepet/sepet_controller.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const BasketListView());
      },
      child: Row(
        children: [
          const Icon(Icons.shopping_cart),
          GetX<SepetController>(
            builder: (sepetController) => PriceWidget(
              price: sepetController.total.value,
            ),
          ),
        ],
      ),
    );
  }
}
