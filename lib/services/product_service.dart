import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  final Uri url =
      Uri.parse('https://api.jsonbin.io/v3/b/6721e323acd3cb34a89f5cd2');

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List products = json.decode(response.body)['record']['jewelry'];
        return products.map((product) => Product.fromJson(product)).toList();
      }
    } catch (error) {
      print("Error fetching products: $error");
    }
    return [];
  }
}
