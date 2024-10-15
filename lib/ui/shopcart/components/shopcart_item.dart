import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:riverpod_generator_example/model/shopcart/shopcart_model.dart';
import 'package:riverpod_generator_example/ui/shopcart/components/shopcart_product_item.dart';

class ShopcartItem extends StatelessWidget {
  final ShopcartModel item;
  final Function(int) onQuantityChanged;

  const ShopcartItem({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // checkbox
          Row(
            children: [
              const Icon(
                Icons.circle_outlined,
                color: Colors.orange,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Shopcart ID: ${item.id}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SlidableAutoCloseBehavior(
            child: Wrap(
              runSpacing: 10,
              children: item.products.map(
                (product) {
                  return ShopcartProductItem(product: product);
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
