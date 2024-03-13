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

class VerifyEmailToInputEmailEvent extends ForgetPasswordEvent{
  final String email;
  const VerifyEmailToInputEmailEvent({required this.email});

}

class VerifyEmailToChangeOTPEvent extends ForgetPasswordEvent{
  final ForgetPasswordBloc bloc ;
  final String email;
  final String code;
  const VerifyEmailToChangeOTPEvent(this.bloc, this.email,this.code);
}

class VerifyEmailToChangePasswordEvent extends ForgetPasswordEvent{
  final String email;
  final String password;
  const VerifyEmailToChangePasswordEvent(this.email,this.password);
}
