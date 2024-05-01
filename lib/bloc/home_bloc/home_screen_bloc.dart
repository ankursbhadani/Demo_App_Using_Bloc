import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_app_usingbloc/data/cart_items.dart';
import 'package:simple_app_usingbloc/data/product_list.dart';
import 'package:simple_app_usingbloc/data/wishlist_items.dart';

import '../../model/product_model.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
}

FutureOr<void> homeInitialEvent(
    HomeInitialEvent event, Emitter<HomeScreenState> emit) async {
  emit(HomeLoadingState());
  await Future.delayed(Duration(seconds: 3));
  emit(HomeLoadedSuccessState(
      products: groceryItems
          .map((e) => Product(
              id: e['id'],
              name: e['name'],
              category: e['category'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl']))
          .toList()));
}

FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event,
    Emitter<HomeScreenState> emit) {
  print("wishlist button clicked");
  if (wishlistItems.contains(event.clickedProduct)) {
    emit(ItemAlreadyInWishlistActionState());
  } else {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }
}

FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event, Emitter<HomeScreenState> emit) {
  print("wishlist button clicked");
  if (cartItems.contains(event.clickedProduct)) {
    emit(ItemAlreadyInCartActionState());
  } else {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }
}

FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event, Emitter<HomeScreenState> emit) {
  emit(HomeNavigateToWishlistPageActionState());
}

FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event, Emitter<HomeScreenState> emit) {
  emit(HomeNavigateToCartPageActionState());
}
