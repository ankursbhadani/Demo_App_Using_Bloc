part of 'wishlist_screen_bloc.dart';

@immutable
abstract class WishlistState {}
abstract class WishlistActionState extends WishlistState{}


 class WishlistInitial extends WishlistState {}
 class WishlistSuccessState extends WishlistState{
 final List<Product>wishlistItems;
 WishlistSuccessState({required this.wishlistItems});
 }