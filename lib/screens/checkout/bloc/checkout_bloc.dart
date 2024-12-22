import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/address.dart';
import 'package:ecommerce_app_mobile/api/checkout.dart';
import 'package:ecommerce_app_mobile/api/orders.dart';
import 'package:ecommerce_app_mobile/api/user_signin.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:ecommerce_app_mobile/screens/checkout/components/model.dart';
import 'package:flutter/material.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<CheckoutInitialEvent>(checkoutInitialEvent);
    on<TypeAndStatusChangedEvent>(typeAndStatusChangedEvent);
    on<DemandToDemandDetailEvent>(demandToDemandDetailEvent);
    on<CheckoutDetailClickedEvent>(checkoutDetailClickedEvent);
    on<VnPaymentClickedEvent>(vnPaymentClickedEvent);
    on<CheckoutClickedEvent>(checkoutClickedEvent);
  }

  FutureOr<void> checkoutInitialEvent(
      CheckoutInitialEvent event, Emitter<CheckoutState> emit) async {
    emit(CheckoutLoading());
    try {
      final AddressDataModel? addressDataModel =await ApiServiceUsers().getDefaultAddressShiping();
      if (addressDataModel == null) {
      emit(CheckoutNoAddress());
    } else {
      emit(CheckoutLoaded(address: addressDataModel));
    }
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CheckoutError(failToken));
    }
  }

  FutureOr<void> typeAndStatusChangedEvent(
      TypeAndStatusChangedEvent event, Emitter<CheckoutState> emit) async {
    emit(CheckoutLoading());
    try {
      ApiServiceOrders apiServiceOrders = ApiServiceOrders();
      // final List<OrderDetailDataModel> orderList = await apiServiceOrders.getListOrder(
      //   type: event.type,
      //   status: event.status,
      //   productId: null,
      // );
      // emit(OrderListLoaded(orderList));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CheckoutError(failToken));
    }
  }

  FutureOr<void> vnPaymentClickedEvent(
      VnPaymentClickedEvent event, Emitter<CheckoutState> emit) async {
    emit(CheckoutLoading());
    try {
      // emit(VnPaymentClickedState(amount: event.amount));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CheckoutError(failToken));
    }
  }

  FutureOr<void> demandToDemandDetailEvent(
      DemandToDemandDetailEvent event, Emitter<CheckoutState> emit) {
    emit(DemandToDemandDetailActionState(event.id));
  }

  FutureOr<void> checkoutDetailClickedEvent(
      CheckoutDetailClickedEvent event, Emitter<CheckoutState> emit) {
    // emit(OrderDepositClickedState(orderId: event.orderId));
  }
}

FutureOr<void> checkoutClickedEvent(
      CheckoutClickedEvent event, Emitter<CheckoutState> emit) async {
    emit(CheckoutLoading());
    try {
      if(event.paid){
        emit(VnPaymentClickedState(productItems: event.productItems, userInformation: event.userInformation, paid: event.paid , totalPayment: event.totalPayment));
      }else{
        String message = await ApiServiceCheckout().createOrderByUser(event.productItems, event.userInformation, event.paid, 'COD');
        emit(CODClickedState(message: message));
      }
      
     
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CheckoutError(failToken));
    }
  }