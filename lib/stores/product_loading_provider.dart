import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/stores/product_service_provider.dart';

final productLoadingProvider = FutureProvider(
  (ref) => ref.read(productServiceProvider).fetchProducts(),
  dependencies: [productServiceProvider],
);
