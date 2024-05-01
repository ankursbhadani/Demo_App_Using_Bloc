part of 'cart_screen_bloc.dart';

@immutable
abstract class CartScreenEvent {}
class CartInitialEvent extends CartScreenEvent{}
class CartRemoveFromCartEvent extends CartScreenEvent{
  final Product product;
  CartRemoveFromCartEvent({required this.product});
}