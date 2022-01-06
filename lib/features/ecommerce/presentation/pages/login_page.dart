// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/castom_text_input.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  onTap: () {},
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
                const RedButton(text: "SIGN UP"),
                const SizedBox(
                  height: 60,
                ),
                const Text("Or sign up with social account",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 64,
                        width: 92,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: const Image(
                            image: AssetImage("assets/icons/google.png")),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 64,
                          width: 92,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Image(
                              image: AssetImage("assets/icons/facebook.png"))),
                    ),
                  ],
                ),
              ],
            ))
          ]),
        ),
      ),
    );
  }
}
