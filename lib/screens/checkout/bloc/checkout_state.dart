part of 'checkout_bloc.dart';


@immutable
abstract class CheckoutState {
  const CheckoutState();
}

abstract class CheckoutActionState extends CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final AddressDataModel address;
  const CheckoutLoaded({
    required this.address,
  });
}
class CheckoutError extends CheckoutState {
  final String message;
  CheckoutError(this.message);
}

class CheckoutListLoaded extends CheckoutState {
  // final List<OrderDetailDataModel> orderList;
  // CheckoutListLoaded(this.orderList);
}

class DemandToDemandDetailActionState extends CheckoutActionState {
  final String id;
  //final DemandDataModel model;
  DemandToDemandDetailActionState(this.id);
}

class CheckoutDepositClickedState extends CheckoutActionState {
  final String orderId;
  CheckoutDepositClickedState({
    required this.orderId,
  });
}

class VnPaymentClickedState extends CheckoutActionState {
  final int amount;
  VnPaymentClickedState({
    required this.amount,
  });
}


class CheckoutNoAddress extends CheckoutState {
}