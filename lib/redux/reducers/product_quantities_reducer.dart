import 'package:redux/redux.dart';
import 'package:iu_bachelor_thesis/redux/actions/actions.dart';
import 'package:iu_bachelor_thesis/redux/state.dart';

final productQuantitiesReducer = combineReducers<Quantities>([
  TypedReducer<Quantities, IncrementProductAction>(_increment).call,
  TypedReducer<Quantities, DecrementProductAction>(_decrement).call,
]);

Quantities _changeAmount(Quantities state, ChangeProductAmountAction action) {
  final newState = Map.of(state);
  final currentAmount = newState.putIfAbsent(action.product.title, () => 0);
  if (currentAmount + action.amount < 0) return state;
  if (currentAmount + action.amount == 0) {
    newState.remove(action.product.title);
    return newState;
  }
  return newState..[action.product.title] = currentAmount + action.amount;
}

Quantities _increment(Quantities state, IncrementProductAction action) =>
    _changeAmount(state, action);

Quantities _decrement(Quantities state, DecrementProductAction action) =>
    _changeAmount(state, action);
