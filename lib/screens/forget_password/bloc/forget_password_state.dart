part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState {}

abstract class ForgetPasswordActionState extends ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordLoadedSuccessState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordErrorState({
    required this.errorMessage,
  });
}

class ForgetPasswordToInputEmailState extends ForgetPasswordActionState{
  final ForgetPasswordBloc bloc;
  ForgetPasswordToInputEmailState(this.bloc);
}

class ForgetPasswordToInputPhoneState extends ForgetPasswordActionState{}

class InputEmailToVerifyEmailState extends ForgetPasswordActionState{
  final ForgetPasswordBloc bloc;
  final String email;
  InputEmailToVerifyEmailState(this.bloc, this.email);
}

class VerifyEmailToChangePasswordState extends ForgetPasswordActionState{}

class VerifyEmailToInputEmailState extends ForgetPasswordActionState{}