import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String text;

  const RedButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(219, 48, 34, 1),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
