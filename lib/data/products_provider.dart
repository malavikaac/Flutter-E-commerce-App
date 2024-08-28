import 'dart:convert';

import 'package:demo_flutter/model/product_model.dart';

import 'package:http/http.dart' as http;


// class ProductProvider extends ChangeNotifier {
//   final client = http.Client();
//   List<Product> productList = [];

//   Future<ProductsModel> fetchProduct() async {
//     final response = await client.get(
//       Uri.parse("https://dummyjson.com/products"),
//     );

//     return productsModelFromJson(response.body);
//   }

//   void listOfProducts() {
//     fetchProduct().then((value) {
//       if (value.products.isNotEmpty) {
//         productList = value.products;
//         notifyListeners();
//       } else {
//         productList = [];
//       }
//     });
//   }
// }



Future<ProductsModel> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    return ProductsModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}