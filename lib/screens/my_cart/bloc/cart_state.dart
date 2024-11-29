part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  const CartState();
}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedSuccessState extends CartState {
  final MyCartDataModel mycart ;
  final List<ProductItemModel>? listproduct;
  CartLoadedSuccessState({
    required this.mycart,
    required this.listproduct,
  });
}

class CartErrorState extends CartState {
  final String errorMessage;
  const CartErrorState({
    required this.errorMessage,
  });
}

class CartErrorScreenToLoginState extends CartActionState {}

class CartProductClickedState extends CartActionState {
  final String productId;
  CartProductClickedState({
    required this.productId,
  });
}

class RemoveAllProductClickedState extends CartActionState {
  final String message;
  RemoveAllProductClickedState({
    required this.message,
  });
}

class RemoveProductClickedState extends CartActionState {
  final String message;
  RemoveProductClickedState({
    required this.message,
  });
}
class UpdateProductQuantityState extends CartActionState {
  final String message;
  UpdateProductQuantityState({
    required this.message,
  });
}
