import 'dart:convert';

import 'package:http/http.dart';
import 'package:iu_bachelor_thesis/models/product.dart';

class ProductService {
  final String url;

  ProductService({this.url = "products.json"});

  Future<List<Product>> fetchProducts() async {
    final result = await get(Uri.parse(url));
    final List<dynamic> parsed = jsonDecode(result.body);
    return parsed
        .map((e) => Product(title: e['title'], price: e['price']))
        .toList();
  }
}
