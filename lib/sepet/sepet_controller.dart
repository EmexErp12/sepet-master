import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sepet/sepet/sepet_model.dart';
import 'package:sepet/sepet/sepet_row_model.dart';
import 'package:sepet/utilities/app_constants.dart';

import '../product/product_model.dart';
import '../utilities/extensions.dart';

class SepetController extends ChangeNotifier {
  SepetModel sepet = SepetModel();

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
    // for (int i = sepet.sepetRowModel!.length - 1; i >= 0; i--) {
    //   var item = sepet.sepetRowModel![i];
    //   if (item.product.id == product.id) {
    //     sepet.total -= (item.product.price ?? 0);
    //     item.quentity--;
    //     if (item.quentity == 0) {
    //       sepet.sepetRowModel!.remove(item);
    //       break;
    //     }
    //   }
    // }

    // notifyListeners();
    // _saveHive();

    // var removedItems = <SepetRowModel>[];

    for (var item in sepet.sepetRowModel!) {
      if (item.product.id == product.id) {
        sepet.total -= (item.product.price ?? 0);
        item.quentity--;
        if (item.quentity == 0) {
          sepet.sepetRowModel!.remove(item);
          break;
        }
      }
    }

    notifyListeners();
    _saveHive();

    // if (removedItems.isNotEmpty) {
    //   for (var item in removedItems) {
    //     if (sepet.sepetRowModel!.contains(item)) {
    //       sepet.sepetRowModel!.remove(item);
    //     }
    //   }
    // }
  }

  void removeAllProduct(ProductModel product) {
    var removedItems = <SepetRowModel>[];

    for (var item in sepet.sepetRowModel!) {
      if (item.product.id == product.id) {
        sepet.total -= ((item.product.price ?? 0) * item.quentity);
        removedItems.add(item);
        break;
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
      if (null != value) {
        sepet = SepetModel.fromJson(value);
        notifyListeners();
      }
    });
  }

  Future<void> _saveHive() async {
    var box = await Hive.openBox(AppConstants.hiveSepetKey);
    var json = sepet.toJson();
    box.put(AppConstants.hiveSepetKey, jsonEncode(json));
  }

  Future<Map<String, dynamic>?> _getHive() async {
    var box = await Hive.openBox(AppConstants.hiveSepetKey);
    var value = box.get(AppConstants.hiveSepetKey);
    if (value != null) {
      return jsonDecode(value);
    }
    return null;
  }
}

final sepetProvider = ChangeNotifierProvider((ref) {
  return SepetController();
});
