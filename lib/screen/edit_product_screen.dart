import 'package:flutter/material.dart';
import '../providers/product_type.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import './edit_productType.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocuseNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFoucsNode = FocusNode();
  final _form = GlobalKey<FormState>();

  final _productIdFocuseNode = FocusNode();
  final _productImageFocuseNode = FocusNode();

  final _titleController = TextEditingController();
  final _idController = TextEditingController();

  final _idFocuseNodeT = FocusNode();
  final _imageUrlFoucsNodeT = FocusNode();
  final _priceFocuseNodeT = FocusNode();
  final _descriptionFocuseNodeT = FocusNode();
  final _titleFocusNodeT = FocusNode();

  final TextEditingController _idControllerT = TextEditingController();
  final TextEditingController _nameControllerT = TextEditingController();
  final TextEditingController _priceControllerT = TextEditingController();
  final TextEditingController _descriptionContrllerT = TextEditingController();
  final TextEditingController _imageControllerT = TextEditingController();

  // var _editedProduct = Product(id: '', title: '', imageUrl: '', types: [
  //   ProductType(id: '', name: '', price: 0.0, image: '', description: '')
  // ]);

  var _editedProducts = Product(
    id: 'id',
    title: '',
    imageUrl: '',
    types: [],
  );

  @override
  void initState() {
    _imageUrlFoucsNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFoucsNode.removeListener(_updateImageUrl);
    _priceFocuseNode.dispose();
    _descriptionNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFoucsNode.dispose();
    _productIdFocuseNode.dispose();
    _productImageFocuseNode.dispose();
    _idControllerT.dispose();
    _nameControllerT.dispose();
    _priceControllerT.dispose();
    _imageControllerT.dispose();
    _descriptionContrllerT.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFoucsNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  // bool _isValid = false;
  // void _saveForm() {
  //   final isValid = _form.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   setState(() {
  //     isValid;
  //   });
  //   _form.currentState!.save();
  //   Provider.of<Products>(context, listen: false).addProduct(_editedProducts);
  // }

  // void _addProductType() {
  //   _editedProducts.types.add(ProductType(
  //       id: _editedProducts.id,
  //       name: _editedProducts.title,
  //       price: 0.0,
  //       image: '',
  //       description: ''));
  // }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final id = _idController.text;
    final title = _titleController.text;
    final image = _imageUrlController.text;

    void addProductType() {
      String id = _idControllerT.text;
      String name = _nameControllerT.text;
      double price = double.parse(_priceControllerT.text);
      String description = _descriptionContrllerT.text;
      String image = _imageControllerT.text;

      ProductType productType = ProductType(
          id: id,
          name: '',
          productQuality: name,
          price: price,
          image: image,
          description: description);

      products.productTypes.add(productType);
    }

    void _submitForm() {
      List<ProductType> newTypes = products.productTypes.map((type) {
        return ProductType(
            id: type.id,
            name: '',
            productQuality: type.productQuality,
            price: type.price,
            image: type.image,
            description: type.description);
      }).toList();

      Product newProduct =
          Product(id: id, title: title, imageUrl: image, types: newTypes);

      products.addProduct(newProduct);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              const Center(
                  child: Text(
                'እህል',
                style: TextStyle(fontSize: 20),
              )),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Product_Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productIdFocuseNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please provider a value';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _editedProducts = Product(
                      id: '',
                      title: value.toString(),
                      imageUrl: _editedProducts.imageUrl,
                      types: _editedProducts.types);
                },
              ),
              TextFormField(
                controller: _idController,
                decoration: const InputDecoration(
                  labelText: 'Product_Id',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_productImageFocuseNode);
                },
                focusNode: _productIdFocuseNode,
                onSaved: (value) {
                  _editedProducts = Product(
                      id: value.toString(),
                      title: _editedProducts.title,
                      imageUrl: _editedProducts.imageUrl,
                      types: _editedProducts.types);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? const Text('Enter a URL')
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_imageUrlController.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      controller: _imageUrlController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter an image RUL';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'please enter a valid URL';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'please enter a valid image URL';
                        }
                        return null;
                      },
                      focusNode: _productImageFocuseNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_titleFocusNodeT);
                      },
                      onSaved: (value) {
                        _editedProducts = Product(
                            id: '',
                            title: _editedProducts.title,
                            imageUrl: value.toString(),
                            types: _editedProducts.types);
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  addProductType;
                  products.change(
                      EditedProductScreenT(ids: '', titles: '', imageUrls: ''),
                      'የእህል አይነቶች');
                },
                child: const Text('Add Product Type'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submitForm();
          products.productTypes.clear();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
