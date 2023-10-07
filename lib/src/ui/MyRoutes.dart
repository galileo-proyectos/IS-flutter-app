import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_screen_app/src/ui/cart/Cart.dart';
import 'package:multi_screen_app/src/ui/products/ProductDetail.dart';
import 'package:multi_screen_app/src/ui/cart/Scanner.dart';
import 'package:multi_screen_app/src/ui/Home.dart';
import 'package:multi_screen_app/src/ui/products/ProductList.dart';
import 'package:multi_screen_app/src/ui/cart/pay.dart';

class MyRoutes {

  static final GoRouter _routes = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        builder: _mainLayout,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => ScreenHome(),
          ),
          GoRoute(
            path: '/products',
            builder: (context, state) => ScreenProductList(),
          ),
          GoRoute(
            path: '/products/:code/code',
            builder: (context, state) => ScreenProductDetail(),
          ),
          GoRoute(
            path: '/scanner',
            builder: (context, state) => ScreenScanner(),
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => ScreenCart(),
          ),
          GoRoute(
            path: '/cart/pay',
            builder: (context, state) => ScreenPay(),
          )
        ]
      )
    ]
  );

  static Widget _mainLayout (BuildContext context, GoRouterState state, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is my app bar'),
      ),
      body: child
    );
  }

  static GoRouter getRoutes () {
    return _routes;
  }
}