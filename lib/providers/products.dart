import 'package:flutter/material.dart';
import 'package:shop1/screen/product_detail_screen.dart';
import '../models/product.dart';
import '../screen/products_overview_screen.dart';

class Products extends ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'ጤፍ',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      type: [
        {
          "type0": "ልዩ ማኛ ጤፍ",
          "type1": "ማኛ ጤፍ",
          "type2": "መለስትኛ ጤፍ",
          "type3": "ሰርገኛ"
        },
        {
          "price0": "60",
          "price1": "50",
          "price2": "40",
          "price3": "30",
        },
        {
          "image1":
              'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
          "image0":
              'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
          "image2":
              'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
          "image3":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
        }
      ],
      imageUrl:
          'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
    ),
    Product(
      id: 'p2',
      title: 'ስንዴ',
      description: 'A nice pair of shoes',
      price: 59.99,
      type: [
        {
          "type0": "ልዩ ማኛ ስንዴ",
          "type1": "ምኛ ስንዴ",
          "type2": "መለስትኛ",
        },
        {
          "price0": "60",
          "price1": "50",
          "price2": "40",
        },
        {
          "image0":
              'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
          "image1":
              'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
          "image2":
              'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
          "image3":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
        }
      ],
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
    ),
    Product(
      id: 'p3',
      title: 'ገብስ',
      description: 'warm and cozy - exactly what you need for the winter',
      price: 19.99,
      type: [
        {
          "type0": "ማኛ ገብስ",
          "type1": "መለስተኛ",
        },
        {
          "price0": "60",
          "price1": "50",
        },
        {
          "image0":
              'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
          "image1":
              'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
          "image2":
              'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
          "image3":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
        }
      ],
      imageUrl:
          'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
    ),
    Product(
      id: 'p4',
      title: 'ሽምብራ',
      description: 'prepare any meal you want',
      price: 49.99,
      type: [
        {
          "type0": "ማኛ ሽምብራ",
          "type1": "መለስተኛ ሽምብራ",
        },
        {
          "price0": "60",
          "price1": "50",
        },
        {
          "image0":
              'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
          "image1":
              'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
          "image2":
              'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
          "image3":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
        }
      ],
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
    ),
    Product(
      id: 'p1',
      title: 'ባቄላ',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      type: [
        {
          "type0": "ማኛ ባቄላ",
          "type1": "መሰስተኛ ባቄላ",
        },
        {
          "price0": "60",
          "price1": "50",
        },
        {
          "image0":
              'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
          "image1":
              'https://cdn.shopify.com/s/files/1/0098/9564/1139/products/1_172a657b-52a1-43f3-b68a-385f5bcd41cd.jpg?v=1565191414',
          "image2":
              'https://cdn.shopify.com/s/files/1/1465/3370/products/grandyoats-steel-cut-oats-bulk_387x.jpg?v=1618864685',
          "image3":
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkVWJ9_DZZ1lSiW_SqZAPxRfnxoRxQtdNAInDZCkbsgoXlgrj-2lfUS-DLkw5_-VrEA8w&usqp=CAU',
        }
      ],
      imageUrl:
          'https://agtfoods.co.za/wp-content/uploads/2018/06/White-Teff-Flour_600x600_4.jpg',
    ),
  ];
  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }

  String _appBarTitle = 'KdameGebeya';
  String setAppBarTitle(title) {
    return _appBarTitle = title;
  }

  Widget page = ProductOverviewScreen();
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
    print(_count);
  }

  void decrementCount() {
    if (_count > 1) {
      _count -= 1;
    } else {
      _count--;
    }
    notifyListeners();
    print(_count);
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
