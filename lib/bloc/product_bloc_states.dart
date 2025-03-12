part of 'product_bloc.dart';

abstract class ProductsState {
  const ProductsState._();

  const factory ProductsState.loading() = ProductsLoading;
  const factory ProductsState.error(String errorMessage) = ProductsError;
  const factory ProductsState.loaded(List<Product> products) = ProductsLoaded;

  bool isLoading() => this is ProductsLoading;
  bool isLoaded() => this is ProductsLoaded;
  bool hasError() => this is ProductsError;

  T as<T extends ProductsState>() => this as T;
  List<Product> productsOrEmptyList() =>
      isLoaded() ? as<ProductsLoaded>().products : [];
}

class ProductsLoading extends ProductsState {
  const ProductsLoading() : super._();
}

class ProductsError extends ProductsState {
  final String errorMessage;
  const ProductsError(this.errorMessage) : super._();
}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  const ProductsLoaded(this.products) : super._();
}
