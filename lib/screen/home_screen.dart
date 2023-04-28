import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop1/widgets/bottom_navigational_bar.dart';
import '../providers/products.dart';
import 'product_detail_screen.dart';
import 'products_overview_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [ProductOverviewScreen(), ProductDetailScreen()];
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = productData.items;
    return Consumer<Products>(
      builder: (context, products, _) => Scaffold(
        appBar: AppBar(
          title: Center(
              child: products.count > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            products.decrementCount();
                            if (products.count == 0) {
                              products.change(
                                  ProductOverviewScreen(), 'KdameGebeya');
                            }
                            if (products.count == 1) {
                              products.change(
                                  ProductDetailScreen(
                                    pro: product[products.count].id,
                                  ),
                                  products.appBarTitle);
                            }
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Center(child: Text(products.appBarTitle))),
                      ],
                    )
                  : Text(products.appBarTitle)),
        ),
        body: products.page,
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
