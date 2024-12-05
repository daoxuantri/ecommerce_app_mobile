
import 'package:ecommerce_app_mobile/model/address/address/get_cities_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_districts_response.dart';
import 'package:ecommerce_app_mobile/model/address/address/get_wards_response.dart';
import 'package:ecommerce_app_mobile/model/address/shipping/shipping_address_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddAddressState {}

abstract class AddAddressActionState extends AddAddressState {}

class AddAddressInitial extends AddAddressState {}

class AddAddressLoading extends AddAddressState {}

class AddAddressLoaded extends AddAddressState {
  final List<CitiData> listCity ;
  AddAddressLoaded({required this.listCity});

}

class AddAddressError extends AddAddressState {
  final String errMessage;

  AddAddressError({required this.errMessage,} );
}

class AddAddressButtonClickActionState extends AddAddressActionState{
  final Map<String,UserShippingAddressData> addressInf;

  AddAddressButtonClickActionState({required this.addressInf});
}

class AddAddressCheckInputActionState extends AddAddressActionState{
  final List<int> err;

  AddAddressCheckInputActionState(this.err);
}

class AddAddressAfterSelectedCityState extends AddAddressActionState{
  final List<DistrictData> listDistrict;

  AddAddressAfterSelectedCityState({required this.listDistrict});
}

class AddAddressAfterSelectedDistrictState extends AddAddressActionState{
  final List<WardData> listWard;

  AddAddressAfterSelectedDistrictState({required this.listWard});
}

class AddAddressButtonClickErrorActionState extends AddAddressActionState{}

class ChooseAddressActionState extends AddAddressActionState{}
