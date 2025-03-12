import 'package:redux/redux.dart';
import 'package:iu_bachelor_thesis/redux/actions/actions.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

class FetchProductsMiddleware {
  final ProductService service;

  const FetchProductsMiddleware(this.service);

  void fetchTodosMiddleware(
    Store<AppState> store,
    action,
    NextDispatcher next,
  ) {
    if (action is FetchProductsAction) {
      service
          .fetchProducts()
          .then(FetchProductsSucceededAction.new)
          .then(store.dispatch)
          .catchError((error) {
            store.dispatch(
              FetchProductsFailedAction(errorMessage: error.toString()),
            );
          });
    }
    next(action);
  }
}
