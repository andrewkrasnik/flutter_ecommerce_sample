import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final bool selected;

  FilterButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.width = 40,
      this.height = 40,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: selected
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromRGBO(219, 48, 34, 1),
              ),
              height: height,
              width: width,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(),
              ),
              height: height,
              width: width,
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
