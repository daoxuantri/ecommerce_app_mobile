import 'package:ecommerce_app_mobile/components_buttons/loading.dart';
import 'package:ecommerce_app_mobile/screens/login_register/login/login_screen.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/bloc/sign_up_bloc.dart';
import 'package:ecommerce_app_mobile/screens/login_register/register/components/body.dart';
import 'package:ecommerce_app_mobile/size_config.dart';
import 'package:ecommerce_app_mobile/components_buttons/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpBloc signUpBloc = SignUpBloc();
    signUpBloc.add(SignUpInitialEvent());
    return BlocConsumer<SignUpBloc, SignUpState>(
      bloc: signUpBloc,
      listenWhen: (previous, current) => current is SignUpActionState,
      buildWhen: (previous, current) => current is! SignUpActionState,
      listener: (context, state) {
        if (state is SignUpClickedSuccessActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginSuccess('Đăng ký thành công'),
          );
          Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
        }
        else if (state is SignUpClickedErrorActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarLoginFail(state.message.toString()),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case SignUpLoadingState:
            return const Center(
              child: LoadingScreen(),
            );
          case SignUpLoadedSuccessState:
            return Scaffold(
              body: Container(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Body(signUpBloc: signUpBloc,),
              ),
            );
          case SignUpErrorState:
            final errorState = state as SignUpErrorState;
            return Scaffold(
              body: Center(
                child: Text(
                  errorState.message,
                  textScaleFactor: 1,
                ),
              ),
            
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}



