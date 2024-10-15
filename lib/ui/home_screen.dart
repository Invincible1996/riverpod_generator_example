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
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Welcome, $username!'),
            subtitle: const Text('This is your home screen'),
          ),
          const Divider(),
          ListTile(
            title: const Text('User Information'),
            subtitle: Text('Username: $username'),
          ),
          ListTile(
            title: const Text('Authentication'),
            subtitle: Text('Token: $token'),
          ),
          const Divider(),
          // Add more ListTiles here for additional content
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings),
            onTap: () {
              // Navigate to settings screen
            },
          ),
          ListTile(
            title: const Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () {
              // Navigate to profile screen
            },
          ),
        ],
      ),
    );
  }
}
