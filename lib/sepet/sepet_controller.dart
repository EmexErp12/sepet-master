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
        total.value += (product.price ?? 0);
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

  void removeProduct(ProductModel product) {}

  List<SepetRowModel> get sepetRowModel => _sepetRowModel;
}
