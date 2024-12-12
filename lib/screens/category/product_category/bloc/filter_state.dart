part of 'filter_bloc.dart';

@immutable
abstract class FilterState {
  const FilterState();
}

abstract class FilterActionState extends FilterState {}

class FilterInitial extends FilterState {}

class FilterLoadingState extends FilterState {}

class FilterLoadedSuccessState extends FilterState {
  final List<ProductCateDataModel> filtersProduct; // Danh sách các bộ lọc được tải
  final bool isvisible ;
  FilterLoadedSuccessState({
    required this.filtersProduct,
     required this.isvisible,
  });
}

class FilterErrorState extends FilterState {
  final String errorMessage; // Thông báo lỗi
  const FilterErrorState({
    required this.errorMessage,
  });
}

class FilterErrorScreenToHomeState extends FilterActionState {}

class FilterClickProductDetailState extends FilterActionState {
  final String productId; 
  FilterClickProductDetailState({
    required this.productId,
  });
}