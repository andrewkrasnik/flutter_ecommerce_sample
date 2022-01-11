import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterColorButton extends StatelessWidget {
  final Color color;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final bool selected;

  FilterColorButton(
      {Key? key,
      required this.color,
      this.onTap,
      this.width = 44,
      this.height = 44,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height),
            border: selected
                ? Border.all(
                    color: const Color.fromRGBO(219, 48, 34, 1),
                  )
                : null,
          ),
          height: height,
          width: width,
          child: Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height - 10), color: color),
            height: height - 4,
            width: width - 4,
          ),
        ));
  }
}
