import 'package:meta/meta.dart';

@immutable
abstract class ChooseAddressEvent {}

class ChooseAddressInitialEvent extends ChooseAddressEvent {}

class ChooseAddressButtonClickEvent extends ChooseAddressEvent {
  final String addressCityId;
  final String addressDistrictId;
  final String addressWardId;
  final String addressCityName;
  final String addressDistrictName;
  final String addressWardName;

  ChooseAddressButtonClickEvent(
    this.addressCityId,
    this.addressDistrictId,
    this.addressWardId,
    this.addressCityName,
    this.addressDistrictName,
    this.addressWardName,
  );
}

class ChooseAddressCheckInputEvent extends ChooseAddressEvent {
  final int position;
  final List<int> checkErr;

  ChooseAddressCheckInputEvent(this.position, this.checkErr);
}

class ChooseAddressAfterSeclectedCityEvent extends ChooseAddressEvent {
  final String cityID;

  ChooseAddressAfterSeclectedCityEvent(this.cityID);
}

class ChooseAddressAfterSeclectedDistrictEvent extends ChooseAddressEvent {
  final String districtID;

  ChooseAddressAfterSeclectedDistrictEvent(this.districtID);
}

class ChooseAddressButtonClickErrorEvent extends ChooseAddressEvent {}
