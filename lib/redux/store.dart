import 'package:redux/redux.dart';
import 'package:iu_bachelor_thesis/redux/actions/actions.dart';
import 'package:iu_bachelor_thesis/redux/middlewares/fetch_products_middleware.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';
import 'package:iu_bachelor_thesis/service/product_service.dart';

import 'reducers/app_state_reducer.dart';

Store<AppState> createStore({required ProductService productService}) {
  final store = Store(
    appReducer,
    initialState: AppState.initialState(),
    middleware: [FetchProductsMiddleware(productService).fetchTodosMiddleware],
  );
  store.dispatch(FetchProductsAction());
  return store;
}
