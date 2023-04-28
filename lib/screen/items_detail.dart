import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shop1/models/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ItemDetail extends StatefulWidget {
  final pro;
  ItemDetail(this.pro);

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    Product itmD = widget.pro;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: ((context, index) => Card(
              child: Column(
                children: [
                  Image.network(itmD.imageUrl),
                  Text(itmD.price.toString()),
                ],
              ),
            )));
  }
}
