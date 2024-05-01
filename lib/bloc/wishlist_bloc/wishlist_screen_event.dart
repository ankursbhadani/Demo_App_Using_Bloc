part of 'wishlist_screen_bloc.dart';

@immutable
abstract class WishlistEvent {}
class WishlistInitialEvent extends WishlistEvent{}
class ItemRemoveFromWishlistEvent extends WishlistEvent{
  final Product product;
  ItemRemoveFromWishlistEvent({required this.product});
}
