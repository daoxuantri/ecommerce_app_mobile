import 'dart:async';
import 'package:ecommerce_app_mobile/api/account.dart';
import 'package:ecommerce_app_mobile/api/user_signin.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:ecommerce_app_mobile/security_user/secure_storage_user.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'user_infomation_event.dart';

part 'user_infomation_state.dart';

class UserInformationBloc
    extends Bloc<UserInformationEvent, UserInformationState> {
  UserInformationBloc() : super(UserInformationInitial()) {
    on<UserInformationInitialEvent>(userInformationInitialEvent);
    on<ResetPassEventClickEvent>(resetPassEventClickEvent);
  }

  FutureOr<void> userInformationInitialEvent(UserInformationInitialEvent event,
      Emitter<UserInformationState> emit) async {
    emit(UserInformationLoading());
    try {
      UserDataModel profile = await ApiServiceUsers().getDetailUser();
      emit(UserInformationInitialState(profile));
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(UserInformationError(failToken));
    }
  }

  FutureOr<void> resetPassEventClickEvent(ResetPassEventClickEvent event,
      Emitter<UserInformationState> emit) async {
    emit(UserInformationLoading());
    try {
      var profile = await ApiServicesAccount().resetPassword(event.email, event.password);
      emit(ResetPassEventClickState());
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      emit(UserInformationError(failToken));
    }
  } 
}

