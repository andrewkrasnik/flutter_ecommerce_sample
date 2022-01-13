import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class FieldWidget extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final bool selected;
  final VoidCallback? onTap;
  const FieldWidget(
      {Key? key,
      required this.text,
      this.onTap,
      this.height = 40,
      this.width = 138,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: selected ? AppColors.red : AppColors.grayText,
                width: 0.5),
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
