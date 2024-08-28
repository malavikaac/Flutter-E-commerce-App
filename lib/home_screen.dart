import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 195, 249),
        title: Row(
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Homeheaven"),
               const SizedBox(width: 400),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
              // Navigation links in the header
              TextButton(
                onPressed: () => context.go('/Home'),
                child: const Text('Home'),
              ),
                  const SizedBox(width: 20),
              TextButton(
                onPressed: () => context.go('/product'),
                child: const Text('Product'),
              ),
                  const SizedBox(width: 20),
              TextButton(
                onPressed: () => context.go('/cart'),
                child: const Text('Cart'),
              ),
                  const SizedBox(width: 20),
              TextButton(
                onPressed: () => context.go('/account'),
                child: const Text('Account'),
              )
             ],
            ),
          ],
        ),
       
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search icon press
            },
          ),
        ],
      ),
      body: const Center(child: Text('HomeHeaven')),
    );
  }
}
