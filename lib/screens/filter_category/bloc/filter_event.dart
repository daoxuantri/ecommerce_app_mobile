part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {
  const FilterEvent();
}

class FilterInitialEvent extends FilterEvent {
  final String categoryId; // ID danh mục để tải bộ lọc
  const FilterInitialEvent({
    required this.categoryId,
  });
}

class FilterErrorScreenToHomeEvent extends FilterEvent {
  const FilterErrorScreenToHomeEvent(); // Quay lại màn hình chính khi có lỗi
}

class FilterAppliedEvent extends FilterEvent {
  final Map<String, dynamic> appliedFilters; // Bộ lọc được áp dụng
  const FilterAppliedEvent({
    required this.appliedFilters,
  });
}
class FilterClickProductDetailEvent extends FilterEvent {
  final String productId; // Bộ lọc được áp dụng
  const FilterClickProductDetailEvent({
    required this.productId,
  });
} 