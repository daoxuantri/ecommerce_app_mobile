part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent {}

class CheckoutInitialEvent extends CheckoutEvent {}

class TypeAndStatusChangedEvent extends CheckoutEvent {
  final int? type;
  final int? status;

  TypeAndStatusChangedEvent(this.type, this.status);
}

class DemandToDemandDetailEvent extends CheckoutEvent {
  final String id;
  //final DemandDataModel model;
  DemandToDemandDetailEvent(this.id);
}

class CheckoutDetailClickedEvent extends CheckoutEvent {
  final String orderId;
  CheckoutDetailClickedEvent({
    required this.orderId,
  });
}
