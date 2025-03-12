part of 'cart_bloc.dart';

abstract class ChangeQuantityEvent {
  final Product product;
  const ChangeQuantityEvent._(this.product);
}

class IncreaseQuantityEvent extends ChangeQuantityEvent {
  IncreaseQuantityEvent(super.product) : super._();
}

class DecreaseQuantityEvent extends ChangeQuantityEvent {
  DecreaseQuantityEvent(super.product) : super._();
}
