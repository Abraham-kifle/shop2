import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop1/models/product.dart';
import 'package:shop1/screen/items_detail.dart';
import 'package:shop1/screen/products_overview_screen.dart';
import 'package:shop1/widgets/bottom_navigational_bar.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  final pro;

  ProductDetailScreen({this.pro});

  // static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Products>(context)
        .items
        .firstWhere((prod) => prod.id == pro);

    int page = 0;
    // Product itmD = widget.pro;
    return Consumer<Products>(
      builder: (context, products, child) => GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            footer: GridTileBar(
              leading: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary,
              ),
              backgroundColor: Colors.black87,
              title: Text(
                // itmD.type[0]['type$i'],
                loadedProduct.type[0]['type$i'],
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                page = i;
                products.change(
                    Center(child: Text(
                        // itmD.title.toString()
                        loadedProduct.title)),
                    // itmD.title
                    loadedProduct.title);
                products.incrementCount();
              },
              child: Image.network(
                // itmD.type[2]['image$i'],
                loadedProduct.type[2]['image$i'],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        itemCount:
            //  itmD.type[0].length,
            loadedProduct.type[0].length,
        // itmD.type[0].length,
      ),
    );
  }
}
