import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/category.dart';
import 'package:ecommerce_app_mobile/api/product_category.dart';
import 'package:ecommerce_app_mobile/model/product_category/detail_product_cate/product_cate_data_model.dart';
import 'package:flutter/material.dart';
part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterInitialEvent>(filterInitialEvent);
    on<FilterClickProductDetailEvent>(filterClickProductDetailEvent);
    // on<FilterResetEvent>(filterResetEvent);
  }

  FutureOr<void> filterInitialEvent(
      FilterInitialEvent event, Emitter<FilterState> emit) async {
    emit(FilterLoadingState());
    try {
      // Gọi API để lấy danh sách filter
      List<ProductCateDataModel> listFilters =
          await ApiServiceProductCategory().getListProductByCategory(event.categoryId);
          bool isvisible;
           if(listFilters.length ==0 )
        {
          isvisible = true ;
        }else{
          isvisible = false;
        }
      emit(FilterLoadedSuccessState(filtersProduct: listFilters!, isvisible: isvisible));
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring('Exception: '.length);
      }
      emit(FilterErrorState(errorMessage: errorMessage));
    }
  }

  FutureOr<void> filterClickProductDetailEvent(
      FilterClickProductDetailEvent event, Emitter<FilterState> emit) {
    emit(FilterClickProductDetailState(productId: event.productId));
  }

  // FutureOr<void> filterResetEvent(
  //     FilterResetEvent event, Emitter<FilterState> emit) {
  //   emit(FilterResetState());
  // }
}