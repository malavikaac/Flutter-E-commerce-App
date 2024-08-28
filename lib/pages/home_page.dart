import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 195, 249),
        title: const Text('HomeHeaven'),
        actions: [
          // Navigation links in the header
          TextButton(
            onPressed: () => context.go('/Home'),
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => context.go('/product'),
            child: const Text('Product'),
          ),
          TextButton(
            onPressed: () => context.go('/account'),
            child: const Text('Account'),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
    );
  }
}