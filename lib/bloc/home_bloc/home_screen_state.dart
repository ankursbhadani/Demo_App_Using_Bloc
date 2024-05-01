part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState{}

abstract class HomeActionState extends HomeScreenState {}
class HomeInitial extends HomeScreenState{}
class HomeLoadingState extends HomeScreenState{}
class HomeLoadedSuccessState extends HomeScreenState{
  final List<Product> products;
  HomeLoadedSuccessState({required this.products});
}
class HomeErrorState extends HomeScreenState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
class ItemAlreadyInCartActionState extends HomeActionState{}
class ItemAlreadyInWishlistActionState extends HomeActionState{}