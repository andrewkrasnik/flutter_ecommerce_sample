// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/login/login_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/castom_text_input.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/login_socials.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        List<Widget> _elements = [];
        if (state is LoginSignUp) {
          _elements = [
            const Text("Sign up",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 73,
            ),
            Form(
                child: Column(
              children: [
                const CastomTextInput(
                  placeholder: "Name",
                ),
                const CastomTextInput(
                  placeholder: "Email",
                ),
                const CastomTextInput(
                  placeholder: "Password",
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).haveAnAccount();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Already have an account?",
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      Image.asset("assets/icons/arrow_right.png")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                RedButton(
                  text: "SIGN UP",
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).login(context);
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text("Or sign up with social account",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(
                  height: 20,
                ),
                LoginSocials(),
              ],
            ))
          ];
        } else if (state is LoginLogin) {
          _elements = [
            const Text("Login",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 73,
            ),
            Form(
                child: Column(
              children: [
                const CastomTextInput(
                  placeholder: "Email",
                ),
                const CastomTextInput(
                  placeholder: "Password",
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).forgotPassword();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Forgot your password?",
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      Image.asset("assets/icons/arrow_right.png")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                RedButton(
                  text: "LOGIN",
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).login(context);
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text("Or sign up with social account",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(
                  height: 20,
                ),
                LoginSocials(),
              ],
            ))
          ];
        } else if (state is LoginForgotPassword) {
          _elements = [
            const Text("Forgot password",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 73,
            ),
            Form(
                child: Column(
              children: [
                const Text(
                    "Please, enter your email address. You will receive "
                    "a link to create a new password via email.",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                const CastomTextInput(
                  placeholder: "Email",
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 12,
                ),
                RedButton(
                  text: "SEND",
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context).toLoginState();
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text("Or sign up with social account",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(
                  height: 20,
                ),
              ],
            ))
          ];
        } else if (state is LoginLoading) {
          _elements = [
            const Center(
              child: CircularProgressIndicator(),
            )
          ];
        }
        return WillPopScope(
          onWillPop: () => _onBackPressed(context),
          child: CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                leading: CupertinoButton(
                    onPressed: null,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                border: null,
                backgroundColor: Color(0xFFF9F9F9),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 18),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _elements),
                ),
              )),
        );
      },
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    bool res = await showCupertinoDialog<bool>(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text(
              'Are you sure?',
              style: TextStyle(fontSize: 22),
            ),
            content: const Text('Do you want to exit an App',
                style: TextStyle(fontSize: 16)),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: const Center(
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: const Center(
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false;
    return res;
  }
}
