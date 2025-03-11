import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/stores/product_loading_provider.dart';
import 'package:iu_bachelor_thesis/stores/user_store.dart';

final productListProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final isSignedIn = ref.watch(userStoreProvider);
  if (!isSignedIn) {
    return ref.watch(productLoadingProvider);
  }
  return ref
      .watch(productLoadingProvider)
      .whenData(
        (products) => products.map((pro) => pro.copyWithDiscount()).toList(),
      );
}, dependencies: [productLoadingProvider, userStoreProvider]);
