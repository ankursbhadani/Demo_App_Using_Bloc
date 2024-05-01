import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/cart_items.dart';
import '../../model/product_model.dart';

part 'cart_screen_event.dart';

part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartState> {
  CartScreenBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }
}

FutureOr<void> cartInitialEvent(
    CartInitialEvent event, Emitter<CartState> emit) {
  emit(CartSuccessState(cartItems: cartItems));
}

FutureOr<void> cartRemoveFromCartEvent(
    CartRemoveFromCartEvent event, Emitter<CartState> emit) {
  cartItems.remove(event.product);
// emit()
  emit(CartSuccessState(cartItems: cartItems));
  emit(ItemRemoveFromCartState());
}
