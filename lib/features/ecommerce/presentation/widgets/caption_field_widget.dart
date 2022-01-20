import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';

class CaptionFieldWidget extends StatelessWidget {
  final String caption;
  final String text;
  final double fontSize;
  final double captionfontSize;
  final FontWeight? fontWeight;
  const CaptionFieldWidget({
    Key? key,
    required this.caption,
    required this.text,
    this.fontSize = 11,
    this.captionfontSize = 11,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(caption,
            style: TextStyle(
                fontSize: captionfontSize, color: AppColors.grayText)),
        const SizedBox(
          width: 4,
        ),
        Text(text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
            ))
      ],
    );
  }
}
