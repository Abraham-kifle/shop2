import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop1/screen/products_overview_screen.dart';
import '../providers/product.dart';
import '../providers/product_type.dart';
import '../providers/products.dart';

class EditedProductScreenT extends StatefulWidget {
  static const routeName = '/edited-product';
  @override
  State<EditedProductScreenT> createState() => _EditedProductScreenTState();
}

class _EditedProductScreenTState extends State<EditedProductScreenT> {
  final _idFocusNode = FocusNode();
  final _productQualityFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _editedProduct = ProductType(
    id: null,
    name: '',
    productQuality: '',
    price: 0,
    image: '',
    description: '',
  );
  var _isInit = true;
  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  var _intitValues = {
    'title': '',
    'productQuality': '',
    'price': '',
    'image': '',
    'description': '',
  };

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments != null) {
        final productId = arguments as String;

        if (productId != null) {
          _editedProduct = Provider.of<Products>(context, listen: false)
              .findByIdT(productId);
          _intitValues = {
            'title': _editedProduct.name,
            'productQuality': _editedProduct.productQuality,
            'price': _editedProduct.price.toString(),
            'image': '',
            'description': _editedProduct.description
          };
          _imageUrlController.text = _editedProduct.image;
        }
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImageUrl);
    _idFocusNode.dispose();
    _imageFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      if (_imageUrlController.text.isEmpty ||
          !_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https') ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();

    final productProvider = Provider.of<Products>(context, listen: false);
    if (_editedProduct.id != null) {
      productProvider.updateProduct(_editedProduct.id, _editedProduct);
    } else {
      productProvider.addProductTypes(_editedProduct);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: _intitValues['title'],
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_productQualityFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = ProductType(
                        id: _editedProduct.id,
                        name: value.toString(),
                        productQuality: _editedProduct.productQuality,
                        price: _editedProduct.price,
                        image: _editedProduct.image,
                        description: _editedProduct.description,
                        isFavorite: _editedProduct.isFavorite);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please provide a value';
                    }
                    return null;
                  },
                ),
                // TextFormField(
                //   initialValue: _intitValues['id'],
                //   decoration: const InputDecoration(labelText: 'Id'),
                //   textInputAction: TextInputAction.next,
                //   onFieldSubmitted: (_) {
                //     FocusScope.of(context)
                //         .requestFocus(_productQualityFocusNode);
                //   },
                //   focusNode: _idFocusNode,
                //   onSaved: (value) {
                //     _editedProduct = ProductType(
                //         id: value.toString(),
                //         name: _editedProduct.name,
                //         productQuality: _editedProduct.productQuality,
                //         price: _editedProduct.price,
                //         image: _editedProduct.image,
                //         description: _editedProduct.description);
                //   },
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'please enter id';
                //     }
                //   },
                // ),
                TextFormField(
                  initialValue: _intitValues['productQuality'],
                  decoration:
                      const InputDecoration(labelText: 'ProductQuality'),
                  textInputAction: TextInputAction.next,
                  focusNode: _productQualityFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = ProductType(
                        id: _editedProduct.id,
                        name: _editedProduct.name,
                        productQuality: value.toString(),
                        price: _editedProduct.price,
                        image: _editedProduct.image,
                        description: _editedProduct.description,
                        isFavorite: _editedProduct.isFavorite);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter id';
                    }
                  },
                ),
                TextFormField(
                  initialValue: _intitValues['price'],
                  decoration: const InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = ProductType(
                        id: _editedProduct.id,
                        name: _editedProduct.name,
                        productQuality: _editedProduct.productQuality,
                        price: double.parse(value.toString()),
                        image: _editedProduct.image,
                        description: _editedProduct.description,
                        isFavorite: _editedProduct.isFavorite);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter id';
                    }
                  },
                ),
                TextFormField(
                  initialValue: _intitValues['description'],
                  decoration: const InputDecoration(labelText: 'Description'),
                  textInputAction: TextInputAction.next,
                  focusNode: _descriptionFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_imageFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = ProductType(
                        id: _editedProduct.id,
                        name: _editedProduct.name,
                        productQuality: _editedProduct.productQuality,
                        price: _editedProduct.price,
                        image: _editedProduct.image,
                        description: value.toString(),
                        isFavorite: _editedProduct.isFavorite);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter id';
                    }
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
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: _imageUrlController.text.isEmpty
                          ? const Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Image URL'),
                        textInputAction: TextInputAction.done,
                        focusNode: _imageFocusNode,
                        keyboardType: TextInputType.url,
                        controller: _imageUrlController,
                        onFieldSubmitted: (value) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          _editedProduct = ProductType(
                              id: _editedProduct.id,
                              name: _editedProduct.name,
                              productQuality: _editedProduct.productQuality,
                              price: _editedProduct.price,
                              image: value.toString(),
                              description: _editedProduct.description,
                              isFavorite: _editedProduct.isFavorite);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter a image URL';
                          }
                          if (!value.startsWith('http') ||
                              !value.startsWith('https')) {
                            return 'please enter a valid URL.';
                          }
                          if (!value.endsWith('.png') &&
                              !value.endsWith('jpg') &&
                              !value.endsWith('.jpeg')) {
                            return 'please enter a valid image URL.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      //  Navigator.of(context).pushNamed(
                      // EditedProductScreenT.routeName,
                      // arguments: types[i].id);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Edit')),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveForm();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
