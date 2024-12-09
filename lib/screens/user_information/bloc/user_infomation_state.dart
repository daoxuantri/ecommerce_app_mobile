part of 'user_infomation_bloc.dart';

@immutable
abstract class UserInformationState {}

abstract class UserInformationActionState extends UserInformationState {}



class UserInformationInitialState extends UserInformationState {
  final UserDataModel  profile;
  UserInformationInitialState(this.profile);
}
class UserInformationInitial extends UserInformationState {}

class UserInformationLoading extends UserInformationState {}

class UserInformationLoaded extends UserInformationState {
  final UserDataModel  profile;
  UserInformationLoaded(this.profile);
}

class UserInformationError extends UserInformationActionState {
  final String message;
  UserInformationError(this.message);
}

class UserInformationErrorActionState extends UserInformationActionState {
  final String message;
  UserInformationErrorActionState(this.message);
}

class UserInfoGetListCityState extends UserInformationState{
  // final List<CitiData> cityList;
  // UserInfoGetListCityState(this.cityList);
}

class UserInfoReturnListDistrictActionState extends UserInformationActionState{
  // final List<DistrictData> districtList;
  // UserInfoReturnListDistrictActionState(this.districtList);
}

class UserInfoReturnListWardActionState extends UserInformationActionState{
  // final List<WardData> wardList;
  // UserInfoReturnListWardActionState(this.wardList);
}

class UserInfoReturnDistrictAndWardListActionState extends UserInformationActionState {
  // final List<DistrictData> districtList;
  // final List<WardData> wardList;
  // UserInfoReturnDistrictAndWardListActionState(this.districtList, this.wardList);
}

class UserInformationToEditUserInfoScreenActionState extends UserInformationActionState {
  final UserDataModel  profile;
  UserInformationToEditUserInfoScreenActionState(this.profile);
}

class UserInformationToActivateEmailScreenActionState extends UserInformationActionState {}

class UserInfoUpdateSuccessActionState extends UserInformationActionState {}

class ResetPassEventClickState extends UserInformationActionState {}