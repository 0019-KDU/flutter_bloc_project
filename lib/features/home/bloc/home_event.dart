part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickProduct});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickProduct;

  HomeProductCartButtonClickedEvent({required this.clickProduct});
}

class HomeWishlistNavigateButtonEvent extends HomeEvent {}

class HomeCartNavigateButtonEvent extends HomeEvent {}
