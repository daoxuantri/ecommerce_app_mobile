import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/screens/address/address_screen.dart';
import 'package:ecommerce_app_mobile/screens/myprofile/bloc/profile_bloc.dart';
import 'package:ecommerce_app_mobile/screens/myprofile/logged_in/components/body_success.dart';
import 'package:ecommerce_app_mobile/screens/user_information/edit_user_info/edit_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileScreen extends StatefulWidget {
    static String routeName ="/my_profile";
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc.add(ProfileInitialEvent());

  }
  final ProfileBloc profileBloc = ProfileBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listenWhen: (previous, current) => current is ProfileActionState,
      buildWhen: (previous, current) => current is! ProfileActionState,
       listener: (context, state) => {
          if (state is ProfileToUserInformationScreenState){
            Navigator.pushNamed(context, EditUserInfo.routeName,
              arguments: state.profile)
          }else if (state is ProfileToAddressScreenActionState){
            Navigator.pushNamed(context, AddressScreen.routeName)
          }

       },
       builder: (context, state) {
        switch(state.runtimeType) {
          case ProfileLoading:
            return const LoadingScreen();
          case ProfileLoaded:
            final loadedState = state as ProfileLoaded;
            return  BodySuccess(profile: loadedState.profile, profileBloc: profileBloc,);
          case ProfileError:
            final errorState = state as ProfileError;
            return Center(child: Text(errorState.message));
          default:
            return const Center(child: Text('Profile Default'));
        }
      },);
  }
}
