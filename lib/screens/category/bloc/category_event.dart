part of 'category_bloc.dart';


@immutable
abstract class CategoryEvent{
  const CategoryEvent();
}

class CategoryInitialEvent extends CategoryEvent {}

class CategoryErrorScreenToLoginEvent extends CategoryEvent {}

class CategoryProductClickedEvent extends CategoryEvent {
  final String categoryId;
  const CategoryProductClickedEvent({
    required this.categoryId,
  });
}
