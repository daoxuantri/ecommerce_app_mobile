import 'package:ecommerce_app_mobile/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components_buttons/loading.dart';
import '../../size_config.dart';

class ForgetPassWordScreen extends StatefulWidget {

  static String routeName = "/forgetpassword";
  const ForgetPassWordScreen({super.key});

  @override
  State<ForgetPassWordScreen> createState() => _ForgetPassWordScreenState();
}

class _ForgetPassWordScreenState extends State<ForgetPassWordScreen> {
  final ForgetPasswordBloc _forgetPasswordBloc = ForgetPasswordBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      bloc: _forgetPasswordBloc,
      listenWhen: (previous, current) => current is ForgetPasswordActionState,
      buildWhen: (previous, current) => current is! ForgetPasswordActionState,
      listener: (context, state) {
        /*  if (state is ForgetPasswordToInputEmailState) {
        updateScreen(Screens.inputEmail);
      } else if (state is ForgetPasswordToInputPhoneState) {
        updateScreen(Screens.inputPhone);
      } else if (state is InputEmailToVerifyEmailState) {
        updateScreen(Screens.verifyEmail);
      } else if (state is VerifyEmailToChangePasswordState) {
        updateScreen(Screens.changePassword);
      } else if (state is VerifyEmailToInputEmailState) {
        updateScreen(Screens.inputEmail);
      }*/

        if (state is ForgetPasswordToInputEmailState) {
          // Navigator.of(context)
          //     .pushNamed(FormEmailPass.routeName, arguments: state.bloc);
        } else {
          if (state is InputEmailToVerifyEmailState) {
            // Navigator.of(context)
            //     .pushNamed(IDEmail.routeName, arguments: state.email);
          }
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ForgetPasswordLoadingState:
            return const Center(
              child: LoadingScreen(),
            );
          case ForgetPasswordLoadedSuccessState:
            return SizedBox(
              width: getFullWidth(),
              height: getFullHeight(),
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  title: const Text(
                    textAlign: TextAlign.center,
                    'Quên mật khẩu',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                // body: SizedBox(
                //     width: getFullWidth(),
                //     height: getFullHeight(),
                //     child: ForgetPassWordForm(
                //       forgetPasswordBloc: _forgetPasswordBloc,
                //     )),
              ),
            );
          case ForgetPasswordErrorState:
            final errorState = state as ForgetPasswordErrorState;
            return Scaffold(
              body: Center(child: Text(errorState.errorMessage)),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}