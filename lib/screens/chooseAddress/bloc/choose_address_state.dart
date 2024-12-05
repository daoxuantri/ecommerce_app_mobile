import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:meta/meta.dart';


@immutable
abstract class ChooseAddressState {}

abstract class ChooseAddressActionState extends ChooseAddressState{}

class ChooseAddressInitial extends ChooseAddressState {}

class ChooseAddressLoading extends ChooseAddressState {}

class ChooseAddressLoaded extends ChooseAddressState {
  final List<CitiData> listCity;

  ChooseAddressLoaded({required this.listCity});
}

class ChooseAddressError extends ChooseAddressState {
  final String errMessage;

  ChooseAddressError({required this.errMessage,} );
}

class ChooseAddressButtonClickActionState extends ChooseAddressActionState{
  final List<String> listAddress;

  ChooseAddressButtonClickActionState({required this.listAddress});
}

class ChooseAddressCheckInputActionState extends ChooseAddressActionState{
  final List<int> err;

  ChooseAddressCheckInputActionState(this.err);
}

class ChooseAddressAfterSelectedCityState extends ChooseAddressActionState{
  final List<DistrictData> listDistrict;

  ChooseAddressAfterSelectedCityState({required this.listDistrict});
}

class ChooseAddressAfterSelectedDistrictState extends ChooseAddressActionState{
  final List<WardData> listWard;

  ChooseAddressAfterSelectedDistrictState({required this.listWard});
}

class ChooseAddressButtonClickErrorActionState extends ChooseAddressActionState{}

