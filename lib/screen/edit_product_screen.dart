import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop1/screen/edit_productType.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _idFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _editedProduct = Product(
    id: '',
    imageUrl: '',
    title: '',
    types: [],
  );

  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
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
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_imageFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        title: value.toString(),
                        imageUrl: _editedProduct.imageUrl,
                        types: _editedProduct.types);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please provide a value';
                    }
                    return null;
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
                          _editedProduct = Product(
                              id: _editedProduct.id,
                              title: _editedProduct.title,
                              imageUrl: value.toString(),
                              types: _editedProduct.types);
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
                      products.change(EditedProductScreenT(), 'የእህል አይነቶች');
                    },
                    child: const Text('Add Product Quality'))
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveForm();
          products.change(EditedProductScreenT(), 'የምርት አይነቶች');
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
