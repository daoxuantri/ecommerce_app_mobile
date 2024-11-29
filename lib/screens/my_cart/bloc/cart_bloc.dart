import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/mycart.dart';
import 'package:ecommerce_app_mobile/model/cart/my_cart_data_model.dart';
import 'package:ecommerce_app_mobile/model/cart/product_item_model.dart';   
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartErrorScreenToLoginEvent>(cartErrorScreenToLoginEvent);
    on<CartProductClickedEvent>(cartProductClickedEvent);
    on<RemoveAllProductClickedEvent>(removeAllProductClickedEvent);
    on<RemoveProductClickedEvent>(removeProductClickedEvent);
    on<UpdateProductQuantityEvent>(updateProductQuantityEvent);
  }

  Future<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      //get cart 
      MyCartDataModel mycart = await ApiServiceCart().getCartById(event.userId);  
      //product-item 
      List<ProductItemModel>? listproduct = mycart.productItem;

      emit(CartLoadedSuccessState(mycart: mycart, listproduct: listproduct));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CartErrorState(errorMessage: failToken));
    }
  }


  Future<void> removeAllProductClickedEvent(
      RemoveAllProductClickedEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());    
    try {
      final String message =  await ApiServiceCart().deleteAllProduct(event.userId!);

      await Future.delayed(Duration(seconds: 2));
      emit(RemoveAllProductClickedState(message: message));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CartErrorState(errorMessage: failToken));
    }
  }


//updat quantity product
  Future<void> updateProductQuantityEvent(
      UpdateProductQuantityEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());    
    try {
      final String message =  await ApiServiceCart().updateQuantityProduct(event.productId!,event.newQuantity, event.color!, event.memory!);
      emit(UpdateProductQuantityState(message: message));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CartErrorState(errorMessage: failToken));
    }
  }


// //event remove 1 sp lua chon
  Future<void> removeProductClickedEvent(
      RemoveProductClickedEvent event, Emitter<CartState> emit) async {
        emit(CartLoadingState());  
    try {
      final String message =  await ApiServiceCart().deleteProduct(event.productId!);
      print(message);

      await Future.delayed(Duration(seconds: 1));
      emit(RemoveProductClickedState(message: message));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
       print(failToken);
      emit(CartErrorState(errorMessage: failToken));
    }
  }

  FutureOr<void> cartErrorScreenToLoginEvent(
      CartErrorScreenToLoginEvent event, Emitter<CartState> emit) {
    emit(CartErrorScreenToLoginState());
  }

  FutureOr<void> cartProductClickedEvent(
      CartProductClickedEvent event, Emitter<CartState> emit) {
    emit(CartProductClickedState(productId: event.productId));
  }
}
