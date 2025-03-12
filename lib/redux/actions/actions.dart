import 'package:iu_bachelor_thesis/models/product.dart';

abstract class Action {
  const Action();

  @override
  String toString() {
    return '$runtimeType';
  }
}

abstract class ChangeProductAmountAction extends Action {
  int get amount;

  final Product product;
  const ChangeProductAmountAction({required this.product});
}

class IncrementProductAction extends ChangeProductAmountAction {
  @override
  final int amount = 1;

  const IncrementProductAction({required super.product});
}

class DecrementProductAction extends ChangeProductAmountAction {
  @override
  final int amount = -1;

  const DecrementProductAction({required super.product});
}

class SignOutAction extends Action {}

class SingInAction extends Action {}

class FetchProductsAction extends Action {}

class FetchProductsSucceededAction extends Action {
  final List<Product> products;

  const FetchProductsSucceededAction(this.products);
}

class FetchProductsFailedAction extends Action {
  final String errorMessage;

  const FetchProductsFailedAction({required this.errorMessage});
}
