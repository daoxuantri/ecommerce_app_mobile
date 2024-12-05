import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_mobile/api/user_signin.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(signUpInitialEvent);
    on<SignUpClickedEvent>(signUpClickedEvent);
  }

  FutureOr<void> signUpInitialEvent(
      SignUpInitialEvent event, Emitter<SignUpState> emit) {
    emit(SignUpLoadingState());

    try {
      emit(SignUpLoadedSuccessState());
    } catch (e) {
      emit(SignUpErrorState(message: e.toString()));
    }
  }

  Future<FutureOr<void>> signUpClickedEvent(
      SignUpClickedEvent event, Emitter<SignUpState> emit) async {
    try {
      await ApiServiceUsers().signUpMini(event.email,
          event.phone, event.password, event.username);
      emit(SignUpClickedSuccessActionState());
    } catch (e) {
      String failToken = e.toString();
      if (failToken.startsWith('Exception: ')) {
        failToken = failToken.substring('Exception: '.length);
      }
      print(failToken);
      emit(SignUpClickedErrorActionState(message: failToken));
    }
  }
}
