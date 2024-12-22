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


class VnPaymentClickedEvent extends CheckoutEvent {
  final int  amount;
  VnPaymentClickedEvent({
    required this.amount,
  });
}

class createOrderClickedEvent extends CheckoutEvent {
  // final String userId;
  // final List<ProductItem> productItems; // Giả sử bạn có một lớp ProductItem để đại diện cho sản phẩm
  // final UserInformation userInformation; // Giả sử bạn có một lớp UserInformation để đại diện cho thông tin người dùng
  // final bool paid;

  // createOrderClickedEvent({
  //   required this.userId,
  //   required this.productItems,
  //   required this.userInformation,
  //   required this.paid,
  // });
}

class CheckoutClickedEvent extends CheckoutEvent {
  final List<ProductItem> productItems; 
  final InformationUser userInformation; 
  final bool paid;
  final int totalPayment;

  CheckoutClickedEvent({
    required this.productItems,
    required this.userInformation,
    required this.paid,
     required this.totalPayment,
  });
}

