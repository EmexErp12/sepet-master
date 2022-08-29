import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sepet/components/basket_widget.dart';
import 'package:sepet/components/price_widget.dart';
import 'package:sepet/product/butonlar_sepet.dart';

import 'package:sepet/sepet/sepet_controller.dart';

class BasketListView extends ConsumerWidget {
  const BasketListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sepetController = ref.watch(sepetProvider);
    final sepetRowList = sepetController.sepet.sepetRowModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet Icerigi'),
        actions: [
          sepetController.sepet.total > 0 ? const BasketWidget() : const SizedBox(),
        ],
      ),
      body: ListView.builder(
        itemCount: sepetRowList!.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Card(
                  child: ListTile(
                    title: Text(sepetRowList[index].product.title),
                    subtitle: PriceWidget(price: sepetRowList[index].product.price ?? 0),
                  ),
                ),
              ),
              Positioned(
                right: -4,
                top: -4,
                child: ButonlarSepet(model: sepetRowList[index].product),
              )
            ],
          );
        },
      ),
    );
  }
}
