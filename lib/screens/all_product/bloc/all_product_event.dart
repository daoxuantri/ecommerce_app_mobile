part of 'all_product_bloc.dart';

@immutable
abstract class AllProductEvent {
  const AllProductEvent();
}

class AllProductInitialEvent extends AllProductEvent {}

class HeartButtonClickedEvent extends AllProductEvent{}

class AllProductClickedEvent extends AllProductEvent {
  final String productId;
  const AllProductClickedEvent({
    required this.productId,
  });
}

class ProductClickedUnFavoriteEvent extends AllProductEvent {
  final String productId;
  const ProductClickedUnFavoriteEvent({
    required this.productId,
  });
}

class AllProductSearchEvent extends AllProductEvent{
  final String? query;
  final List<ProductDataModel> listAllProduct;

  AllProductSearchEvent({required this.listAllProduct, required this.query});
}


class AllProductFilterEvent extends AllProductEvent{
  final String title;
  final String query;
  final List<ProductDataModel> listAllProduct;

  AllProductFilterEvent({required this.listAllProduct, required this.title, required this.query});
}
