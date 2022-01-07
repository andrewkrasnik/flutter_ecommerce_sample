import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginSignUp());

  void haveAnAccount() {
    emit(LoginLogin());
  }

  void forgotPassword() {
    emit(LoginForgotPassword());
  }

  void toLoginState() {
    emit(LoginLogin());
  }

  void login(BuildContext context) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.of(context).pushNamedAndRemoveUntil("/main", (route) => true);
  }
}
