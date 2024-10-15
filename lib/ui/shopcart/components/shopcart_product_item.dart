import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../model/shopcart/shopcart_product_model.dart';

class ShopcartProductItem extends StatelessWidget {
  final ShopcartProductModel product;

  const ShopcartProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(product.id.toString()),
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // do something
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'delete',
          ),
        ],
      ),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            const Icon(
              Icons.circle_outlined,
              color: Colors.orange,
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                // color: Colors.red,
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
                width: 80,
                // height: 80,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                  ),
                  // price
                  Text(
                    'Price: \$${product.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // discount
                  if (product.discountPercentage != 0)
                    Text(
                      'Discount: ${product.discountPercentage}%',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  // quantity
                  Row(
                    children: [
                      const Text(
                        'Quantity: ',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                      GestureDetector(
                        onTap: () {
                          // show dialog to edit quantity
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Edit Quantity'),
                                  content: const TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Quantity',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            '${product.quantity}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
