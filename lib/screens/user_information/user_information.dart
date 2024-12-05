import 'package:ecommerce_app_mobile/screens/user_information/bloc/user_infomation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInformationScreen extends StatelessWidget {
  static String routeName = "/userinformation";

  UserInformationScreen({super.key});

  final UserInformationBloc userBloc = UserInformationBloc();

  @override
  Widget build(BuildContext context) {
    String email = "";
    userBloc.add(UserInformationInitialEvent());

    Scaffold _buildBody(
        BuildContext context, UserInformationLoaded loadedState) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 60,
            backgroundColor: const Color(0xff1E40AF),
            title: const Text(
              "Thông tin cửa hàng",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              PopupMenuButton(
                color: Colors.white,
                onSelected: (value) {
                  switch (value) {
                    case 'edit':
                      userBloc.add(UserInformationToEditUserInfoScreenEvent(
                          loadedState.profile));
                      break;
                    case 'email':
                      // email = loadedState.profile.emailAddress!;
                      userBloc.add(UserInformationToActivateEmailScreenEvent());
                      break;
                    default:
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Cập nhật thông tin'),
                  ),
                  const PopupMenuItem(
                    value: 'email',
                    child: Text('Kích hoạt email'),
                  ),
                ],
              )
            ],
          ),
          // body: VendorInfoBody(profile: loadedState.profile));
          body: Text('chua lam'));
    }

    return BlocConsumer<UserInformationBloc, UserInformationState>(
      bloc: userBloc,
      listenWhen: (previous, current) => current is UserInformationActionState,
      buildWhen: (previous, current) => current is! UserInformationActionState,
      listener: (context, state) {
        if (state is UserInformationToEditUserInfoScreenActionState) {
          // Navigator.pushNamed(context, EditVendorInfo.routeName,
          //     arguments: state.profile);
        } else if (state is UserInformationToActivateEmailScreenActionState) {

          
          // ! Phần này đợi có API xác thực Email

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 1),
              content: Text("Mã xác thực đã được gửi đến $email")));
          // Navigator.pushNamed(context, FormValidateEmail.routeName, arguments: email);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case UserInformationLoading:
            return const Center(child: CircularProgressIndicator());
          case UserInformationLoaded:
            final loadedState = state as UserInformationLoaded;
            return _buildBody(context, loadedState);
          case UserInformationError:
            final errorState = state as UserInformationError;
            return Center(child: Text(errorState.message));
          default:
            return const Center(child: Text('Profile Default'));
        }
      },
    );
  }
}
