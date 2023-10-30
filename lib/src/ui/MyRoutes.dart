import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_screen_app/src/providers/ProviderCategories.dart';
import 'package:multi_screen_app/src/providers/ProviderLoading.dart';
import 'package:multi_screen_app/src/providers/ProviderProducts.dart';
import 'package:multi_screen_app/src/providers/ProviderPromotions.dart';
import 'package:multi_screen_app/src/ui/ScreenSplash.dart';
import 'package:multi_screen_app/src/ui/account/AccountDetail.dart';
import 'package:multi_screen_app/src/ui/account/AccountEdit.dart';
import 'package:multi_screen_app/src/ui/auth/SignIn.dart';
import 'package:multi_screen_app/src/ui/auth/UserRecoverySuccess.dart';
import 'package:multi_screen_app/src/ui/auth/SignUp.dart';
import 'package:multi_screen_app/src/ui/auth/SignUpSuccess.dart';
import 'package:multi_screen_app/src/ui/auth/UserRecovery.dart';

import 'package:multi_screen_app/src/ui/cart/Cart.dart';
import 'package:multi_screen_app/src/ui/cart/CartCompleted.dart';
import 'package:multi_screen_app/src/ui/products/ProductDetail.dart';
import 'package:multi_screen_app/src/ui/cart/Scanner.dart';
import 'package:multi_screen_app/src/ui/Home.dart';
import 'package:multi_screen_app/src/ui/products/ProductList.dart';
import 'package:multi_screen_app/src/ui/cart/pay.dart';
import 'package:multi_screen_app/src/ui/products/WidgetSlideUpFilters.dart';
import 'package:multi_screen_app/src/ui/purchases/PurchaseDetail.dart';
import 'package:multi_screen_app/src/ui/purchases/PurchaseHistory.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetAppBar.dart';
import 'package:multi_screen_app/src/ui/widgets/WidgetBottomNavigationBar.dart';
import 'package:provider/provider.dart';

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
            builder: (context, state) => const ScreenAccountDetail()
          ),
          GoRoute(
            path: '/user/edit',
            builder: (context, state) => const ScreenAccountEdit()
          ),
          GoRoute(
            path: '/cart',
            builder: (context, state) => const ScreenCart()
          ),
          GoRoute(
            path: '/cart/completed',
            builder: (context, state) => const ScreenCartCompleted()
          ),
          GoRoute(
            path: '/cart/pay',
            builder: (context, state) => const ScreenPay()
          ),
          GoRoute(
              path: '/home',
              builder: (context, state) => ChangeNotifierProvider(
                create: (ctx) => ProviderPromotions(ctx),
                child: const ScreenHome(),
              )
          ),
          GoRoute(
            path: '/products/details',
            builder: (context, state) => const ScreenProductDetail()
          ),
          GoRoute(
            path: '/products',
            builder: (context, state) => const Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ScreenProductList(),
                WidgetSlideUpFilters()
              ]
            )
          ),
          GoRoute(
            path: '/purchases/:id/id',
            builder: (context, state) => const ScreenPurchaseDetail()
          ),
          GoRoute(
            path: '/purchases',
            builder: (context, state) => const ScreenPurchaseHistory()
          ),
          GoRoute(
              path: '/scanner',
              builder: (context, state) => const ScreenScanner()
          )
        ]
      ),
      ShellRoute(
        builder: _authLayout,
        routes: [
          GoRoute(
            path: '/auth/signIn',
            builder: (context, state) => ScreenSignIn()
          ),
          GoRoute(
              path: '/auth/recovery-password/success',
              builder: (context, state) => const ScreenUserRecoverySuccess()
          ),
          GoRoute(
              path: '/auth/signUp',
              builder: (context, state) => ScreenSignUp()
          ),
          GoRoute(
              path: '/auth/signUp/success',
              builder: (context, state) => const ScreenSignUpSuccess()
          ),
          GoRoute(
              path: '/auth/recovery-password',
              builder: (context, state) => ScreenUserRecovery()
          )
        ]
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const ScreenSplash()
      )
    ]
  );

  static Widget _mainLayout (BuildContext context, GoRouterState state, Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderCategories>(
          create: (ctx) => ProviderCategories(ctx)
        ),
        ChangeNotifierProvider<ProviderProducts>(
            create: (ctx) => ProviderProducts(ctx)
        ),
        ChangeNotifierProvider<ProviderLoading>(
            create: (ctx) => ProviderLoading()
        )
      ],
      child: Scaffold(
        appBar: const WidgetAppBar(),
        body: Stack(
          children: [
            Consumer<ProviderLoading>(builder: (ctx, provider, child) {
              if (provider.isLoading) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  )
                );
              } else {
                return Container();
              }
            }),
            child
          ]
        ),
        bottomNavigationBar: const WidgetBottomNavigationBar(),
      )
    );
  }

  static Widget _authLayout (BuildContext context, GoRouterState state, Widget child) {
    return Scaffold(

      body: child
    );
  }

  static GoRouter getRoutes () {
    return _routes;
  }
}
