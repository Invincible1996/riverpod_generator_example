import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_generator_example/ui/shopcart/components/shopcart_item.dart';

import '../../../controller/shopcart_controller.dart';

@RoutePage()
class ShopcartScreen extends ConsumerWidget {
  const ShopcartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopcartProvider = ref.watch(shopcartControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopcart'),
      ),
      body: shopcartProvider.when(data: (shopcartList) {
        return ListView.builder(
          itemCount: shopcartList.length,
          itemBuilder: (context, index) {
            final shopcart = shopcartList[index];
            return ShopcartItem(
              item: shopcart,
              onQuantityChanged: (int quantity) {},
            );
          },
        );
      }, loading: () {
        return const Center(child: CircularProgressIndicator());
      }, error: (error, stackTrace) {
        return Center(
          child: Text('Error: $error'),
        );
      }),
    );
  }
}
