import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop1/widgets/bottom_navigational_bar.dart';
import '../providers/products.dart';
import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Products>(
      builder: (context, products, _) => Scaffold(
        body: Column(
          children: [
            Flexible(
              child: Products_Grid(),
            ),
          ],
        ),
      ),
    );
  }
}
