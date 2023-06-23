import 'package:flutter/material.dart';
import 'package:shop1/providers/product_type.dart';
import 'package:shop1/screen/edit_productType.dart';
import '../providers/product.dart';
import '../screen/edit_product_screen.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  static const routeName = '/product-userproduct';
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
                  Navigator.of(context).pushNamed(
                    EditedProductScreenT.routeName,
                    arguments: types[i].id,
                  );
                  //products.change(EditedProductScreenT(false), 'Edit Products');
                },
                icon: const Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                onPressed: () {
                  products.deleteProduct(types[i].id);
                },
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
