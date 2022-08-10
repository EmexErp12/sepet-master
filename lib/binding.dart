import 'package:get/get.dart';

import 'product/product_controller.dart';
import 'sepet/sepet_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductConttroller>(ProductConttroller());
    Get.lazyPut<SepetController>(() => SepetController());
  }
}
