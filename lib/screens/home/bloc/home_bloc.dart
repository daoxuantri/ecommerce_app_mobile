import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/products.dart';
import 'package:ecommerce_app_mobile/model/home/banners/banners.dart';
import 'package:ecommerce_app_mobile/model/home/categories/categories.dart';
import 'package:ecommerce_app_mobile/model/home/data_respone_home.dart';
import 'package:ecommerce_app_mobile/model/home/products/products.dart';
import 'package:ecommerce_app_mobile/model/home/ratings/rating_product.dart';
import 'package:meta/meta.dart';


part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeErrorScreenToLoginEvent>(homeErrorScreenToLoginEvent);
    on<HomeProductClickedEvent>(homeProductClickedEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      // get home
      Data dataHomes = await ApiServiceProducts().getAllProduct();
      //get children (home) -> banner
      List<BannerDataModel>? banners = dataHomes.banners;

      //get children(home) -> product for category
      List<CategoriesDataModelRespone>? dataCategory = dataHomes.categories;

      //get children (home) -> rating
      List<RatingProductDataModel>? ratingProducts = dataHomes.ratingProducts;
      

      



      emit(HomeLoadedSuccessState(bannersPropose: banners! , categoriesPropose: dataCategory! , ratingPropose : ratingProducts!));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(HomeErrorState(errorMessage: failToken));
    }
  }

  FutureOr<void> homeErrorScreenToLoginEvent(
      HomeErrorScreenToLoginEvent event, Emitter<HomeState> emit) {
    emit(HomeErrorScreenToLoginState());
  }

  FutureOr<void> homeProductClickedEvent(
      HomeProductClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeProductClickedState(productId: event.productId));
  }

}
