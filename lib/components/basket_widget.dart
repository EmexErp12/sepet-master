import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'price_widget.dart';
import '../sepet/sepet_controller.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.shopping_cart),
        Consumer(builder: (context, ref, _) {
          final total = ref.watch(sepetProvider.select((sepetController) => sepetController.sepet.total));
          return PriceWidget(
            price: total,
          );
        }),
      ],
    );
  }
}
