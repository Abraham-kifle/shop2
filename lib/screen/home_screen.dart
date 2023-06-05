import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigational_bar.dart';
import '../providers/products.dart';
import 'product_detail_screen.dart';
import 'products_overview_screen.dart';
import '../widgets/favorite.dart';
import '../providers/cart.dart';

enum FilterOptions { Favorites, All }

class Home extends StatelessWidget {
  List<Widget> pages = [
    const ProductOverviewScreen(),
    const ProductDetailScreen()
  ];

  @override
  Widget build(BuildContext context) {
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
                                    pro: products.ids,
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
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (FilterOptions selectedvalue) {
                  if (selectedvalue == FilterOptions.Favorites) {
                    products.showFavoriteOnly();
                    products.change(FavoriteProductsScreen(), 'Favorite');
                    products.setCount(-1);
                    products.setBottomBar(0);
                  } else {
                    products.showAll();
                    products.change(
                        const ProductOverviewScreen(), 'KdameGebeya');
                    products.setCount(0);
                    products.setBottomBar(0);
                  }
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: FilterOptions.Favorites,
                        child: Text('Only Favorites'),
                      ),
                      const PopupMenuItem(
                        value: FilterOptions.All,
                        child: Text('Show All'),
                      )
                    ]),
          ],
        ),
        body: products.page,
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
