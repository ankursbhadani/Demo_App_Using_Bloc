part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeInitialEvent extends HomeScreenEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeScreenEvent {
  final Product clickedProduct;

  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductCartButtonClickedEvent extends HomeScreenEvent {
  final Product clickedProduct;

  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeWishlistButtonNavigateEvent extends HomeScreenEvent {}

class HomeCartButtonNavigateEvent extends HomeScreenEvent {}
