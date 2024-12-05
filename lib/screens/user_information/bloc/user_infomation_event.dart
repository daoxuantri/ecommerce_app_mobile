part of 'user_infomation_bloc.dart';

@immutable
abstract class UserInformationEvent {}

class UserInformationInitialEvent extends UserInformationEvent {}

class UserInformationToEditUserInfoScreenEvent extends UserInformationEvent {
  final UserDataModel  profile;
  UserInformationToEditUserInfoScreenEvent(this.profile);
}

class UserInformationToActivateEmailScreenEvent extends UserInformationEvent {}

class UserInfoGetListCityEvent extends UserInformationEvent {}

class UserInfoGetListDistrictEvent extends UserInformationEvent {
  final String cityId;

  UserInfoGetListDistrictEvent(this.cityId);
}

class UserInfoGetListWardEvent extends UserInformationEvent {
  final String districtId;

  UserInfoGetListWardEvent(this.districtId);
}

class UserInfoReturnDistrictAndWardListEvent extends UserInformationEvent {
  final String cityId;
  final String districtId;
  UserInfoReturnDistrictAndWardListEvent(this.cityId, this.districtId);
}

class UserInfoUpdateEvent extends UserInformationEvent {
  final UserDataModel profile;
  UserInfoUpdateEvent(this.profile);
}

