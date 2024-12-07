part of 'vnpay_bloc.dart';

@immutable
abstract class VNPayState {
  const VNPayState();
}

abstract class VNPayActionState extends VNPayState {}

class VNPayInitial extends VNPayState {}

class VNPayLoadingState extends VNPayState {}

class VNPayLoadedSuccessState extends VNPayState {
  final String? url;

  const VNPayLoadedSuccessState({required this.url});
}

class VNPayErrorState extends VNPayState {
  final String errorMessage;

  const VNPayErrorState({required this.errorMessage});
}

// Nếu bạn có các hành động khác, bạn có thể thêm chúng ở đây
// class VNPayPostClickedActionState extends VNPayActionState {
//   final ProductDataModel product;

//   VNPayPostClickedActionState({
//     required this.product,
//   });
// }