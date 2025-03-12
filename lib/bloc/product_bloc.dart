import 'dart:async';

import 'package:iu_bachelor_thesis/bloc/user_bloc.dart';
import 'package:iu_bachelor_thesis/models/product.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';
import 'package:iu_bachelor_thesis/utils/disposable.dart';

part 'product_bloc_events.dart';
part 'product_bloc_states.dart';

class ProductBloc implements Disposable {
  final ProductService _productService;
  final UserBloc _userBloc;

  bool _hasDiscount;
  var _productsState = const ProductsState.loading();
  ProductsState get productsState => _productsState;

  final _productsStateController = StreamController<ProductsState>.broadcast();
  Sink<ProductsState> get _productsStateSink => _productsStateController.sink;
  Stream<ProductsState> get productsStateStream =>
      _productsStateController.stream;

  final _loadProductEventController =
      StreamController<LoadProductEvent>.broadcast();
  Sink<LoadProductEvent> get loadProductSink =>
      _loadProductEventController.sink;

  ProductBloc(this._productService, this._userBloc)
    : _hasDiscount = _userBloc.isSignedIn {
    _handleUserEvents();
    _handleLoadProductEvents();
  }

  void _handleUserEvents() {
    _userBloc.isSignedInStream.listen((isSignedIn) {
      if (isSignedIn && !_hasDiscount) {
        if (_productsState.isLoaded()) {
          final discountedProducts =
              _productsState
                  .as<ProductsLoaded>()
                  .products
                  .map((product) => product.copyWithDiscount())
                  .toList();
          _productsState = ProductsState.loaded(discountedProducts);
          _productsStateSink.add(_productsState);
        }
      } else if (!isSignedIn && _hasDiscount) {
        final undiscountedProducts =
            _productsState
                .as<ProductsLoaded>()
                .products
                .map((product) => product.copyWithoutDiscount())
                .toList();
        _productsState = ProductsState.loaded(undiscountedProducts);
        _productsStateSink.add(_productsState);
      }
      _hasDiscount = isSignedIn;
    });
  }

  void _handleLoadProductEvents() {
    _loadProductEventController.stream.listen((_) async {
      _productsState = const ProductsState.loading();
      _productsStateSink.add(_productsState);

      try {
        var products = await _productService.fetchProducts();
        _hasDiscount = _userBloc.isSignedIn;
        if (_hasDiscount) {
          products =
              products.map((product) => product.copyWithDiscount()).toList();
        }
        _productsState = ProductsState.loaded(products);
        _productsStateSink.add(_productsState);
      } catch (err) {
        _productsState = ProductsState.error(err.toString());
        _productsStateSink.add(_productsState);
      }
    });
  }

  @override
  Future<void> dispose() {
    return Future.wait([
      _productsStateController.close(),
      _loadProductEventController.close(),
    ]);
  }
}
