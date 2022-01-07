import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSocials extends StatelessWidget {
  const LoginSocials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 64,
            width: 92,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: const Image(image: AssetImage("assets/icons/google.png")),
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
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child:
                  const Image(image: AssetImage("assets/icons/facebook.png"))),
        ),
      ],
    );
  }
}
