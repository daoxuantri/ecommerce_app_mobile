import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/product_category.dart';
import 'package:ecommerce_app_mobile/api/products.dart';
import 'package:ecommerce_app_mobile/model/product_category/product_category_data_model.dart';
import 'package:ecommerce_app_mobile/model/products/product_data_model.dart';
import 'package:flutter/material.dart'; 

part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  AllProductBloc() : super(AllProductInitialState()) {
    on<AllProductInitialEvent>(allProductInitialEvent);
    on<AllProductClickedEvent>(allProductClickedEvent);
    on<ProductClickedUnFavoriteEvent>(productClickedUnFavoriteEvent);
    on<AllProductSearchEvent>(allProductSearchEvent);
    on<AllProductFilterEvent>(allProductFilterEvent);
  }

  Future<FutureOr<void>> allProductInitialEvent(
      AllProductInitialEvent event, Emitter<AllProductState> emit) async {
    emit(AllProductLoadingState());
    try {
      // //get all product
      // List<ProductDataModel> listProductResponse =
      //     await ApiServiceProducts().getAllProduct();

      // List<ProductDataModel> listProduct = [];
      // for (var product in listProductResponse) {
      //   listProduct.add(product);
      // }

      //get list categories
      // List<ProductCategoryDataModel> listCategories =
      //     await ApiServiceProductCategory().getListCategory();

      // //create filter
      // List<Map<String, List<dynamic>>> filter = [
      //   {'Sản phẩm': listProduct},
      //   {'Danh mục': listCategories},
      // ];
      // emit(AllProductLoadedState(
      //     listAllProduct: listProductResponse, filter: filter));
    } catch (e) {
      emit(AllProductErrorState(e.toString()));
    }
  }

  FutureOr<void> allProductClickedEvent(
      AllProductClickedEvent event, Emitter<AllProductState> emit) {
    try {
      emit(AllProductClickedState(productId: event.productId));
    } catch (e) {
      emit(AllProductErrorState(e.toString()));
    }
  }

  FutureOr<void> allProductSearchEvent(
      AllProductSearchEvent event, Emitter<AllProductState> emit) {
    List<ProductDataModel> matchQuery = [];
    if (event.query == '') {
      matchQuery = [];
    } else {
      for (var item in event.listAllProduct) {
        if (item.name
            .toString()
            .toLowerCase()
            .contains(event.query!.toLowerCase())) {
          matchQuery.add(item);
        }
      }
    }
    emit(AllProductSearchState(matchQuery: matchQuery));
  }

  FutureOr<void> allProductFilterEvent(
      AllProductFilterEvent event, Emitter<AllProductState> emit) {
    try{
      print(event.query);
      List<ProductDataModel> matchQuery = [];
      if (event.title == 'Màu sắc') {
        print("A");
        for (var item in event.listAllProduct) {
          // if (item.productColorName
          //     .toString()
          //     .toLowerCase() == event.query!.toLowerCase()) {
          //   matchQuery.add(item);
          // }
        }
        matchQuery.forEach((element) {
          print(element.name);
        });
      } else if (event.title == 'Xuất xứ') {
        print("B");
        // for (var item in event.listAllProduct) {
        //   if (item.countryId
        //       .toString()
        //       .toLowerCase() == event.query!.toLowerCase()) {
        //     matchQuery.add(item);
        //   }
        // }
      } else{
        print("C");
        for (var item in event.listAllProduct) {
          // if (item.categoryName
          //     .toString()
          //     .toLowerCase() == event.query!.toLowerCase()) {
          //   matchQuery.add(item);
          // }
        }
      }

      emit(AllProductSearchState(matchQuery: matchQuery));
    }
    catch(e){
      emit(AllProductErrorState(e.toString()));
    }
  }
}

Future<FutureOr<void>> productClickedUnFavoriteEvent(
    ProductClickedUnFavoriteEvent event, Emitter<AllProductState> emit) async {
  try {
    // await ApiServiceProducts().unsubscribeProduct(event.productId);
    print('ProductClickedUnFavoriteState');
    emit(ProductClickedUnFavoriteState());
  } catch (e) {
    emit(AllProductErrorState(e.toString()));
  }
}
