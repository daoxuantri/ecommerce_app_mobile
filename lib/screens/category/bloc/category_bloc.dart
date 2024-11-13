import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/product_category.dart';
import 'package:ecommerce_app_mobile/model/product_category/product_category_data_model.dart';
import 'package:flutter/material.dart';
part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryInitialEvent>(categoryInitialEvent);
    on<CategoryErrorScreenToLoginEvent>(categoryErrorScreenToLoginEvent);
    on<CategoryProductClickedEvent>(categoryProductClickedEvent);
  }

  Future<FutureOr<void>> categoryInitialEvent(
      CategoryInitialEvent event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadingState());
    try {
      //get categories
      List<ProductCategoryDataModel> listCategories =
          await ApiServiceProductCategory().getListCategory();


        emit(CategoryLoadedSuccessState( categoriesPropose: listCategories!));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(CategoryErrorState(errorMessage: failToken));
    }
  }

  FutureOr<void> categoryErrorScreenToLoginEvent(
      CategoryErrorScreenToLoginEvent event, Emitter<CategoryState> emit) {
    emit(CategoryErrorScreenToLoginState());
  }

  FutureOr<void> categoryProductClickedEvent(
      CategoryProductClickedEvent event, Emitter<CategoryState> emit) {
    // emit(categoryProductClickedState(productId: event.productId));
  }

}
