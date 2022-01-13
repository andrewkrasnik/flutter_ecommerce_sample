import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final bool selected;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;

  FilterButton({
    Key? key,
    required this.text,
    this.onTap,
    this.width = 40,
    this.height = 40,
    this.borderRadius = 5,
    this.selected = false,
    this.backgroundColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: selected
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: AppColors.red,
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
                borderRadius: BorderRadius.circular(borderRadius),
                color: backgroundColor,
                border: Border.all(color: borderColor ?? AppColors.black),
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
