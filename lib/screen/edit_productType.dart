import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/product_type.dart';
import '../providers/products.dart';

class EditedProductScreenT extends StatelessWidget {
  // static const String editedProductType = '/edited-product-type';
  String ids;
  String titles;
  String imageUrls;

  EditedProductScreenT(
      {super.key,
      required this.ids,
      required this.titles,
      required this.imageUrls});

  final _idFocuseNodeT = FocusNode();
  final _imageUrlFoucsNodeT = FocusNode();
  final _priceFocuseNodeT = FocusNode();
  final _descriptionFocuseNodeT = FocusNode();
  final _form = GlobalKey<FormState>();

  final TextEditingController _idControllerT = TextEditingController();
  final TextEditingController _nameControllerT = TextEditingController();
  final TextEditingController _priceControllerT = TextEditingController();
  final TextEditingController _descriptionContrllerT = TextEditingController();
  final TextEditingController _imageControllerT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
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

      _idControllerT.clear();
      _nameControllerT.clear();
      _priceControllerT.clear();
      _imageControllerT.clear();
      _descriptionContrllerT.clear();
    }

    void submitForm() {
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
          Product(id: ids, title: titles, imageUrl: imageUrls, types: newTypes);

      products.addProduct(newProduct);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameControllerT,
                decoration: const InputDecoration(
                  labelText: 'title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_idFocuseNodeT);
                },
              ),
              TextFormField(
                controller: _nameControllerT,
                decoration: const InputDecoration(
                  labelText: 'product quality',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_idFocuseNodeT);
                },
              ),
              TextFormField(
                controller: _idControllerT,
                decoration: const InputDecoration(
                  labelText: 'id',
                ),
                textInputAction: TextInputAction.next,
                focusNode: _idFocuseNodeT,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocuseNodeT);
                },
              ),
              TextFormField(
                controller: _priceControllerT,
                decoration: const InputDecoration(
                  labelText: 'price',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocuseNodeT,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocuseNodeT);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'please enter a valid number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'please enter number greater then zero';
                  }
                },
              ),
              TextFormField(
                controller: _descriptionContrllerT,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocuseNodeT,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter description';
                  }
                  if (value!.length < 10) {
                    return 'Should be at least 10 characters long';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageUrlFoucsNodeT);
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
                    child: _imageControllerT.text.isEmpty
                        ? const Text('Enter a URL')
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_imageControllerT.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageControllerT,
                      focusNode: _imageUrlFoucsNodeT,
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
                      onFieldSubmitted: (_) {},
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: addProductType,
                child: Text('Add Product Type'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          submitForm();
          products.productTypes.clear();
        }, // _saveForm,
        child: const Icon(Icons.save),
      ),
    );
  }
}
