import 'package:flutter/foundation.dart';
import 'package:iu_bachelor_thesis/models/product.dart';

@immutable
sealed class ProductsState {
  const ProductsState();

  const factory ProductsState.loading() = ProductsLoading;
  const factory ProductsState.loaded(List<Product> products) = ProductsLoaded;
  const factory ProductsState.error(String message) = ProductsError;

  bool isLoaded() => this is ProductsLoaded;
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);
}
