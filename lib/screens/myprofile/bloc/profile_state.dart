part of 'profile_bloc.dart';


@immutable
abstract class ProfileState {}

abstract class ProfileActionState extends ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserDataModel profile;

  ProfileLoaded(this.profile);


}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

class ProfileToUserInformationScreenState extends ProfileActionState {
  final UserDataModel profile;
  ProfileToUserInformationScreenState(this.profile);
}

class ProfileToWalletScreenState extends ProfileActionState {}

class ProfileToMyOrdersScreenState extends ProfileActionState {}

class ProfileToAddressScreenActionState extends ProfileActionState {}

class ProfileToSettingScreenActionState extends ProfileActionState {}

class ProfileToFavouriteActionState extends ProfileActionState {}
