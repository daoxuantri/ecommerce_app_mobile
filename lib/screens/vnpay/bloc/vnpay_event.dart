part of 'vnpay_bloc.dart';

@immutable
abstract class VNPayEvent {
  const VNPayEvent();
}

class VNPayInitialEvent extends VNPayEvent {
  final int  amount;

  const VNPayInitialEvent({
    required this.amount
  });
}
class VNPayTransactionFailedEvent extends VNPayEvent {}

class VNPayTransactionSuccessEvent extends VNPayEvent {
  final List<ProductItem> productItems; 
  final InformationUser userInformation; 
  final bool paid;
  final int totalPayment;
  final String billCode;

  VNPayTransactionSuccessEvent({
    required this.productItems,
    required this.userInformation,
    required this.paid,
     required this.totalPayment,
     required this.billCode,
     });
}