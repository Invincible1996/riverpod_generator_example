import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/product_list_controller.dart';
import '../../model/product/category_model.dart';
import '../../router/app_router.dart';

@RoutePage()
class ProductListScreen extends ConsumerWidget {
  final CategoryModel category;
  const ProductListScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.read(productListControllerProvider(category).notifier);

    final state = ref.watch(productListControllerProvider(category));

    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: state.when(
        data: (res) {
          return EasyRefresh(
            onRefresh: () async {
              await controller.getProducts(category);
            },
            child: ListView.builder(
              itemCount: res.products?.length ?? 0,
              itemBuilder: (context, index) {
                final product = res.products![index];
                return GestureDetector(
                  onTap: () {
                    context.router.push(
                      ProductDetailRoute(product: product),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: .5,
                      ),
                    ),
                    child: Row(
                      children: [
                        // thumbnail,
                        CachedNetworkImage(
                          imageUrl: product.thumbnail ?? '',
                          width: 100,
                          height: 100,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              // rating
                              Text(
                                'Rating: ${product.rating}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              // stock
                              Text(
                                'Stock: ${product.stock}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              // discount
                              Text(
                                'Discount: ${product.discountPercentage}%',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              // description
                              // Text(
                              //   product.description ?? '',
                              //   maxLines: 2,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => controller.getProducts(category),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
