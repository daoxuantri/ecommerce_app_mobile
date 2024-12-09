import 'package:ecommerce_app_mobile/model/address/shipping/address_data_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddressState {}

abstract class AddressActionState extends AddressState{}

class AddressInitialState extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<AddressDataModel> listAddressInf;
  final bool isvisible;

  AddressLoaded({required this.listAddressInf, required this.isvisible});
}

class AddressError extends AddressState {
  final String errMessage;

  AddressError({required this.errMessage});
}

class AddressButtonClickState extends AddressActionState{}


class AddressRemoveClickState extends AddressActionState{
  final String errMessage;
  AddressRemoveClickState({required this.errMessage});
}

