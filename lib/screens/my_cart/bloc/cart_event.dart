part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {
  const CartEvent();
}

class CartInitialEvent extends CartEvent {
  final String userId ; 
  const CartInitialEvent({
    required this.userId,
  });
}

class CartErrorScreenToLoginEvent extends CartEvent {}

class CartProductClickedEvent extends CartEvent {
  final String productId;
  const CartProductClickedEvent({
    required this.productId,
  });
}

//remove all event 
class RemoveAllProductClickedEvent extends CartEvent {
  final String? userId;
  RemoveAllProductClickedEvent({
    required this.userId,
  });
}

//remove product id
class RemoveProductClickedEvent extends CartEvent {
  final String? productId;
  RemoveProductClickedEvent({
    required this.productId,
  });
}

class UpdateProductQuantityEvent extends CartEvent {
  final String? productId;
  final int newQuantity;
  final String? memory;
  final String? color;
  UpdateProductQuantityEvent({
    required this.productId,
    required this.newQuantity,
    this.memory,this.color,
  });
}
