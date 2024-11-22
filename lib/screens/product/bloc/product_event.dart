part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {
  const ProductEvent();
}

class ProductInitialEvent extends ProductEvent {
  final String productId;
  const ProductInitialEvent({
    required this.productId,
  });
}

class ProductPostClickedEvent extends ProductEvent {
  final ProductDataModel product;
  ProductPostClickedEvent({
    required this.product,
  });
}

class ProductTab1ClickedEvent extends ProductEvent {}

class ProductTab2ClickedEvent extends ProductEvent {}

abstract class ProducSubtEvent extends ProductEvent {
  const ProducSubtEvent();
}

class ProductSubInitialEvent extends ProducSubtEvent {
  final String productId;
  const ProductSubInitialEvent({
    required this.productId,
  });
}

class ProductClickedFavoriteEvent extends ProducSubtEvent {
  final bool check;
  final String productId;
  const ProductClickedFavoriteEvent(
    this.check, {
    required this.productId,
  });
}

class CreateOrderEvent extends ProductEvent {
  final String demandId;
  final int productQuantity;
  final String transportMethod;
  final DateTime requireDeliveryTimeTo;

  CreateOrderEvent(
      {required this.demandId,
      required this.productQuantity,
      required this.transportMethod,
      required this.requireDeliveryTimeTo});
}

class InitialOrderEvent extends ProductEvent{
  
}