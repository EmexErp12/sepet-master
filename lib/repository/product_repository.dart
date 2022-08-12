import 'dart:convert';

import '../product/product_model.dart';

import '../service/api_service.dart';

class ProductRepository {
  Future<List<ProductModel>> getProducts() async {
    var gelenString = await ApiService.get('dummyjson.com', '/products');

    if (null != gelenString) {
      var json = jsonDecode(gelenString);

      var products = json['products'] as List;

      products.sort((a, b) => a['title'].compareTo(b['title']));

      products.reversed.toList();

      return products.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      return <ProductModel>[];
    }
  }
}
