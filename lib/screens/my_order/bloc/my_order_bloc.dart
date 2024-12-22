import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/orders.dart';
import 'package:ecommerce_app_mobile/model/orders/order_data_model.dart';
import 'package:ecommerce_app_mobile/model/orders/order_detail_data_model.dart';
import 'package:meta/meta.dart';

part 'my_order_event.dart';

part 'my_order_state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc() : super(MyOrderInitial()) {
    on<MyOrderInitialEvent>(myOrderInitialEvent);
    on<TypeAndStatusChangedEvent >(typeAndStatusChangedEvent);
    on<DemandToDemandDetailEvent>(demandToDemandDetailEvent);
    on<OrderDetailClickedEvent>(orderDetailClickedEvent);
    on<CancelOrderClickedEvent>(cancelOrderClickedEvent);

  }

  FutureOr<void> myOrderInitialEvent(
      MyOrderInitialEvent event, Emitter<MyOrderState> emit) async {
    emit(MyOrderLoading());
    try {
      ApiServiceOrders apiServiceOrders = ApiServiceOrders();
      final List<OrderDataModel> orderList = await apiServiceOrders.getListOrder();
      emit(MyOrderLoaded());
      //emit(BuyAndSellState(modelList));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(MyOrderError(failToken));
    }
  }

  FutureOr<void> typeAndStatusChangedEvent (
      TypeAndStatusChangedEvent event, Emitter<MyOrderState> emit) async {
    emit(MyOrderLoading());
    try {
      ApiServiceOrders apiServiceOrders = ApiServiceOrders();
      final List<OrderDataModel> orderList;
      if(event.status == '' ){
        orderList = await apiServiceOrders.getListOrder(statusOrder: '');
        
      }else{
        orderList = await apiServiceOrders.getListOrder(statusOrder: event.status);
      }
      
      emit(OrderListLoaded(orderList));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(MyOrderError(failToken));
    }
  }

  FutureOr<void> cancelOrderClickedEvent (
      CancelOrderClickedEvent event, Emitter<MyOrderState> emit) async {
    emit(MyOrderLoading());
    try {
     String? message = await ApiServiceOrders().cancelOrder(event.orderId, 'CANCELED');
      
      emit(CancelOrderClickedState(message: message));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(MyOrderError(failToken));
    }
  }


  FutureOr<void> demandToDemandDetailEvent(DemandToDemandDetailEvent event, Emitter<MyOrderState> emit) {
    emit(DemandToDemandDetailActionState(event.id));
  }

  FutureOr<void> orderDetailClickedEvent(
      OrderDetailClickedEvent event, Emitter<MyOrderState> emit) {
    emit(OrderDepositClickedState(orderId: event.orderId));
  }
}
