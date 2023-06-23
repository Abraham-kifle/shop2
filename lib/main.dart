import 'package:flutter/material.dart';
import 'package:shop1/screen/edit_productType.dart';
import 'package:shop1/screen/products_overview_screen.dart';
import './providers/product_type.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import './screen/home_screen.dart';
import './providers/product.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import 'widgets/user_product_item.dart';

void main() {
  // debugPaintSizeEnabled = true; // To show widget boundaries
  // debugPaintBaselinesEnabled = true; // To show widget baselines
  // debugPaintPointersEnabled = true;
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Map<String, WidgetBuilder> routes = {
  //   '/edited-product-types': (context) =>
  //       EditedProductScreenT(ids: '', titles: '', imageUrls: ''),
  // };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final products = Provider.of<Products>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(
            create: (context) => Product(
                  id: '',
                  imageUrl: '',
                  title: '',
                  types: [],
                )),
        ChangeNotifierProvider(
            create: (context) => ProductType(
                id: '',
                name: '',
                productQuality: '',
                price: 0.0,
                description: '',
                image: '')),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'My shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Noto Serif Ethiopic',
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
        routes: {
          EditedProductScreenT.routeName: (ctx) => EditedProductScreenT(),
          ProductOverviewScreen.routeName: (ctx) =>
              const ProductOverviewScreen(),
        },
      ),
    );
  }
}
