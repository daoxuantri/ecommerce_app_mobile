import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/mycart.dart';
import 'package:ecommerce_app_mobile/api/products.dart';
import 'package:ecommerce_app_mobile/model/products/data_details_product.dart';
import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:ecommerce_app_mobile/model/related_product/product_related_model.dart';
import 'package:ecommerce_app_mobile/screens/my_cart/modelselected/selected_model.dart';
import 'package:flutter/material.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitialEvent>(productInitialEvent);
    on<ProductPostClickedEvent>(productPostClickedEvent);
    on<ProductTab1ClickedEvent>(productTab1ClickedEvent);
    on<ProductTab2ClickedEvent>(productTab2ClickedEvent);
    on<AddProductToCartEvent>(addProductToCartEvent);
    on<ProductRelatedClickedEvent>(productRelatedClickedEvent);
    on<CheckoutProductClickedEvent>(checkoutProductClickedEvent);
    // on<ProductClickedFavoriteEvent>(productClickedFavoriteEvent);
    // on<CreateOrderEvent>(createOrderEvent);
    // on<InitialOrderEvent>(initialOrderEvent);
  }

  Future<FutureOr<void>> productInitialEvent(
      ProductInitialEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      DataDetailProduct? product =
          await ApiServiceProducts().getDetailProduct(event.productId);
      // //related product

      print('thanhcong 2');

      List<ProductRelatedModel>? listallproduct =
          await ApiServiceProducts().getRelatedProduct(event.productId);

      emit(ProductLoadedSuccessState(
          product: product!, listproduct: listallproduct!));
      // emit(ProductLoadedSuccessState(product: product));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ProductErrorState(errorMessage: failToken));
    }
  }
  Future<FutureOr<void>> productRelatedClickedEvent(
      ProductRelatedClickedEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      emit(ProductRelatedClickedState(productId: event.productId));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ProductErrorState(errorMessage: failToken));
    }
  }

  Future<FutureOr<void>> checkoutProductClickedEvent(
      CheckoutProductClickedEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    try {
      emit(CheckoutProductClickedState(productItem: event.productItem));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(ProductErrorState(errorMessage: failToken));
    }
  }

  FutureOr<void> productPostClickedEvent(
      ProductPostClickedEvent event, Emitter<ProductState> emit) {
    emit(ProductPostClickedActionState(product: event.product));
  }

  FutureOr<void> productTab1ClickedEvent(
      ProductTab1ClickedEvent event, Emitter<ProductState> emit) {
    emit(ProductTab1ClickedActionState());
  }

  FutureOr<void> productTab2ClickedEvent(
      ProductTab2ClickedEvent event, Emitter<ProductState> emit) {
    emit(ProductTab2ClickedActionState());
  }

  Future<FutureOr<void>> addProductToCartEvent(
      AddProductToCartEvent event, Emitter<ProductState> emit) async {
    try {
      // bool check = await CheckSubscribe().checkSubscribe(event.productId);
      // emit(ProductSubSuccess(check: check));
      String message = await ApiServiceCart().updateQuantityProduct(
          event.productId, event.quantity, event.color, event.memory);

      emit(AddProductToCartState());
    } catch (e) {
      print(e);
      emit(ProductSubSuccess(check: false));
    }
  }

  // Future<FutureOr<void>> productClickedFavoriteEvent(
  //     ProductClickedFavoriteEvent event, Emitter<ProductState> emit) async {
  //   if (event.check) {
  //     try {
  //       await ApiServiceProducts().unsubscribeProduct(event.productId);
  //       emit(ProductSubSuccess(check: false));
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     try {
  //       await ApiServiceProducts().subscribeProduct(event.productId);
  //       emit(ProductSubSuccess(check: true));
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  // Future<FutureOr<void>> createOrderEvent(
  //     CreateOrderEvent event, Emitter<ProductState> emit) async {
  //   try {
  //     await ApiServiceOrders().createOrder(
  //         event.demandId,
  //         event.productQuantity,
  //         event.transportMethod,
  //         event.requireDeliveryTimeTo);
  //     emit(CreateOrderActionState());
  //   } catch (e) {
  //     print(e);
  //     emit(CreateOrderErrorActionState(message: e.toString()));
  //   }
  // }

  // Future<FutureOr<void>> initialOrderEvent(
  //     InitialOrderEvent event, Emitter<ProductState> emit) async {
  //   try {
  //     List<VendorShippingAddressData> response =
  //         await ApiServiceVendors().getVendorShippingAddress();
  //     VendorShippingAddressData? address = null;
  //     if (response.isNotEmpty) {
  //       address = response.firstWhere((element) => element.isDefault == true);
  //     }

  //     emit(InitialOrderActionState(address: address));
  //   } catch (e) {
  //     print(e);
  //     emit(ProductErrorState(errorMessage: "Tạo đơn hàng không thành công!"));
  //   }
  // }
}
