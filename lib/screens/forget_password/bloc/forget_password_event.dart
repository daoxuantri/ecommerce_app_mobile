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

  const InputEmailToVerifyEmailEvent(this.bloc);
}

class VerifyEmailToInputEmailEvent extends ForgetPasswordEvent{
  final String email;
  const VerifyEmailToInputEmailEvent({required this.email});

}

class VerifyEmailToChangePasswordEvent extends ForgetPasswordEvent{
  final String email;
  final String code;
  const VerifyEmailToChangePasswordEvent(this.email,this.code);
}

class VerifyEmailToChangeOTPEvent extends ForgetPasswordEvent{
  final String email;
  final String code;
  const VerifyEmailToChangeOTPEvent(this.email,this.code);
}
