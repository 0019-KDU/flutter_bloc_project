part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeAction extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingSatate extends HomeState {}

class HomeLoadedSuccessSatate extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessSatate({required this.products});
}

class HomeErrorSatate extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeAction {}

class HomeNavigateToCartPageActionState extends HomeAction {}

class HomeProductItemWishlistedActionState extends HomeAction {}

class HomeProductItemCartedActionState extends HomeAction {}
