import 'package:meta/meta.dart';

@immutable
abstract class AddAddressEvent {}

class AddAddressInitialEvent extends AddAddressEvent {}

class AddAddressButtonClickEvent extends AddAddressEvent {
  final String name;
  final String phone;
  final String address;
  final bool status;

  AddAddressButtonClickEvent(
      this.name,
      this.phone,
      this.address,
      this.status);
}

class AddAddressCheckInputEvent extends AddAddressEvent {
  final int position;
  final List<int> checkErr;

  AddAddressCheckInputEvent(this.position, this.checkErr);
}

class AddAddressAfterSeclectedCityEvent extends AddAddressEvent {
  final String cityID;

  AddAddressAfterSeclectedCityEvent(this.cityID);
}

class AddAddressAfterSeclectedDistrictEvent extends AddAddressEvent {
  final String districtID;

  AddAddressAfterSeclectedDistrictEvent(this.districtID);
}

class AddAddressButtonClickErrorEvent extends AddAddressEvent {}

class ChooseAddressEvent extends AddAddressEvent {}
