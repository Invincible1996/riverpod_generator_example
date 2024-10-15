import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider for the shopping cart items

@RoutePage()
class ShopcartScreen extends ConsumerWidget {
  const ShopcartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: const Center(
        child: Text('Shopping Cart'),
      ),
    );
  }
}
