import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {}

class SearchInitialEvent extends SearchEvent{
  final String keyword;
  SearchInitialEvent ({
    required this.keyword
  });
}

class DetailProductClickedEvent extends SearchEvent{
  final String? productId;
  DetailProductClickedEvent ({
     this.productId
  });
}

