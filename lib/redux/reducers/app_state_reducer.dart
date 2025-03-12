import 'package:iu_bachelor_thesis/redux/reducers/product_quantities_reducer.dart';
import 'package:iu_bachelor_thesis/redux/reducers/product_reducer.dart';
import 'package:iu_bachelor_thesis/redux/reducers/user_reducer.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';

AppState appReducer(AppState state, action) => AppState(
  isSignedIn: userReducer(state.isSignedIn, action),
  remoteProducts: productReducer(state.remoteProducts, action),
  productQuantities: productQuantitiesReducer(state.productQuantities, action),
);
