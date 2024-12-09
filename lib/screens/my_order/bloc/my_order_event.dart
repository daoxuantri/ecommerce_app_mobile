part of 'my_order_bloc.dart';

@immutable
abstract class MyOrderEvent {}

class MyOrderInitialEvent extends MyOrderEvent {}

class TypeAndStatusChangedEvent  extends MyOrderEvent {
  final String? status;

  TypeAndStatusChangedEvent (this.status);
}

class DemandToDemandDetailEvent extends MyOrderEvent{
  final String id;
  //final DemandDataModel model;
  DemandToDemandDetailEvent(this.id);
}

class OrderDetailClickedEvent extends MyOrderEvent {
  final String orderId;
  OrderDetailClickedEvent({
    required this.orderId,
  });
}