import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/login_controller.dart';
import 'package:auto_route/auto_route.dart';
import '../controller/user_controller.dart';
import '../router/app_router.dart';
import 'dart:async';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 0), () async {
      // check login status
      final isLoggedIn =
          await ref.read(loginControllerProvider.notifier).checkLoginStatus();
      // if login, get current user info
      if (isLoggedIn) {
        await ref.read(userControllerProvider.notifier).getUserInfo();
      }
      if (mounted) {
        var route = isLoggedIn ? const IndexRoute() : const LoginRoute();
        context.router.replace(route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
