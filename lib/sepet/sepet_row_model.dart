import '../product/product_model.dart';

class SepetRowModel {
  int quentity = 1;
  final ProductModel product;
  SepetRowModel({required this.product, this.quentity = 1});
}
