import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sepet/sepet_controller.dart';
import 'product_model.dart';

class ButonlarSepet extends ConsumerWidget {
  final ProductModel model;

  const ButonlarSepet({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(sepetProvider);
    var sepetItemCout = provider.getItemCount(model);

    return Card(
      child: SizedBox(
        width: 40,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.addProduct(model);
              },
              child: const SizedBox(
                height: 40,
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
            Visibility(
              visible: sepetItemCout > 0,
              child: GestureDetector(
                onTap: () {
                  provider.addProduct(model);
                },
                child: SizedBox(
                  height: 30,
                  child: Center(
                    child: quentity(ref),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: sepetItemCout > 0,
              child: GestureDetector(
                onTap: () {
                  provider.removeProduct(model);
                },
                onLongPress: () {
                  provider.removeAllProduct(model);
                },
                child: SizedBox(
                  height: 30,
                  child: Icon(
                    sepetItemCout == 1 ? CupertinoIcons.delete : Icons.remove,
                    size: sepetItemCout == 1 ? 24 : 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget quentity(WidgetRef ref) {
    final provider = ref.read(sepetProvider);
    var quentity = provider.getItemCount(model);
    return quentity > 0
        ? AutoSizeText(
            quentity.toString(),
            maxLines: 1,
            minFontSize: 8,
          )
        : const SizedBox(height: 0);
  }
}
