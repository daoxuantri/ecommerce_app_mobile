
import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_id_email/id_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/forget_password.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/reset_password/reset_pass.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/model/bloc_forgot.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
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
  void initState() {
    _forgetPasswordBloc.add(ForgetPasswordInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
      bloc: _forgetPasswordBloc,
      listenWhen: (previous, current) => current is ForgetPasswordActionState,
      buildWhen: (previous, current) => current is! ForgetPasswordActionState,
      listener: (context, state) {
        if (state is InputEmailToVerifyEmailState) {
           final ScreenArguments arguments = ScreenArguments(state.bloc, state.email);
            Navigator.of(context).pushNamed(IDEmail.routeName, arguments: arguments);
                
        }
        if (state is InputCheckEmaiState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginFail(state.message.toString()),
          );
        }else if (state is VerifyEmailToChangeOTPState){
          final ScreenArguments arguments = ScreenArguments(state.bloc, state.email);
          Navigator.of(context).pushNamed(ResetPassScreen.routeName, arguments: arguments);
        }
        else if ( state is VerifyEmailToChangePasswordState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginSuccess('Đổi mật khẩu thành công.'),
          );
          Navigator.of(context).pushNamed(LoginScreen.routeName);
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
                body: SizedBox(
                    width: getFullWidth(),
                    height: getFullHeight(),
                    child: FormEmailPass(
                      forgetPasswordBloc : _forgetPasswordBloc
                    )),
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