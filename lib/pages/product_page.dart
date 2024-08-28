import 'package:demo_flutter/data/products_provider.dart';
import 'package:demo_flutter/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

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
         leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
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
      body: FutureBuilder<ProductsModel>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final products = snapshot.data!.products;

          return LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;
              double childAspectRatio;

              // Determine the number of columns and aspect ratio based on screen width
              if (constraints.maxWidth >= 1200) {
                crossAxisCount = 6; // Large screens
                childAspectRatio = 0.9;
              } else if (constraints.maxWidth >= 800) {
                crossAxisCount = 3; // Medium screens
                childAspectRatio = 0.8;
              } else {
                crossAxisCount = 2; // Small screens
                childAspectRatio = 1.0;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            product.thumbnail,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                '\$${product.price.toString()}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
