import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  RedButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.maxFinite,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(219, 48, 34, 1),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
