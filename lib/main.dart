import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iu_bachelor_thesis/controllers/cart_controller.dart';
import 'package:iu_bachelor_thesis/controllers/product_controller.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';
import 'app.dart';

void main() {
  final productService = ProductService();
  Get.put(ProductController(productService: productService));
  Get.put(CartController());
  runApp(IUBachelorThesisApp());
}
