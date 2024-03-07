part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

abstract class SignUpActionState extends SignUpState{}

class SignUpInitial extends SignUpState{}

class SignUpLoadingState extends SignUpState{}

class SignUpLoadedSuccessState extends SignUpState{}

class SignUpErrorState extends SignUpState {
  final String message;
  SignUpErrorState({
    required this.message,
  });
}

class SignUpClickedErrorActionState extends SignUpActionState {
  final String message;
  SignUpClickedErrorActionState({
    required this.message,
  });
}

class SignUpClickedSuccessActionState extends SignUpActionState{}
