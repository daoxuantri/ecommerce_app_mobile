part of 'all_product_bloc.dart';

@immutable
abstract class AllProductState {}

abstract class AllProductActionState extends AllProductState {}

class AllProductInitialState extends AllProductState {}

class AllProductLoadingState extends  AllProductState {}

class AllProductLoadedState extends  AllProductState {
  final List<ProductDataModel> listAllProduct;
  final List<Map<String, List<dynamic>>> filter;

  AllProductLoadedState({required this.listAllProduct, required this.filter});
}

class AllProductErrorState extends  AllProductState {
  final String message;

  AllProductErrorState(this.message);
}

class AllProductClickedState extends AllProductActionState {
  final String productId;
  AllProductClickedState({
    required this.productId,
  });
}

class ProductClickedUnFavoriteState extends AllProductActionState {
  ProductClickedUnFavoriteState();}

class AllProductSearchState extends  AllProductActionState {
  final List<ProductDataModel> matchQuery;

  AllProductSearchState({required this.matchQuery});
}



