import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double height;

  RedButton(
      {Key? key, required this.text, this.onTap, this.width, this.height = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(219, 48, 34, 1),
        ),
        height: height,
        width: width ?? double.maxFinite,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
