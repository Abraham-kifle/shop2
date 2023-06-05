import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
import './items_detail.dart';

class ProductDetailScreen extends StatelessWidget {
  final pro;

  const ProductDetailScreen({super.key, this.pro});

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(
      context,
    );
    //final product = Provider.of<Product>(context, listen: false);
    // // Retrieve the isFavorite property from the product instance
    // final isFavorite = product.isFavorite;
    final loadedProduct = Provider.of<Products>(context).findById(pro);

    // Product itmD = widget.pro;
    return Consumer<Products>(
      builder: (context, products, _) => GridView.builder(
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
                      icon: Icon(
                        //  items[typeIndex].types[typeIndex].isFavorite,
                        // loadedProduct.types[i].isFavorite
                        loadedProduct.types[i].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      onPressed: () {
                        products.toggleProductTypeFavorite(
                            loadedProduct.types[i].id, products.index);
                      },
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    backgroundColor: Colors.black87,
                    title: Text(
                      // itmD.type[0]['type$i'],
                      loadedProduct.types[i].productQuality,
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      icon: Icon(cart.contains(loadedProduct.types[i].id)
                          ? Icons.shopping_cart_checkout_rounded
                          : Icons.shopping_cart),
                      onPressed: () {
                        cart.addItem(
                            loadedProduct.types[i].id,
                            loadedProduct.types[i].name,
                            loadedProduct.types[i].image,
                            loadedProduct.types[i].price,
                            loadedProduct.types[i].productQuality,
                            loadedProduct.types[i].description);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                              'Added Item to Card',
                            ),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: () {
                                  cart.removeSingleItem(
                                      loadedProduct.types[i].id);
                                })));
                      },
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      products.change(
                          ItemDetailScreen(
                            loadedProduct.types[i].image,
                            loadedProduct.types[i].price,
                            loadedProduct.types[i].description,
                          ),
                          loadedProduct.types[i].productQuality);
                      products.incrementCount();
                    },
                    child: Image.network(
                      // itmD.type[2]['image$i'],
                      loadedProduct.types[i].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          itemCount:
              //  itmD.type[0].length,
              loadedProduct.types.length
          // itmD.type[0].length,
          ),
    );
  }
}
