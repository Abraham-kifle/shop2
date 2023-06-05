import 'package:flutter/material.dart';
import '../providers/products.dart';
import '../screen/product_detail_screen.dart';
import './product_item.dart';
import 'package:provider/provider.dart';

class Products_Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final product = productData.items;
    return Consumer<Products>(
      builder: (context, products, child) => GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 2.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, i) {
          return ChangeNotifierProvider.value(
            value: product[i],
            child: ProductItem(
                // id: product[i].id,
                // title: product[i].title,
                // imageUrl: product[i].imageUrl,

                ),
          );
        },
        itemCount: product.length,
      ),
    );
  }
}
