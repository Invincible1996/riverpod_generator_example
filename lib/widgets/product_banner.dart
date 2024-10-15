import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/product/product_model.dart';

class ProductBanner extends StatefulWidget {
  const ProductBanner({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductBanner> createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {
  // selected image index
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          SizedBox(
            height: 260,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    // update selected image index
                    _current = index;
                  });
                },
              ),
              items: widget.product.images?.map((e) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: const BoxDecoration(color: Colors.amber),
                      child: CachedNetworkImage(
                        imageUrl: e,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          // add indicator
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  height: 20,
                  width: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${_current + 1}/${widget.product.images?.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.product.images?.asMap().entries.map((entry) {
                        return Container(
                          width: 50.0,
                          height: 5.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _current == entry.key
                                ? Colors.amber
                                : Colors.grey.shade300,
                          ),
                        );
                      }).toList() ??
                      [],
                ),
                //index
              ],
            ),
          ),
        ],
      ),
    );
  }
}
