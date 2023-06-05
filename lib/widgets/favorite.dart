import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class FavoriteProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        final productIndex = products[index];
        final favoriteTypes =
            productIndex.types.where((type) => type.isFavorite).toList();

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productIndex.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favoriteTypes.length,
                itemBuilder: (ctx, i) {
                  final type = favoriteTypes[i];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        type.image,
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(type.productQuality),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                    // Display other details or widgets for the product type
                  );
                },
              ),
              const Divider(), // Add a separator between products
            ],
          ),
        );
      },
    );
  }
}
