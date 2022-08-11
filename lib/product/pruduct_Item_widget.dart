// ignore_for_file: file_names

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sepet/product/butonlar_sepet.dart';

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

    var product = productConttroller.list[index];

    log(product.title!);

    return Stack(
      children: [
        anaBolum(product),
        Positioned(
          right: -4,
          top: -4,
          child: ButonlarSepet(model: product),
        ),
      ],
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
