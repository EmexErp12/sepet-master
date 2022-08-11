import 'package:get/get.dart';

import '../product/product_model.dart';
import '../utilities/extensions.dart';
import 'sepet_row_model.dart';

class SepetController extends GetxController {
  final RxList<SepetRowModel> _sepetRowModel = <SepetRowModel>[].obs;

  RxDouble total = 0.0.obs;

  void addProduct(ProductModel product) {
    for (var item in _sepetRowModel) {
      if (item.product.id == product.id) {
        item.quentity++;
        total.value += (item.product.price ?? 0);
        return;
      }
    }

    _sepetRowModel.add(SepetRowModel(product: product));

    total.value += (product.price ?? 0).roundDecimal();
  }

  int getItemCount(ProductModel productModel) {
    for (var item in _sepetRowModel) {
      if (item.product.id == productModel.id) {
        return item.quentity;
      }
    }
    return 0;
  }

  void removeProduct(ProductModel product) {
    for (var item in _sepetRowModel) {
      if (item.product.id == product.id) {
        total.value -= (item.product.price ?? 0);
        item.quentity--;
        if (item.quentity == 0) {
          _sepetRowModel.remove(item);
        }

        return;
      }
    }
  }

  List<SepetRowModel> get sepetRowModel => _sepetRowModel;

  void removeAllProduct(ProductModel product) {
    for (var item in _sepetRowModel) {
      if (item.product.id == product.id) {
        total.value -= ((item.product.price ?? 0) * item.quentity);

        _sepetRowModel.remove(item);

        return;
      }
    }
  }
}
