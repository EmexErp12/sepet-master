import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:sepet/sepet/sepet_model.dart';
import 'package:sepet/sepet/sepet_row_model.dart';

import '../product/product_model.dart';
import '../utilities/extensions.dart';

class SepetController extends ChangeNotifier {
  late SepetModel sepet = SepetModel();

  SepetController() {
    _getSepetValue();
  }

  void addProduct(ProductModel product) {
    for (var item in sepet.sepetRowModel!) {
      if (item.product.id == product.id) {
        item.quentity++;
        sepet.total += (item.product.price ?? 0);
        notifyListeners();
        _saveHive();

        return;
      }
    }

    sepet.sepetRowModel!.add(SepetRowModel(product: product));

    sepet.total += (product.price ?? 0).roundDecimal();
    notifyListeners();
    _saveHive();
  }

  int getItemCount(ProductModel productModel) {
    for (var item in sepet.sepetRowModel!) {
      if (item.product.id == productModel.id) {
        return item.quentity;
      }
    }

    return 0;
  }

  void removeProduct(ProductModel product) {
    for (var item in sepet.sepetRowModel!) {
      if (item.product.id == product.id) {
        sepet.total -= (item.product.price ?? 0);
        item.quentity--;
        if (item.quentity == 0) {
          sepet.sepetRowModel!.remove(item);
        }
        notifyListeners();
        _saveHive();
      }
    }
  }

  void removeAllProduct(ProductModel product) {
    var removedItems = <SepetRowModel>[];

    for (var item in sepet.sepetRowModel!) {
      if (item.product.id == product.id) {
        sepet.total -= ((item.product.price ?? 0) * item.quentity);
        removedItems.add(item);
      }
    }

    if (removedItems.isNotEmpty) {
      sepet.sepetRowModel!.removeWhere((item) => removedItems.contains(item));
      notifyListeners();
      _saveHive();
    }
  }

  void _getSepetValue() {
    _getHive().then((value) {
      if (value != null) {
        sepet = SepetModel.fromJson(value);
        notifyListeners();
      }
    });
  }

  Future<void> _saveHive() async {
    var box = await Hive.openBox('sepet');
    var json = sepet.toJson();
    box.put("sepet", jsonEncode(json));
  }

  Future<Map<String, dynamic>?> _getHive() async {
    var box = await Hive.openBox('sepet');
    var str = box.get("sepet");
    return jsonDecode(str);
  }
}

final sepetProvider = ChangeNotifierProvider((ref) {
  return SepetController();
});
