part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileInitialEvent extends ProfileEvent {}

class ProfileToUserInformationScreenEvent extends ProfileEvent {
  final UserDataModel  profile;
  ProfileToUserInformationScreenEvent(this.profile);
}

class ProfileToWalletScreenEvent extends ProfileEvent {}

class ProfileToMyOrdersScreenEvent extends ProfileEvent {}

class ProfileToAddressScreenEvent extends ProfileEvent {}

class ProfileToSettingScreenEvent extends ProfileEvent {}

class ProfileToFavouriteEvent extends ProfileEvent {}

