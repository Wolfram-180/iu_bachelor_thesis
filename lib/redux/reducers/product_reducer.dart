import 'package:redux/redux.dart';
import 'package:iu_bachelor_thesis/models/remote_resource.dart';

import '../actions/actions.dart';
import '../state.dart';

final productReducer = combineReducers<RemoteProducts>([
  TypedReducer<RemoteProducts, FetchProductsAction>(fetchProducts).call,
  TypedReducer<RemoteProducts, FetchProductsSucceededAction>(
    productFetched,
  ).call,
  TypedReducer<RemoteProducts, FetchProductsFailedAction>(errorOccurred).call,
]);

RemoteProducts fetchProducts(
  RemoteProducts state,
  FetchProductsAction action,
) => const RemoteResource.loading();

RemoteProducts productFetched(
  RemoteProducts state,
  FetchProductsSucceededAction action,
) => RemoteResource.finished(action.products);

RemoteProducts errorOccurred(
  RemoteProducts state,
  FetchProductsFailedAction action,
) => RemoteResource.error(action.errorMessage);
