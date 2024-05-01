import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:simple_app_usingbloc/data/wishlist_items.dart';

import '../../model/product_model.dart';

part 'wishlist_screen_event.dart';
part 'wishlist_screen_state.dart';

class WishlistScreenBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistScreenBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<ItemRemoveFromWishlistEvent>(itemRemoveFromWishlistEvent);
  }
}
FutureOr<void>wishlistInitialEvent(WishlistInitialEvent event,Emitter<WishlistState>emit){
  emit(WishlistSuccessState(wishlistItems: wishlistItems));
}
FutureOr<void>itemRemoveFromWishlistEvent(ItemRemoveFromWishlistEvent event,Emitter<WishlistState>emit){
  wishlistItems.remove(event.product);
  emit(WishlistSuccessState(wishlistItems: wishlistItems));
}