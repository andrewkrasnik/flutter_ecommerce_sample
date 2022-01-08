part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginSignUp extends LoginState {}

class LoginLogin extends LoginState {}

class LoginForgotPassword extends LoginState {}

class LoginLoading extends LoginState {}
