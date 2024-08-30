import 'dart:convert';
import 'package:demo_flutter/model/product_model.dart';
import 'package:http/http.dart' as http;

Future<ProductsModel> fetchProducts() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    return ProductsModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load products');
  }
}
