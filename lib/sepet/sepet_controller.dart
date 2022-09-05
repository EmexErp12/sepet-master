import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sepet/sepet/sepet_model.dart';
import 'package:sepet/sepet/sepet_row_model.dart';
import 'package:sepet/service/factory_service.dart';
import 'package:sepet/service/i_service.dart';
import 'package:sepet/utilities/app_constants.dart';

import '../product/product_model.dart';
import '../utilities/extensions.dart';

class SepetController extends ChangeNotifier {
  SepetModel sepet = SepetModel();

  final IService _iservice = FactoryService.instance();

  SepetController() {
    _getSepetValue();
  }

  void addProduct(ProductModel product) {
    for (var item in sepet.sepetRowModel!) {
      if (item.product.id == product.id) {
        item.quentity++;
        sepet.total += (item.product.price ?? 0);
        notifyListeners();
        _iservice.save(sepet.toJson());

        return;
      }
    }

    sepet.sepetRowModel!.add(SepetRowModel(product: product));

    sepet.total += (product.price ?? 0).roundDecimal();
    notifyListeners();
    _iservice.save(sepet.toJson());
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
          break;
        }
      }
    }

    notifyListeners();
    _iservice.save(sepet.toJson());
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
      _iservice.save(sepet.toJson());
    }
  }

  void _getSepetValue() {
    _iservice.get(AppConstants.hiveSepetKey).then((value) {
      if (null != value) {
        sepet = SepetModel.fromJson(value);
        notifyListeners();
      }
    });
  }
}

final sepetProvider = ChangeNotifierProvider((ref) {
  return SepetController();
});
