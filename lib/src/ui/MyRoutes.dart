import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/cubits/CubitCart.dart';
import 'package:multi_screen_app/src/cubits/CubitCategoryList.dart';
import 'package:multi_screen_app/src/cubits/CubitEmail.dart';
import 'package:multi_screen_app/src/ui/account/AccountDetail.dart';
import 'package:multi_screen_app/src/ui/account/AccountEdit.dart';
import 'package:multi_screen_app/src/ui/auth/SignIn.dart';
import 'package:multi_screen_app/src/ui/auth/SignInSuccess.dart';
import 'package:multi_screen_app/src/ui/auth/SignUp.dart';
import 'package:multi_screen_app/src/ui/auth/SignUpSuccess.dart';

import 'package:multi_screen_app/src/ui/cart/Cart.dart';
import 'package:multi_screen_app/src/ui/cart/CartCompleted.dart';
import 'package:multi_screen_app/src/ui/products/ProductDetail.dart';
import 'package:multi_screen_app/src/ui/cart/Scanner.dart';
import 'package:multi_screen_app/src/ui/Home.dart';
import 'package:multi_screen_app/src/ui/products/ProductList.dart';
import 'package:multi_screen_app/src/ui/cart/pay.dart';
import 'package:multi_screen_app/src/ui/purchases/PurchaseDetail.dart';
import 'package:multi_screen_app/src/ui/purchases/PurchaseHistory.dart';

class MyRoutes {

  static const _initialLocation = '/';

  static final GoRouter _routes = GoRouter(
    initialLocation: _initialLocation,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        builder: _mainLayout,
        routes: [
          GoRoute(
            path: '/user/details',
            builder: (context, state) => ScreenAccountDetail()
          ),
          GoRoute(
            path: '/user/edit',
            builder: (context, state) => ScreenAccountEdit()
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => ScreenCart()
          ),
          GoRoute(
            path: '/cart/completed',
            builder: (context, state) => ScreenCartCompleted()
          ),
          GoRoute(
            path: '/cart/pay',
            builder: (context, state) => ScreenPay()
          ),
          GoRoute(
            path: '/',
            builder: (context, state) => ScreenHome()
          ),
          GoRoute(
            path: '/products/:code/code',
            builder: (context, state) => ScreenProductDetail()
          ),
          GoRoute(
            path: '/products',
            builder: (context, state) => ScreenProductList()
          ),
          GoRoute(
            path: '/purchases/:id/id',
            builder: (context, state) => ScreenPurchaseDetail()
          ),
          GoRoute(
            path: '/purchases',
            builder: (context, state) => ScreenPurchaseHistory()
          ),
          GoRoute(
              path: '/scanner',
              builder: (context, state) => ScreenScanner()
          )
        ]
      ),
      ShellRoute(
        builder: _authLayout,
        routes: [
          GoRoute(
            path: '/auth/signin',
            builder: (context, state) => ScreenSignIn()
          ),
          GoRoute(
              path: '/auth/signIn/success',
              builder: (context, state) => ScreenSignInSuccess()
          ),
          GoRoute(
              path: '/auth/signUp',
              builder: (context, state) => ScreenSignUp()
          ),
          GoRoute(
              path: '/auth/signUp/success',
              builder: (context, state) => ScreenSignUpSuccess()
          )
        ]
      ),
    ]
  );

  static Widget _mainLayout (BuildContext context, GoRouterState state, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is my app bar'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CubitCart>(
              create: (BuildContext ctx) => CubitCart()
          ),
          BlocProvider<CubitCategoryList>(
              create: (BuildContext ctx) => CubitCategoryList()
          )
        ],
        child: child
      )
    );
  }

  static Widget _authLayout (BuildContext context, GoRouterState state, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is my app bar'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext ctx) => CubitEmail(),
          )
        ],
        child: child
      )
    );
  }

  static GoRouter getRoutes () {
    return _routes;
  }
}
