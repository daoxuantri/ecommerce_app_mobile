part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {}

class SignUpClickedEvent extends SignUpEvent {
  final String email;
  final String phone;
  final String username;
  final String password;
  SignUpClickedEvent({
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
  });
}
