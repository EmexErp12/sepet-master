// ignore_for_file: file_names

import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sepet/product/butonlar_sepet.dart';

import '../components/price_widget.dart';
import '../utilities/app_constants.dart';
import 'product_model.dart';

class PruductItemWidget extends StatelessWidget {
  final ProductModel product;
  const PruductItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(product.title);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 6, right: 46, bottom: 6),
              child: AutoSizeText(
                product.title,
                style: const TextStyle(fontSize: 16),
                maxLines: 3,
                minFontSize: 12,
                maxFontSize: 30,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: AppConstants.padding,
                  child: PriceWidget(
                    price: product.price ?? 0,
                    isBold: true,
                    fontColor: Colors.blue.shade700,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
