import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/screens/user_information/bloc/user_infomation_bloc.dart';
import 'package:ecommerce_app_mobile/screens/user_information/edit_user_info/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserInfo extends StatefulWidget {
  const EditUserInfo({super.key});

  static String routeName = "/edit_user_info";

  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  final UserInformationBloc infoBloc = UserInformationBloc();
  @override
  void initState() {
    // infoBloc.add(UserInformationInitialEvent());
    infoBloc.add(UserInformationInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var profile =
        ModalRoute.of(context)?.settings.arguments as UserDataModel;
    return BlocConsumer<UserInformationBloc, UserInformationState>(
      bloc: infoBloc,
      listenWhen: (previous, current) => current is UserInformationActionState,
      buildWhen: (previous, current) => current is! UserInformationActionState,
      listener: (context, state) {
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case UserInformationLoading:
            return LoadingScreen();
          case UserInformationInitialState:
            return EditUserInfoBody(
              infoBloc: infoBloc,
              profile: profile,
            );
          case UserInformationError:
            final errorState = state as UserInformationError;
            return Center(child: Text(errorState.message));
          default:
            return const Center(child: Text('Edit Profile Default'));
        }
      },
    );
  }
}
