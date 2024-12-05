import 'dart:async';
import 'package:ecommerce_app_mobile/api/user_signin.dart';
import 'package:ecommerce_app_mobile/model/user/user_data_model.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'user_infomation_event.dart';

part 'user_infomation_state.dart';

class UserInformationBloc
    extends Bloc<UserInformationEvent, UserInformationState> {
  UserInformationBloc() : super(UserInformationInitial()) {
    on<UserInformationInitialEvent>(userInformationInitialEvent);
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
}

