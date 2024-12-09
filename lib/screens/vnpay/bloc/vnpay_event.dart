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

class VNPayTransactionSuccessEvent extends VNPayEvent {}