import 'package:flutter/material.dart';
import 'package:shop1/screen/product_detail_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';
import './screen/home_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'My shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Noto Serif Ethiopic',
        ),
        home: const Home(),
        routes: {
          // ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },
      ),
    );
  }
}
