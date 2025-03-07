import 'package:flutter/material.dart';
import 'package:iu_bachelor_thesis/app.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

void main() {
  runApp(IUBachelorThesisApp(productService: ProductService()));
}
