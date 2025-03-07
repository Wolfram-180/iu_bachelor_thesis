import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

class MockedProductService implements ProductService {
  @override
  Future<List<Product>> fetchProducts() async {
    return const [
      Product(title: 'Bananas', price: 3),
      Product(title: 'Apples', price: 2),
      Product(title: 'Pears', price: 2.5),
      Product(title: 'Cherries', price: 1.2),
    ];
  }

  @override
  String get url => throw UnimplementedError();
}
