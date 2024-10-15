import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../model/product/category_model.dart';
import '../model/product/product_model.dart';
import '../screen/login_screen.dart';
import '../screen/index_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/setting_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/edit_profile_screen.dart';
import '../screen/product_list_screen.dart';
import '../screen/product_detail_screen.dart';
import '../screen/shopcart_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: IndexRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: ProductListRoute.page),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: ShopcartRoute.page),
      ];
}
