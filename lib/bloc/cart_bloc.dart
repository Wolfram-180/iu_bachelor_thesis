import 'dart:async';

import 'package:iu_bachelor_thesis/bloc/product_bloc.dart';
import 'package:iu_bachelor_thesis/models/cart_item.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/utils/disposable.dart';

part 'cart_events.dart';

typedef Cart = Map<Product, int>;
const Cart emptyCart = {};

class CartBloc implements Disposable {
  Cart _cart = {};
  Cart get cart => _cart;

  final StreamController<Cart> _cartController = StreamController.broadcast();
  Stream<Cart> get cartStream => _cartController.stream;
  Sink<Cart> get _cartSink => _cartController.sink;

  int get numberOfProducts => _cart.length;
  late final Stream<int> numberOfProductsStream;
  /*
  int numberOfProduct(Product product) => _cart[product] ?? 0;
  Stream<int> numberOfProductStream(Product product) =>
      cartStream.map((event) => event[product] ?? 0);*/

  double get totalPrice => cart.calculateTotalPrice();
  Stream<double> get totalPriceStream =>
      cartStream.map((event) => event.calculateTotalPrice());

  final StreamController<ChangeQuantityEvent> _quantityEventController =
      StreamController.broadcast();
  Sink<ChangeQuantityEvent> get quantityEventSink =>
      _quantityEventController.sink;
  Stream<ChangeQuantityEvent> get _quantityEventStream =>
      _quantityEventController.stream;

  CartBloc(ProductBloc productBloc) {
    numberOfProductsStream =
        _cartController.stream.map((cart) => cart.length).asBroadcastStream();
    _handleProductEvents(productBloc);
    _handleQuantityChangeEvents();
  }

  void _handleProductEvents(ProductBloc productBloc) {
    productBloc.productsStateStream.listen((event) {
      if (event.hasError()) {
        _cart = emptyCart;
        _cartSink.add(emptyCart);
      } else if (event.isLoaded()) {
        final products = event.productsOrEmptyList();
        final productsByName = {
          for (final product in products) product.title: product,
        };
        _cart.removeWhere((key, _) => !productsByName.containsKey(key.title));
        _cart = _cart.map(
          (key, value) => MapEntry(productsByName[key.title]!, value),
        );
        _cartSink.add(_cart);
      }
    });
  }

  void _handleQuantityChangeEvents() {
    _quantityEventStream.listen((event) {
      late final int summand;
      if (event is IncreaseQuantityEvent) {
        summand = 1;
      } else if (event is DecreaseQuantityEvent) {
        summand = -1;
      } else {
        throw UnimplementedError();
      }
      final old = _cart.putIfAbsent(event.product, () => 0);
      final newQuantity = old + summand;
      _cart[event.product] = newQuantity.isNegative ? 0 : newQuantity;
      if (_cart[event.product]! <= 0) _cart.remove(event.product);
      _cartSink.add(_cart);
    });
  }

  @override
  Future<void> dispose() {
    return Future.wait([_cartController.close()]);
  }
}

extension CartItemConverter on Cart {
  List<CartItem> toCartItems() =>
      entries.map((e) => CartItem(product: e.key, amount: e.value)).toList();

  double calculateTotalPrice() => entries.fold(
    0,
    (previousValue, element) =>
        previousValue + element.key.price * element.value,
  );
}
