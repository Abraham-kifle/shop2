import 'package:flutter/material.dart';
import 'package:shop1/screen/products_overview_screen.dart';
import '../screen/cart_screen.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../screen/orders_screen.dart';
import '../screen/user_product_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final productProvider = Provider.of<Products>(context);
    return BottomNavigationBar(
      selectedItemColor: Colors.purple,
      items: _bottomNavBarItems,
      currentIndex: productProvider.bottomBar,
      onTap: (index) {
        setState(() {
          productProvider.setBottomBar(index);
        });
        if (index == 0) {
          cart.addPlus = 0;
          productProvider.showAll();
          productProvider.change(ProductOverviewScreen(), 'KdameGebeya');
          productProvider.setCount(0);
        } else if (index == 1) {
          cart.addPlus = 0;
          productProvider.change(const CartScreen(), 'Cart');
          productProvider.setCount(0);
        } else if (index == 2) {
          cart.addPlus = 0;
          productProvider.change(const OrdersScreen(), 'Order');
        } else if (index == 3) {
          cart.addPlus = 1;
          productProvider.change(const UserProductsScreen(), 'Your Products');
        }
      },
      type: BottomNavigationBarType.fixed,
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home', tooltip: 'Go to Home'),
    BottomNavigationBarItem(
      icon: Consumer<Cart>(
        builder: (_, cart, ch) =>
            Badges(value: cart.itemCount.toString(), child: ch!),
        child: const Icon(Icons.shopping_cart),
      ),
      label: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_shipping),
      label: 'Orders',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.menu),
      label: 'Menu',
    ),
  ];
}
