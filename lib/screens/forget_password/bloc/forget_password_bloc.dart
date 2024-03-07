import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../api/account.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordInitialEvent>(forgetPasswordInitialEvent);
    on<ForgetPasswordToInputEmailEvent>(forgetPasswordToInputEmailEvent);
    on<ForgetPasswordToInputPhoneEvent>(forgetPasswordToInputPhoneEvent);
    on<InputEmailToVerifyEmailEvent>(inputEmailToVerifyEmailEvent);
    on<VerifyEmailToChangePasswordEvent>(verifyEmailToChangePasswordEvent);
    on<VerifyEmailToInputEmailEvent>(verifyEmailToInputEmailEvent);
  }

  FutureOr<void> forgetPasswordInitialEvent(
      ForgetPasswordInitialEvent event, Emitter<ForgetPasswordState> emit) {
    emit(ForgetPasswordLoadingState());
    try {
      emit(ForgetPasswordLoadedSuccessState());
    } catch (e) {
      emit(ForgetPasswordErrorState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> forgetPasswordToInputEmailEvent(
      ForgetPasswordToInputEmailEvent event,
      Emitter<ForgetPasswordState> emit) {
    emit(ForgetPasswordToInputEmailState(event.bloc));
  }

  FutureOr<void> forgetPasswordToInputPhoneEvent(
      ForgetPasswordToInputPhoneEvent event,
      Emitter<ForgetPasswordState> emit) {
    emit(ForgetPasswordToInputPhoneState());
  }

  FutureOr<void> inputEmailToVerifyEmailEvent(
      InputEmailToVerifyEmailEvent event, Emitter<ForgetPasswordState> emit) {
    /// Call api send otp
    ApiServicesAccount().sendOtp(event.email);
    emit(InputEmailToVerifyEmailState(event.bloc, event.email));
  }

  FutureOr<void> verifyEmailToChangePasswordEvent(
      VerifyEmailToChangePasswordEvent event,
      Emitter<ForgetPasswordState> emit) {
    /// Call api confirm otp
    ApiServicesAccount().resetPassword(event.email, event.password, event.code);
    emit(VerifyEmailToChangePasswordState());
  }

  FutureOr<void> verifyEmailToInputEmailEvent(
      VerifyEmailToInputEmailEvent event, Emitter<ForgetPasswordState> emit) {
    emit(VerifyEmailToInputEmailState());
  }
}
