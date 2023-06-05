import 'package:flutter/material.dart';
import 'package:shop1/providers/product_type.dart';
import 'package:shop1/screen/edit_productType.dart';
import '../screen/edit_product_screen.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final List<ProductType> types;

  UserProductItem(this.types);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: types.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(types[i].productQuality),
        leading: CircleAvatar(backgroundImage: NetworkImage(types[i].image)),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  products.change(
                      EditedProductScreenT(ids: '', imageUrls: '', titles: ''),
                      'Edit Product');
                },
                icon: const Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              )
            ],
          ),
        ),
      ),
    );
  }
}
