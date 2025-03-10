import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';
import 'package:iu_bachelor_thesis/store/product_loading_store.dart';
import 'package:iu_bachelor_thesis/store/user_store.dart';

class ProductStore {
  final RemoteResource<List<Product>> products;

  const ProductStore(this.products);
  factory ProductStore.fromProductLoadingStore(
    ProductLoadingStore productLoadingStore,
  ) => ProductStore(productLoadingStore.products);
}

class ProductStoreProvider
    extends ProxyProvider2<UserStore, ProductLoadingStore, ProductStore> {
  ProductStoreProvider({super.key, super.child})
    : super(update: _combineStores);

  static ProductStore _combineStores(
    BuildContext context,
    UserStore userStore,
    ProductLoadingStore productLoadingStore,
    ProductStore? oldStore,
  ) {
    if (!userStore.isSignedIn) {
      return ProductStore.fromProductLoadingStore(productLoadingStore);
    }
    final remoteProducts = productLoadingStore.products.mapIfFinished(
      (products) =>
          products.map((product) => product.copyWithDiscount()).toList(),
    );
    return ProductStore(remoteProducts);
  }
}
