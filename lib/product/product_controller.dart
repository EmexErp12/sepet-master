import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_model.dart';
import '../repository/product_repository.dart';

final productFutureProvider = FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  return await ProductRepository().getProducts();
});
