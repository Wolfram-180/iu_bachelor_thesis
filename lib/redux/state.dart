import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';

typedef RemoteProducts = RemoteResource<List<Product>>;

typedef ProductTitle = String;
typedef Quantities = Map<ProductTitle, int>;

class AppState {
  final bool isSignedIn;
  final RemoteProducts remoteProducts;
  final Quantities productQuantities;

  const AppState({
    required this.isSignedIn,
    required this.remoteProducts,
    required this.productQuantities,
  });
  AppState.initialState()
    : isSignedIn = false,
      remoteProducts = const RemoteResource.loading(),
      productQuantities = {};

  RemoteProducts get remoteProductsWithDiscount =>
      isSignedIn
          ? remoteProducts.mapIfFinished(
            (products) =>
                products.map((product) => product.copyWithDiscount()).toList(),
          )
          : remoteProducts;

  List<CartItem> get cart {
    final products =
        remoteProductsWithDiscount is FinishedRemoteResource
            ? remoteProductsWithDiscount.asFinished().value
            : <Product>[];
    final productByTitle = {
      for (final product in products) product.title: product,
    };
    return productQuantities.entries
        .where((entry) => productByTitle.containsKey(entry.key))
        .map(
          (entry) => CartItem(
            product: productByTitle[entry.key]!,
            amount: entry.value,
          ),
        )
        .toList();
  }

  double get totalPrice => cart.fold<double>(
    0.0,
    (previousValue, element) =>
        previousValue + element.amount * element.product.price,
  );

  AppState copyWith({
    bool? isSignedIn,
    RemoteResource<List<Product>>? remoteProducts,
    Quantities? productQuantities,
  }) {
    return AppState(
      isSignedIn: isSignedIn ?? this.isSignedIn,
      remoteProducts: remoteProducts ?? this.remoteProducts,
      productQuantities: productQuantities ?? this.productQuantities,
    );
  }
}
