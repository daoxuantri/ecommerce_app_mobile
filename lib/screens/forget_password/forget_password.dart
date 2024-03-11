
import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/bloc/forget_password_bloc.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/email_password/form_id_email/id_email.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/components/forget_password.dart';
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
            Navigator.of(context)
                .pushNamed(IDEmail.routeName, arguments: state.email);
        }
        if (state is InputCheckEmaiState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginFail(state.message.toString()),
          );
        }
        if (state is VerifyEmailToChangeOTPState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginFail(state.message.toString()),
          );
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