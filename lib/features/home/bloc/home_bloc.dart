import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/data/cart_items.dart';
import 'package:bloc_test/data/grocery_data.dart';
import 'package:bloc_test/data/wishlist_items.dart';
import 'package:bloc_test/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishlistNavigateButtonEvent>(homeWishlistNavigateButtonEvent);

    on<HomeCartNavigateButtonEvent>(homeCartNavigateButtonEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingSatate());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessSatate(
          products: GroceryData.groceryProducts
              .map(
                (e) => ProductDataModel(
                    id: e['id'],
                    name: e['name'],
                    description: e['description'],
                    price: e['price'],
                    imageUrl: e['imageUrl']),
              )
              .toList()),
    );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("wishlist product clicked");
    wishList.add(event.clickProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart product clicked");
    cartItems.add(event.clickProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistNavigateButtonEvent(
      HomeWishlistNavigateButtonEvent event, Emitter<HomeState> emit) {
    print("wishlist Navigate clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartNavigateButtonEvent(
      HomeCartNavigateButtonEvent event, Emitter<HomeState> emit) {
    print("cart Navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
