part of 'cart_screen_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState extends CartState{}

 class CartInitial extends CartState {}
 class CartSuccessState extends CartState{
  final List<Product>cartItems;
  CartSuccessState({required this.cartItems});
 }
 class ItemRemoveFromCartState extends CartActionState{}