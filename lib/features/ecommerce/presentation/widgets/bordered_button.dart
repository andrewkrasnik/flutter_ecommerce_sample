import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double height;
  final Color? color;

  const BorderedButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.width,
      this.height = 48,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: color ?? Colors.black),
        ),
        height: height,
        width: width ?? double.maxFinite,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: color),
          ),
        ),
      ),
    );
  }
}
