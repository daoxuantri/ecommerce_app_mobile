part of 'forget_password_bloc.dart';
@immutable
abstract class ForgetPasswordEvent {
  const ForgetPasswordEvent();
}

class ForgetPasswordInitialEvent extends ForgetPasswordEvent {}

class ForgetPasswordToInputEmailEvent extends ForgetPasswordEvent{
  final ForgetPasswordBloc bloc;
  const ForgetPasswordToInputEmailEvent(this.bloc);
}

class ForgetPasswordToInputPhoneEvent extends ForgetPasswordEvent{}

class InputEmailToVerifyEmailEvent extends ForgetPasswordEvent{
  final ForgetPasswordBloc bloc;
  final String email;
  const InputEmailToVerifyEmailEvent(this.bloc, this.email);
}

class VerifyEmailToInputEmailEvent extends ForgetPasswordEvent{}

class VerifyEmailToChangePasswordEvent extends ForgetPasswordEvent{
  final String email;
  final String password;
  final String code;
  const VerifyEmailToChangePasswordEvent(this.email, this.password, this.code);
}
