import 'package:flutter/material.dart';
import 'package:sepet/command/adisyon.dart';
import 'package:sepet/command/mutfak.dart';
import 'package:sepet/deneme.dart';
import 'package:sepet/product/product_model.dart';
import 'package:sepet/sepet/basket_list_view.dart';
import '../components/basket_widget.dart';
import 'product_controller.dart';
import '../sepet/sepet_controller.dart';
import '../utilities/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pruduct_Item_widget.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

// Stream<int> getRandomValues() async* {
//   var random = Random(2);

//   while (true) {
//     await Future.delayed(const Duration(seconds: 1));
//     yield random.nextInt(100);
//   }

// }

class _ProductViewState extends State<ProductView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          Consumer(builder: (context, ref, _) {
            final total = ref.watch(sepetProvider.select((value) => value.sepet.total));
            return total > 0
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BasketListView()),
                      );
                    },
                    child: const BasketWidget())
                : const SizedBox();
          }),
        ],
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, _) {
            AsyncValue<List<ProductModel>> provider = ref.watch(productFutureProvider);
            return Expanded(
              child: provider.when(
                data: (data) {
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return PruductItemWidget(product: data[index]);
                      });
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                error: (err, stack) {
                  return Text('Error: $err');
                },
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Adisyon().execute();
            Mutfak().execute();
          },
          child: StreamBuilder(
              initialData: 'ali',
              stream: null, //getRandomValues(),
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              })),
    );
  }
}
