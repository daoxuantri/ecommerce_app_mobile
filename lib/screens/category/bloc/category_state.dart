
part of 'category_bloc.dart';
@immutable
abstract class CategoryState{
  const CategoryState();
}

abstract class CategoryActionState extends CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedSuccessState extends CategoryState {
 
  List<ProductCategoryDataModel> categoriesPropose;
  CategoryLoadedSuccessState({
    required this.categoriesPropose,
  });
}

class CategoryErrorState extends CategoryState {
  final String errorMessage;
  const CategoryErrorState({
    required this.errorMessage,
  });
}

class CategoryErrorScreenToLoginState extends CategoryActionState {}

class CategoryProductClickedState extends CategoryActionState {
  final String categoryId;
  CategoryProductClickedState({
    required this.categoryId,
  });
}

