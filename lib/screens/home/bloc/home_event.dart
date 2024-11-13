part of 'home_bloc.dart';


@immutable
abstract class HomeEvent{
  const HomeEvent();
}

class HomeInitialEvent extends HomeEvent {}

class HomeErrorScreenToLoginEvent extends HomeEvent {}

class HomeProductClickedEvent extends HomeEvent {
  final String productId;
  const HomeProductClickedEvent({
    required this.productId,
  });
}
