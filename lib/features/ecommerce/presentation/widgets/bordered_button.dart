import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? width;
  final double height;

  BorderedButton(
      {Key? key, required this.text, this.onTap, this.width, this.height = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
        ),
        height: height,
        width: width ?? double.maxFinite,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
