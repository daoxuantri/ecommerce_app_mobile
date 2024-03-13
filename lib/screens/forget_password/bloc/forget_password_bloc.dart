import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/screens/forget_password/model/bloc_forgot.dart';
import 'package:flutter/cupertino.dart';

import '../../../api/account.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

String errorthongbaoforgetpas = '';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<ForgetPasswordInitialEvent>(forgetPasswordInitialEvent);
    on<ForgetPasswordToInputEmailEvent>(forgetPasswordToInputEmailEvent);
    on<ForgetPasswordToInputPhoneEvent>(forgetPasswordToInputPhoneEvent);
    on<InputEmailToVerifyEmailEvent>(inputEmailToVerifyEmailEvent);
    on<VerifyEmailToChangeOTPEvent>(verifyEmailToChangeOTPEvent);
    on<VerifyEmailToInputEmailEvent>(verifyEmailToInputEmailEvent);
    on<VerifyEmailToChangePasswordEvent>(verifyEmailToChangePasswordEvent);
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

  Future<FutureOr<void>> inputEmailToVerifyEmailEvent(
      InputEmailToVerifyEmailEvent event, Emitter<ForgetPasswordState> emit) async {
    try{
      
      await ApiServicesAccount().sendOtp(event.email);
      emit(InputEmailToVerifyEmailState(event.bloc, event.email));
    }catch(e){
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(InputCheckEmaiState(message : failToken));
    }

    
  }

  Future<FutureOr<void>> verifyEmailToChangeOTPEvent(
      VerifyEmailToChangeOTPEvent event,
      Emitter<ForgetPasswordState> emit) async {
    try{
      await ApiServicesAccount().checkVerifyOTPforEmail(event.email, event.code);
      emit(VerifyEmailToChangeOTPState(event.bloc, event.email));
    }
    catch(e){
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
        errorthongbaoforgetpas = failToken;
      }
      emit(InputCheckEmaiState(message: failToken));
      }
    }
    }
  Future<FutureOr<void>> verifyEmailToInputEmailEvent(
      VerifyEmailToInputEmailEvent event, Emitter<ForgetPasswordState> emit) async {
      await ApiServicesAccount().sendOtp(event.email);   
      emit(VerifyEmailToInputEmailState());
  }

  Future<FutureOr<void>> verifyEmailToChangePasswordEvent(
      VerifyEmailToChangePasswordEvent event,
      Emitter<ForgetPasswordState> emit) async {
    try{
      await ApiServicesAccount().resetPassword(event.email, event.password);
      emit(VerifyEmailToChangePasswordState());
    }
    catch(e){
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
        errorthongbaoforgetpas = failToken;
      }
      emit(InputCheckEmaiState(message: failToken));
      }
    }
    

