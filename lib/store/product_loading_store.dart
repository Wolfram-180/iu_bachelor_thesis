import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

@immutable
class ProductLoadingStore {
  final RemoteResource<List<Product>> products;

  const ProductLoadingStore(this.products);
}

class ProductLoadingStoreProvider extends FutureProvider<ProductLoadingStore> {
  ProductLoadingStoreProvider({
    Key? key,
    required ProductService productService,
    Widget? child,
  }) : super(
         key: key,
         create:
             (context) => productService
                 .fetchProducts()
                 .then(RemoteResource.finished)
                 .then(ProductLoadingStore.new),
         catchError:
             (context, error) => ProductLoadingStore(
               RemoteResource.error(error?.toString() ?? 'Unknown Error'),
             ),
         initialData: ProductLoadingStore(const RemoteResource.loading()),
       );
}
