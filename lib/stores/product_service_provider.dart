import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

class ProductServiceImplementationPlaceholder implements ProductService {
  @override
  Future<List<Product>> fetchProducts() {
    throw UnimplementedError();
  }

  @override
  String get url => throw UnimplementedError();
}

final productServiceProvider = Provider<ProductService>(
  (ref) => ProductServiceImplementationPlaceholder(),
);
