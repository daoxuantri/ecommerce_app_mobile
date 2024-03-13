import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:flutter/cupertino.dart';

import '../../../api/account.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

String errorthongbaoforgetpas = '';

String  emailtoanbo= '';

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

  Future<FutureOr<void>> inputEmailToVerifyEmailEvent(
      InputEmailToVerifyEmailEvent event, Emitter<ForgetPasswordState> emit) async {
    
    try{
      String? email1 = await UserSecurityStorage.getEmail();
      print(email1);
      String email2 = email1.toString();
      
      await ApiServicesAccount().sendOtp(email2);
      emit(InputEmailToVerifyEmailState(event.bloc, email2));
      emailtoanbo = email2;
    }catch(e){
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);

      }
      emit(InputCheckEmaiState(message : failToken));
    }

    
  }

  Future<FutureOr<void>> verifyEmailToChangePasswordEvent(
      VerifyEmailToChangePasswordEvent event,
      Emitter<ForgetPasswordState> emit) async {
    try{
      await ApiServicesAccount().resetPassword(emailtoanbo, event.code);
      emit(VerifyEmailToChangePasswordState(emailtoanbo));
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

  // Future<FutureOr<void>> verifyEmailToChangeOTPEvent(
  //     VerifyEmailToChangeOTPEvent event,
  //     Emitter<ForgetPasswordState> emit) async {
  //   try{
  //     await ApiServicesAccount().resetPassword(event.email, event.code);
  //     emit(VerifyEmailToChangePasswordState());
  //   }
  //   catch(e){
  //     String failToken = e.toString();
  //     if (failToken.startsWith('Exception: ')) {
  //       failToken = failToken.substring('Exception: '.length);
  //       errorthongbaoforgetpas = failToken;
  //     }
  //     emit(ForgetPasswordLoadingState());
  //     }
  //     }
  

  Future<FutureOr<void>> verifyEmailToInputEmailEvent(
      VerifyEmailToInputEmailEvent event, Emitter<ForgetPasswordState> emit) async {
      await ApiServicesAccount().sendOtp(event.email);   
      emit(VerifyEmailToInputEmailState());
  }

