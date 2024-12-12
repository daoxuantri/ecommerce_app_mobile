import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/filter.dart';
import 'package:ecommerce_app_mobile/model/filters/product_filter_data_model.dart';
import 'package:ecommerce_app_mobile/screens/search/bloc/search_event.dart';
import 'package:ecommerce_app_mobile/screens/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
    on<DetailProductClickedEvent>(detailProductClickedEvent);
  }

  Future<FutureOr<void>> searchInitialEvent(
    SearchInitialEvent event, Emitter<SearchState> emit) async {
  emit(SearchLoading());
  try {
    List<ProductsFilterDataModel>? filterProduct = await ApiServiceFilters().getAllProductFilter(event.keyword!); 
    emit(SearchLoaded(listProducts: filterProduct!));
  } catch (e) {
    String failToken = e.toString();
    if (failToken.startsWith('Exception: ')) {
      failToken = failToken.substring('Exception: '.length);
    }
    emit(SearchError(errMessage: failToken));
  }
}

Future<FutureOr<void>> detailProductClickedEvent(
    DetailProductClickedEvent event, Emitter<SearchState> emit) async {
  emit(SearchLoading());
  try {
    
    emit(DetailProductClickedState(productId : event.productId!));
  } catch (e) {
    String failToken = e.toString();
    if (failToken.startsWith('Exception: ')) {
      failToken = failToken.substring('Exception: '.length);
    }
    emit(SearchError(errMessage: failToken));
  }
}
}
