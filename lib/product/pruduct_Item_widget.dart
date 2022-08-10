// ignore_for_file: file_names

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/price_widget.dart';
import 'product_controller.dart';
import 'product_model.dart';
import '../sepet/sepet_controller.dart';
import '../utilities/app_constants.dart';

class PruductItemWidget extends StatelessWidget {
  final int index;
  const PruductItemWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductConttroller productConttroller = Get.find();
    SepetController sepetController = Get.find();

    var product = productConttroller.list[index];

    log(product.title!);

    return InkWell(
      onTap: () {
        sepetController.addProduct(productConttroller.list[index]);
      },
      child: Stack(
        children: [
          anaBolum(product),
          Positioned(
            right: -4,
            top: -4,
            child: butonlar(),
          ),
        ],
      ),
    );
  }

  Widget butonlar() {
    return Card(
      child: SizedBox(
        width: 40,
        child: Column(
          children: const [
            SizedBox(
              height: 40,
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
            SizedBox(
              height: 30,
              child: Center(
                child: AutoSizeText(
                  '999',
                  maxLines: 1,
                  minFontSize: 8,
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: Icon(
                Icons.remove,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget anaBolum(ProductModel product) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 108),
      child: Card(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Padding(
            padding: AppConstants.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    product.title ?? '',
                    style: const TextStyle(fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          PriceWidget(price: product.price ?? 0)
        ]),
      ),
    );
  }
}
