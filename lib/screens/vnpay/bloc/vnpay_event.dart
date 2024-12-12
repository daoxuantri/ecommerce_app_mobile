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
  final String userId;
  final List<ProductItem> productItems; // Giả sử bạn có một lớp ProductItem để đại diện cho sản phẩm
  final InformationUser userInformation; // Giả sử bạn có một lớp UserInformation để đại diện cho thông tin người dùng
  final bool paid;
  final int totalPayment;
  final String billCode;

  VNPayTransactionSuccessEvent({
    required this.userId,
    required this.productItems,
    required this.userInformation,
    required this.paid,
     required this.totalPayment,
     required this.billCode,
     });
}