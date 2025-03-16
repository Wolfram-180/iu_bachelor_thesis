import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';
import 'app.dart';

void main() {
  final productService = ProductService();
  runApp(IUBachelorThesisApp(productService: productService));
}
