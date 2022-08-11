import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sepet/product/product_model.dart';
import 'package:sepet/sepet/sepet_controller.dart';

class ButonlarSepet extends StatefulWidget {
  final ProductModel model;

  const ButonlarSepet({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ButonlarSepet> createState() => _ButonlarSepetState();
}

class _ButonlarSepetState extends State<ButonlarSepet> {
  @override
  Widget build(BuildContext context) {
    SepetController sepetController = Get.find();

    var sepetItemCout = sepetController.getItemCount(widget.model);

    return Card(
      child: SizedBox(
        width: 40,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                sepetController.addProduct(widget.model);
                setState(() {});
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
                  sepetController.addProduct(widget.model);
                  setState(() {});
                },
                child: SizedBox(
                  height: 30,
                  child: Center(
                    child: quentity(sepetController),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: sepetItemCout > 0,
              child: GestureDetector(
                onTap: () {
                  sepetController.removeProduct(widget.model);
                  setState(() {});
                },
                onLongPress: () {
                  sepetController.removeAllProduct(widget.model);
                  setState(() {});
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

  Widget quentity(SepetController sepetController) {
    var quentity = sepetController.getItemCount(widget.model);
    return quentity > 0
        ? AutoSizeText(
            quentity.toString(),
            maxLines: 1,
            minFontSize: 8,
          )
        : const SizedBox(height: 0);
  }
}
