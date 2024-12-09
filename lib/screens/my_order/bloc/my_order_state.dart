part of 'my_order_bloc.dart';


@immutable
abstract class MyOrderState {}

abstract class MyOrderActionState extends MyOrderState{}

class MyOrderInitial extends MyOrderState {}

class MyOrderLoading extends MyOrderState {}

class MyOrderLoaded extends MyOrderState {
  // final List<OrderDetailDataModel> orderList;
  // MyOrderLoaded(this.orderList);
}
// class TabChangedState extends MyOrderState {
//   final int currentType;
//   final int currentStatus;
//
//   TabChangedState(this.currentType, this.currentStatus);
// }

class MyOrderError extends MyOrderState {
  final String message;
  MyOrderError(this.message);
}

class OrderListLoaded extends MyOrderState {
  final  List<OrderDataModel> orderrList;
  OrderListLoaded(this.orderrList);
}

class DemandToDemandDetailActionState extends MyOrderActionState {
  final String id;
  //final DemandDataModel model;
  DemandToDemandDetailActionState(this.id);
}

class OrderDepositClickedState extends MyOrderActionState {
  final String orderId;
  OrderDepositClickedState({
    required this.orderId,
  });
}

