import 'package:restaurant_app/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is CartStarted) {
      yield* _mapCartSartedStateToEvent();
    } else if (event is CartAddProduct) {
      yield* _mapCartAddProductStateToEvent(event, state);
    } else if (event is CartRemoveProduct) {
      yield* _mapCartRemoveProductStateToEvent(event, state);
    }
  }

  Stream<CartState> _mapCartSartedStateToEvent() async* {
    yield CartLoading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      yield const CartLoaded();
    } catch (_) {}
  }

  Stream<CartState> _mapCartAddProductStateToEvent(
    CartAddProduct event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<CartState> _mapCartRemoveProductStateToEvent(
    CartRemoveProduct event,
    CartState state,
  ) async* {
    if (state is CartLoaded) {
      try {
        yield CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
