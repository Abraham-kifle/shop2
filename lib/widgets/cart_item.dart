import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../screen/items_detail.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String image;
  final String description;

  CartItem(this.id, this.productId, this.price, this.quantity, this.title,
      this.image, this.description);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final FixedExtentScrollController weightScrollerController =
        FixedExtentScrollController(initialItem: quantity - 1);

    return Consumer<Cart>(builder: (context, cart, _) {
      double calcuteTotalPrice() {
        double result = price * quantity;
        if (cart.getUnit(id) == 'kilo') {
          return result;
        } else if (cart.getUnit(id) == 'kuntal') {
          return result * 100;
        }
        return result;
      }

      return Dismissible(
        key: ValueKey(id),
        direction: DismissDirection.endToStart,
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text(
                        'Do you want to remove the item from the cart?'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: const Text('No')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                          child: const Text('yes'))
                    ],
                  ));
        },
        background: Container(
          color: Theme.of(context).colorScheme.error,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        onDismissed: (direction) {
          cart.removeItem(productId);
        },
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  key: ValueKey(id),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      image,
                      width: 70,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(title),
                  subtitle: Text('Total: \$${calcuteTotalPrice()}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: CupertinoPicker(
                          key: Key('$id-picker'),
                          itemExtent: 32,
                          scrollController: weightScrollerController,
                          onSelectedItemChanged: (quantityIndex) {
                            cart.qunaIndex = quantityIndex + 1;
                            cart.updateQuantity(id, cart.qunaIndex);
                          },
                          children: List.generate(100, (index) {
                            return Center(
                              child: Text('${index + 1}'),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: CupertinoPicker(
                          key: Key('$id-unit-picker'),
                          backgroundColor: Colors.white,
                          itemExtent: 32,
                          onSelectedItemChanged: (quantityIndex) {
                            cart.updateQuantity(id, cart.qunaIndex);
                            if (quantityIndex == 0) {
                              cart.setUnit('kilo', id);
                            } else if (quantityIndex == 1) {
                              cart.setUnit('kuntal', id);
                            }
                          },
                          children: [
                            cart.getUnit(id) == 'kilo'
                                ? const Center(
                                    child: Text('ኪሎ'),
                                  )
                                : const Center(
                                    child: Text('ኩንታል'),
                                  ),
                            cart.getUnit(id) == 'kilo'
                                ? const Center(
                                    child: Text('ኪሎ'),
                                  )
                                : const Center(
                                    child: Text('ኩንታል'),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    title: const Text('Are you sure?'),
                                    content: const Text(
                                        'Do you want to remove the item from cart?'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop(false);
                                          },
                                          child: const Text('No')),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop(true);
                                          },
                                          child: const Text('Yes'))
                                    ],
                                  )).then((confirmed) {
                            if (confirmed != null && confirmed) {
                              cart.removeItem(productId);
                            }
                          });
                        },
                        child: Chip(
                          label: Text(
                            'DELETE',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {
                          products.change(
                              ItemDetailScreen(image, price, description),
                              title);
                          // Handle detail button press
                        },
                        child: const Text('DETAIL'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
