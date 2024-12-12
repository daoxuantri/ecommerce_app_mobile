 
 
import 'package:ecommerce_app_mobile/model/filters/product_filter_data_model.dart';
import 'package:meta/meta.dart';


@immutable
abstract class SearchState {}

abstract class SearchActionState extends SearchState{}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ProductsFilterDataModel>? listProducts;

  SearchLoaded({ this.listProducts});
}

class SearchError extends SearchState {
  final String errMessage;

  SearchError({required this.errMessage,} );
}

class SearchClickedLoaded extends SearchActionState {
  final List<ProductsFilterDataModel> listProducts;

  SearchClickedLoaded({ required this.listProducts});
}
class DetailProductClickedState extends SearchActionState {
  final String productId;

  DetailProductClickedState({ required this.productId});
}