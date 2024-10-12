import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/login_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginControllerProvider);
    final username = loginState.credentials.username ?? 'Guest';
    final token = loginState.credentials.token ?? 'Token';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome to the Home Screen, $username!'),
            Text('Token: $token'),
          ],
        ),
      ),
    );
  }
}
