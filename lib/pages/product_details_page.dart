import 'package:demo_flutter/model/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;


class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({Key? key, required this.productId}) : super(key: key);

  Future<SingleProductDetailsModel> fetchProductDetails() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products/$productId'));

    if (response.statusCode == 200) {
      return singleProductDetailsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load product details');
    }
  }

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
      body: FutureBuilder<SingleProductDetailsModel>(
        future: fetchProductDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final product = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                Image.network(product.thumbnail),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Category: ${product.category}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Brand: ${product.brand}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rating: ${product.rating}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Stock: ${product.stock}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}