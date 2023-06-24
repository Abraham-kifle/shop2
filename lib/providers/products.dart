import 'dart:convert';
import 'package:flutter/material.dart';
import 'product.dart';
import '../screen/products_overview_screen.dart';
import '../providers/product_type.dart';
import 'package:http/http.dart' as http;

class Products extends ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'ጤፍ',
      types: [
        ProductType(
            id: 'p10',
            name: 'ጤፍ',
            productQuality: 'ልዩ ማኛ ጤፍ',
            price: 60.0,
            description: 'The Description of item write hear',
            image:
                'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p10',
            name: 'ጤፍ',
            productQuality: 'ማኛ ጤፍ',
            price: 50,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p13',
            name: 'ጤፍ',
            productQuality: 'መለስትኛ ጤፍ',
            price: 40,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p14',
            name: 'ጤፍ',
            productQuality: 'ሰርገኛ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
            isFavorite: false,
            isAddToCart: false),
      ],
      imageUrl:
          'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
    ),
    Product(
      id: 'p2',
      title: 'ስንዴ',
      types: [
        ProductType(
          id: "p21",
          name: 'ጤፍ',
          productQuality: 'ልዩ ማኛ ስንዴ',
          price: 30.0,
          description: 'The Description of item write hear',
          image:
              'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
          isFavorite: false,
          isAddToCart: false,
        ),
        ProductType(
            id: 'p29',
            name: 'ጤፍ',
            productQuality: 'ምኛ ስንዴ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p28',
            name: 'ጤፍ',
            productQuality: 'መለስትኛ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
            isFavorite: false,
            isAddToCart: false),
      ],
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
    ),
    Product(
      id: 'p3',
      title: 'ገብስ',
      types: [
        ProductType(
            id: 'p31',
            name: 'ጤፍ',
            productQuality: 'ማኛ ገብስ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p32',
            name: 'ጤፍ',
            productQuality: 'መለስተኛ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p33',
            name: 'ጤፍ',
            productQuality: 'መለስተኛ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
      ],
      imageUrl:
          'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
    ),
    Product(
      id: 'p4',
      title: 'ሽምብራ',
      types: [
        ProductType(
            id: 'p41',
            name: 'ጤፍ',
            productQuality: 'ማኛ ሽምብራ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p42',
            name: 'ጤፍ',
            productQuality: 'መለስተኛ ሽምብራ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
      ],
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
    ),
    Product(
      id: 'p5',
      title: 'ባቄላ',
      types: [
        ProductType(
            id: 'p51',
            name: 'ጤፍ',
            productQuality: 'ማኛ ባቄላ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
        ProductType(
            id: 'p52',
            name: 'ጤፍ',
            productQuality: 'መለስተኛ ባቄላ',
            price: 30,
            description: 'The Description of item write hear',
            image:
                'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
            isFavorite: false,
            isAddToCart: false),
      ],
      imageUrl:
          'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
    ),
  ];
  var _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items
          .where((product) => product.types.any((type) => type.isFavorite))
          .toList();
    }
    return [..._items];
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }

  late String ids;

  String setIndex(String id) {
    return ids = id;
  }

  int index = 0;
  int setIndexs(int i) {
    return index = i;
  }

// items[typeIndex].types[typeListIndex].id
  void toggleProductTypeFavorite(String productTypeId, int productIndex) {
    final productTypeIndex = items[productIndex]
        .types
        .indexWhere((type) => type.id == productTypeId);
    if (productTypeIndex >= 0) {
      items[productIndex].types[productTypeIndex].isFavorite =
          !items[productIndex].types[productTypeIndex].isFavorite;
    }
    notifyListeners();
  }

  void toggleCartItems(String productTypeId, int productIndex) {
    final productTypeIndex = items[productIndex].types.indexWhere(
          (type) => type.id == productTypeId,
        );
    if (productIndex >= 0) {
      items[productIndex].types[productTypeIndex].isAddToCart =
          !items[productIndex].types[productTypeIndex].isAddToCart;
    }
    notifyListeners();
  }

  String _appBarTitle = 'KdameGebeya';
  String setAppBarTitle(title) {
    return _appBarTitle = title;
  }

  Widget page = const ProductOverviewScreen();
  String get appBarTitle => _appBarTitle;

  void change(changes, appBarTitle) {
    page = changes;
    _appBarTitle = appBarTitle;
    notifyListeners();
  }

// page change using appbar arrow
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count += 1;
    notifyListeners();
  }

  void decrementCount() {
    if (_count > 1) {
      _count -= 1;
    } else {
      _count--;
    }
    notifyListeners();
  }

  void setCount(int c) {
    _count = c;
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<ProductType> get allProductTypes {
    List<ProductType> allTypes = [];

    for (var product in _items) {
      allTypes.addAll(product.types);
    }
    return allTypes;
  }

  ProductType findByIdT(
    String id,
  ) {
    return allProductTypes.firstWhere((type) => type.id == id);
  }

  int _bottomBar = 0;
  int get bottomBar => _bottomBar;
  void setBottomBar(int i) {
    _bottomBar = i;
  }

  void addProduct(Product product) {
    bool productExists = _items.any((p) => p.title == product.title);
    const urls =
        'https://kdame-gebeya-75b59-default-rtdb.firebaseio.com/products.json';

    final url = Uri.parse(urls);

    http
        .post(url,
            body: json.encode({
              'title': product.title,
              'imageUrl': product.imageUrl,
              'types': [
                {
                  'id': DateTime.now().toString(),
                  'name': '',
                  'productQuality': '',
                  'price': '',
                  'description': '',
                  'image': '',
                  'isFavorite': '',
                }
              ],
            }))
        .then((response) {
      if (!productExists) {
        final newProduct = Product(
          id: DateTime.now().toString(),
          title: product.title,
          imageUrl: product.imageUrl,
          types: product.types,
        );
        _items.add(newProduct);
        notifyListeners();
      }
    });
  }

  void addProductTypes(ProductType productTypes) async {
    for (var product in _items) {
      if (product.title == productTypes.name) {
        if (!product.types.any(
            (type) => type.productQuality == productTypes.productQuality)) {
          productTypes.id = DateTime.now().toString();
          product.types.add(productTypes);

          final url = Uri.parse(
              'https://kdame-gebeya-75b59-default-rtdb.firebaseio.com/products/${product.id}/types.json');

          try {
            final response = await http.patch(url,
                body: json.encode({
                  'types': product.types.map((type) => type.toJson()).toList()
                }));

            if (response.statusCode == 200) {
              print('product type added successfully to Firebase.');
            } else {
              print('Failed to add product type to Firebase.');
            }
          } catch (e) {
            print('Failed to add product type to Firebase. Error: $e');
          }
        }
      }
    }

    notifyListeners();
  }

  void updateProduct(String id, ProductType newProductType) {
    for (var product in _items) {
      final prodTypeIndex =
          product.types.indexWhere((prodType) => prodType.id == id);
      if (prodTypeIndex >= 0) {
        product.types[prodTypeIndex] = newProductType;
        notifyListeners();
        break;
      } else {
        print('...');
      }
    }
  }

  void deleteProduct(String id) {
    for (var product in _items) {
      product.types.removeWhere((type) => type.id == id);
      notifyListeners();
    }
  }
}
