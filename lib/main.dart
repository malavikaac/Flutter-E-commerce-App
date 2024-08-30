import 'package:demo_flutter/home_screen.dart';
import 'package:demo_flutter/pages/account_page.dart';
import 'package:demo_flutter/pages/cart_page.dart';
import 'package:demo_flutter/pages/checkout_page.dart';
import 'package:demo_flutter/pages/home_page.dart';
import 'package:demo_flutter/pages/product_details_page.dart';
import 'package:demo_flutter/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routerConfig: _router,
    );
  }

  // Define your routes
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/checkout',
        builder: (BuildContext context, GoRouterState state) => const CheckoutPage(),
      ),
      GoRoute(
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) => const CartPage(),
      ),
      GoRoute(
        path: '/Home',
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
      GoRoute(
        path: '/product',
        builder: (BuildContext context, GoRouterState state) => const ProductPage(),
      ),
      GoRoute(
        path: '/account',
        builder: (BuildContext context, GoRouterState state) => const AccountPage(),
      ),
     GoRoute(
      path: '/product/:productId',
      builder: (context, state) {
        final productId = int.parse(state.pathParameters['productId']!);
        return ProductDetailsPage(productId: productId);
      },
    ),
    ],
  );
}


