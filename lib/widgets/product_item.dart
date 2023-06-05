import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final ontap;
  // ProductItem(
  //     {required this.id,
  //     required this.title,
  //     required this.imageUrl,
  //     required this.ontap});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Consumer<Products>(
      builder: (context, products, _) => GestureDetector(
        onTap: () {
          final int index =
              products.items.indexWhere((p) => p.id == product.id);
          products.setIndexs(index);
          products.change(
              ProductDetailScreen(
                pro: product.id,
              ),
              product.title);
          products.setIndex(product.id);
          products.incrementCount();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
            ),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
