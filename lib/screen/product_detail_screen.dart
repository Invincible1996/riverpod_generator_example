import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_generator_example/model/product/product_model.dart';
import 'package:riverpod_generator_example/widgets/product_banner.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    const double colorChangeThreshold = 200.0;
    final double opacity =
        (_scrollOffset / colorChangeThreshold).clamp(0.0, 1.0);
    final Color appBarColor =
        Color.lerp(Colors.transparent, Colors.amber, opacity)!;
    final Color textColor = Color.lerp(Colors.black, Colors.white, opacity)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: opacity * 4, // Add elevation as we scroll
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Detail Product',
          style: TextStyle(color: textColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ProductBanner(product: widget.product),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.product.title ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // add favorite icon
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$${widget.product.price ?? ''}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${widget.product.discountPercentage}% off',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${(1 - widget.product.discountPercentage! / 100) * widget.product.price!}',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description Product',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.product.description}',
                    ),
                    // ... (rest of the content remains the same)
                    Column(
                      children:
                          widget.product.images!.asMap().entries.map((entry) {
                        return CachedNetworkImage(imageUrl: entry.value);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add to Cart'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Buy Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
